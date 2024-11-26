# Start from the latest golang base image
FROM python:3.10.15

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files first; they are less frequently changed than source code, so Docker can cache this layer
COPY app.py requirements.txt ./

# Download all dependencies
# RUN pip install virtualenv
# RUN python3 -m venv venv
# RUN source venv/bin/activate
RUN pip install -r requirements.txt

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

EXPOSE 8989

# Command to run the executable
CMD ["uvicorn", "app:app", "--port", "8989"]  