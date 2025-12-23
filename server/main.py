from fastapi import Depends, FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from database.db_session import get_session
from sqlalchemy.orm import Session
from dotenv import load_dotenv

from tools.pdf_procesor import ProcessorPDF


load_dotenv()
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "http://localhost:3001",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def home():
    return {"message": "¡Hola, FastAPI !"}

@app.post("/manuals/upload")
async def upload_pdf(
        file: UploadFile = File(...), db_session: Session = Depends(get_session)
):
    result = ProcessorPDF(file).process_and_embedding_pdf(db_session)
    return result


