# Start from the official Go image
FROM golang:1.20-alpine

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum and download dependencies
COPY go.mod ./
RUN go mod tidy

# Copy the source code
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port
EXPOSE 8080

# Command to run the app
CMD ["./main"]
