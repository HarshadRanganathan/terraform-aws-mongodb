build {
    name    = "ami"
    sources = [
        "source.amazon-ebs.mongodb"
    ]

    provisioner "file" {
        source      = "./files/mongodb-org-5.0.repo"
        destination = "/tmp/mongodb-org-5.0.repo"
    }

    provisioner "file" {
        source      = "./files/mongod.conf"
        destination = "/tmp/mongod.conf"
    }

    # provisioner "file" {
    #     source      = "./files/boot.sh"
    #     destination = "/tmp/boot.sh"
    # }

    provisioner "shell" {
        environment_vars = [
            "MONGO_VERSION=${var.mongo_version}"
        ]
        scripts         = [
            "./scripts/provisioning.sh"
        ]
        pause_before    = "10s"
    }
}