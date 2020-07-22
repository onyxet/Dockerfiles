FROM python:3.8.5-slim

RUN pip install mlflow==1.10.0 \
    && pip install mlflow[extras]==1.10.0 \
    && pip install PyMySQL==0.9.3 \   
    && pip install psycopg2-binary==2.8.5 \
    && pip install google-cloud-storage

ENTRYPOINT ["mlflow", "server"]