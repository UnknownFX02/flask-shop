from locust import HttpUser, TaskSet, task
from random import randint


class WebsiteTasks(TaskSet):
    def on_start(self):
        self.index()

    @task(2)
    def index(self):
        self.client.get("/")
    
    @task(1)
    def about(self):
        self.client.get("/page/about")


class WebsiteUser(HttpUser):
    task_set = WebsiteTasks
    host = "http://127.0.0.1:5000"
    min_wait = 1000
    max_wait = 5000

    @task(4)
    def products(self):
        url = "/products/%s" % (randint(1, 50))
        self.client.get(str(url))

    @task(3)
    def categorys(self):
        url = "/products/category/%s" % (randint(1, 6))
        self.client.get(str(url))

    @task(2)
    def index(self):
        self.client.get("/")

    @task(1)
    def about(self):
        self.client.get("/page/about")
