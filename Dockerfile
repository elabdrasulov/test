FROM ubuntu

WORKDIR /

COPY . .

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt install -y python3-pip

RUN pip install --upgrade pip
RUN pip install wheel gunicorn
RUN pip install -r req.txt

ENV SECRET_KEY=@f5+((fms_-@5#+()1$hg2$z1m&lnca%3sd%kbdl$7f&bs=e3f
ENV DB_USER=
ENV DB_PASSWORD=
ENV DB_NAME=
ENV DB_PORT=
ENV DB_HOST=
ENV ALLOWED_HOSTS=localhost,
ENV DEBUG=1


CMD gunicorn --bind 0.0.0.0:8000 config.wsgi:application

