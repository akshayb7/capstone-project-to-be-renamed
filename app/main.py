from nlp import NLP
from fastapi import FastAPI
from pydantic import BaseModel

class Message(BaseModel):
    text: str

app = FastAPI()
nlp = NLP()

@app.post("/sentiment/")
async def sentiment_analysis(message: Message):
    sentiment = nlp.predict_sentiment(message.text)
    return sentiment

# use uvicorn main:app --reload to run the server