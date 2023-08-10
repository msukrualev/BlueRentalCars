 I used a Full-Stack application that includes Java-React-Node.js frameworks. After the application was uploaded to GitHub, I first selected the images that fit the application and infrastructure requirements. Then, I wrote Dockerfiles, built the application, and converted it into images. 
Afterward, I sent them to ECR. Following that, I created my Docker Compose file.
Using the Kompose.io tool, I transformed the Docker Compose file into Kubernetes manifests.
 For my cluster, I installed a  Nginx Ingress Controller, which serves for load balancing and network traffic redirection.
Then I made network, volume, and namespace settings in manifest files.

When it comes to Aws-cloud infastructure.

I created a Jenkins server and a private VPC within the cloud infrastructure using Terraform.
I wrote necessary Bash scripts for the infrastructure.
With the help of Ansible Playbooks, I carried out configuration adjustments.
Using a Cloud Formation template, I created Kubernetes nodes on AWS.
Then, I transformed all of these steps into a comprehensive CI/CD process. For this purpose, I used Jenkins with Pipelines and Freestyle projects to deploy my application onto the Kubernetes cluster. After publishing my application, I tested and monitored metrics and system resources using Prometheus and Grafana.


![project_00](https://github.com/msukrualev/BlueRentalCars/assets/121056799/d61a83d5-455d-4f13-adb1-1af9a5bd2b2e)
