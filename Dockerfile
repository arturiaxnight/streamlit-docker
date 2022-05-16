FROM python:3.8.13-slim
LABEL maintainer="Arthur C.Y. Cheng arturiaxnight@gmail.com"

EXPOSE 8501

WORKDIR /app
COPY requirements.txt .

RUN apt update && apt install -y build-essential
RUN pip install --upgrade pip
RUN pip install pycaret[full]
RUN pip install streamlit
RUN pip install -r requirements.txt

COPY ./src /examples
ENTRYPOINT [ "streamlit", "run"]
CMD ["/examples/intro.py"]
