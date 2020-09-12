from transformers import pipeline

class NLP:
    def __init__(self):
        self.pipe = pipeline(
            "sentiment-analysis",
            model="distilbert-base-uncased-finetuned-sst-2-english",
            tokenizer="distilbert-base-uncased-finetuned-sst-2-english"
            )

    def predict_sentiment(self, text: str):      
        result = self.pipe(text)[0]
        return f"label: {result['label']}, with score: {round(result['score'], 4)}"
