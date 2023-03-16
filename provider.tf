provider "google" {
    project     = <your-project-name>
    region      = <your-region>
    credentials = file(path/to/your/json/key)
}

provider "helm" {
    kubernetes {
        config_context_cluster = "gke-terraform-learn"
    }
}
