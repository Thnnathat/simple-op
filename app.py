from fastapi import FastAPI

# Create an instance of FastAPI
app = FastAPI()

# Define a route for the root URL ("/")
@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

@app.get("/new")
def new_endpoint():
    return {"message": "New"}

@app.get("/new")
def new_endpoint():
    return {"message": "New"}

@app.get("/new2")
def new_endpoint2():
    return {"message": "New3"}