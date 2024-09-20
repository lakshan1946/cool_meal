from pymongo import MongoClient
from pymongo.errors import ConnectionFailure, OperationFailure
from models.session_template import SessionTemplate
from dotenv import load_dotenv

import os

load_dotenv()
# Replace the following with your MongoDB Atlas connection string
MONGODB_URI = os.getenv("MONGODB_URI")

# Initialize the MongoDB client
try:
    client = MongoClient(MONGODB_URI)
    print("Connected to MongoDB Atlas ---------------------------- ")
except ConnectionFailure as e:
    print(f"Could not connect to MongoDB: {e}")


# Select the database and collection
db = client["cool-meal"]  # Change to your database name
session_collection = db["session_collection"]  # Change to your collection name

print("Connected to the database and collection ---------------------------- ")


# Create (Insert)
async def create_session(session_template: SessionTemplate):
    print("session_template -------------- ", session_template)
    try:
        result = session_collection.insert_one(
            session_template.dict()
        )  # Convert Pydantic model to dict
        print(f"User inserted with ID: {result}")
    except OperationFailure as e:
        print(f"Insert operation failed: {e}")
