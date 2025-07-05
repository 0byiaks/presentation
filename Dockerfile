#------------- Stage 1: Build ---------------
FROM golang:1.21 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy Go files into the container
COPY . .

# Build the Go binary
RUN CGO_ENABLED=0 GOOS=linux go build -a -o myapp

# ------------ Stage 2: Run -------------
FROM alpine:latest

# Create a non-root user
RUN adduser -D appuser

# Set working directory
WORKDIR /home/appuser

# Copy the binary from the builder
COPY --from=build /app/myapp .

# Switch to the non-root user
USER appuser

# Expose port 8080
EXPOSE 8080

# Run the app
CMD [ "./myapp" ]