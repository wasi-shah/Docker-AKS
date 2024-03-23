mkdir helloworld 
cd helloworld
dotnet new console -o App -n helloworld
cd App
dotnet run




docker build -t aspnet-cousole-counter-image -f Dockerfile .
docker tag aspnet-cousole-counter-image wasishah102/aspnet-cousole-counter-image
docker push wasishah102/aspnet-cousole-counter-image

az aks get-credentials -n mycluster -g aksrg


kubectl run consoleapp --image=wasishah102/aspnet-cousole-counter-image
kubectl logs consoleapp -f
