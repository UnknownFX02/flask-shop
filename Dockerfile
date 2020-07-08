### Build and install packages
FROM python:3.8

# Install Python dependencies
COPY . /app
WORKDIR /app

RUN pip install -i https://pypi.douban.com/simple -r requirements.txt

CMD ["flask", "run"]
