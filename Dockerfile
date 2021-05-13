FROM public.ecr.aws/p8v8e7e5/myartifacts:alpine-3.8
RUN apk add python py-pip && \
python -m ensurepip && \
pip install --upgrade pip && \
pip install flask
ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

ENV FLASK_APP app.py
ENV PLATFORM 'Amazon EKS'

WORKDIR /app
COPY . /app/

CMD ["python", "app.py"]
