FROM python:3.9
RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH
WORKDIR $HOME/app
COPY --chown=user . $HOME/app
COPY ./requirements.txt ~/app/requirements.txt
EXPOSE 7860
RUN pip install -r requirements.txt
COPY . .
#CMD ["chainlit", "run", "app.py", "--port", "7860"]
#CMD ["chainlit", "run", "app.py", "-h", "0.0.0.0", "--port", "7860"]

CMD ["chainlit", "run", "app.py", "--host", "0.0.0.0", "--port", "7860"]
