from diagrams import Diagram, Cluster
from diagrams.gcp.network import LoadBalancing
from diagrams.gcp.storage import Storage
from diagrams.onprem.client import Client

with Diagram("system-architecture", show=False, direction="TB"):
    client = Client("インターネット")

    with Cluster("Google Cloud Platform"):
        lb = LoadBalancing("外部HTTPSロードバランサ")
        bucket1 = Storage("バックエンドバケット1")
        bucket2 = Storage("バックエンドバケット2")

    client >> lb
    lb >> bucket1
    lb >> bucket2
