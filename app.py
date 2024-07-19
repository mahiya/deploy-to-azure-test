import os
from flask import Flask
from dotenv import load_dotenv

app = Flask(__name__)
load_dotenv()


@app.route("/", methods=["GET"])
def debug():
    return {key: value for key, value in os.environ.items()}


if __name__ == "__main__":
    app.run()
