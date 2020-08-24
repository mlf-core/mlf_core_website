FROM python:3.8.1-alpine

RUN pip install mlf_core_website

CMD mlf_core_website
