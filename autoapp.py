# -*- coding: utf-8 -*-
"""Create an application instance."""
from flaskshop.app import create_app
import sys

sys.path.append("/home/phuongdai/Downloads/STU/flask-shop")

app = create_app()

if __name__ == "__main__":
    app.run()
