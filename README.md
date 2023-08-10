 I used a Full-Stack application that includes Java-React-Node.js frameworks. After the application was uploaded to GitHub, I first selected the images that fit the application and infrastructure requirements. Then, I wrote Dockerfiles, built the application, and converted it into images. 
Afterward, I sent them to ECR. Following that, I created my Docker Compose file.
Using the Kompose.io tool, I transformed the Docker Compose file into Kubernetes manifests.
 For my cluster, I installed a  Nginx Ingress Controller, which serves for load balancing and network traffic redirection.
Then I made network, volume, and namespace settings in manifest files.

 


![project_00](https://github.com/msukrualev/BlueRentalCars/assets/121056799/d61a83d5-455d-4f13-adb1-1af9a5bd2b2e)
