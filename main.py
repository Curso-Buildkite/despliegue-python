from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hola": "Mundo"}


@app.get("/nombre/{nombre}")
def read_item(nombre: str):
    return {"Hola": nombre}
