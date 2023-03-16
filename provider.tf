provider "google" {
    project     = "gke-project-377310"
    region      = "us-central1-c"
    credentials = file("C:/Users/FLEX14/Downloads/cred.json")
}

provider "helm" {
    kubernetes {
        config_context_cluster = "gke-terraform-learn"
    }
}