job "hello" {
  datacenters = ["dc1"]
  type        = "service"

  group "hello-group" {
    count = 1

    restart {
      attempts = 1
      interval = "5m"
      delay    = "10s"
      mode     = "fail"
    }

    task "hello-task" {
      driver = "docker"

      config {
        image = "devops-final-hello:v1"
      }

      resources {
        cpu    = 100
        memory = 64
      }
    }
  }
}
