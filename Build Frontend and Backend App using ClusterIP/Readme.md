# Create an app which is split into the following
* Frontend app - An nginx app which connects to the backend app using proxy_pass
* Frontend Loadbalancer service: To display the result on the web browser through public IP
* Backend app - An nginx app which displays Node and Pod details
* Cluster IP (for backend app): To allow the frontend app to communicate to the backend app

## Create a backend nginx app


