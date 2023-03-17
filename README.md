AltSchool Third Semester Exam

<h1>Deploying microservices applications with Kubernetes</h1>

<h2>Prerequisites</h2>
Before you get started, make sure you have the following prerequisites:

• A Google Cloud Platform account with billing enabled.   

• The Google Cloud SDK installed on your local machine.

• Terraform CLI installed on your local machine.

• A domain name registered and accessible via DNS.

Steps

-Create a new Google Cloud project

-Create a new project in the Google Cloud Console, and enable the Kubernetes Engine API. This will allow you to deploy a Kubernetes cluster using Terraform.

-Create a service account for Terraform

-Create a new service account with the necessary permissions to manage your GCP resources. For example, you can grant the Kubernetes Engine Admin role to this service account. Download the JSON key file for this service account, as you will need it to authenticate with the GCP API.

<h3>Step 1: Set up the Google Kubernetes Engine</h3>
Add your credentials (project ID, region and .JSON keyy file) to the provider.tf and variables.tf files.

In a terminal running in the directory that contains the .tf files, run:

<pre><code>terraform init
</code></pre>

After Terraform has initialized, run: 

<pre><code>terraform plan
</code></pre>
to see the infrastructure to be created. This particular config will create a GKE cluster with 2 node pools.

Next you run:

<pre></code>terraform apply
</code></pre>

to build the cluster. 

<h3>Clone the Sock Shop App</h3>
Clone the Sock Shop repository into the cluster and access the cloned repo by running the following code in the Google Cloud Console:

<pre><code>git clone https://github.com/microservices-demo/microservices-demo.git
cd microservices-demo
cd deploy/kubernetes
</code></pre>

<h3>Deploy the Sock Shop Application</h3>
Now that you've cloned the repository, run the following code to deploy it:

<pre><code>kubectl create namespace sock-shop
kubectl apply -f complete-demo.yaml
</code></pre>

Expose the Sock Shop service to get the external IP
<pre><code>kubectl expose service front-end --name=front-end-lb --port=80 --target-port=8079 --type=LoadBalancer --namespace=sock-shop
</pre></code>

The ExternalIP is then revealed, and you can use this to view the Sock Shop app.
