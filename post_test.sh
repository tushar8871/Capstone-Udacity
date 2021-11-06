aws eks update-kubeconfig --name capstone
APP_URL=$(kubectl get service capstone=svc | grep 'amazonaws.com' | awk '{print $4}')
sleep 30
OUTPUT=$(curl --silent ${APP_URL})
STATUS_CODE=$(curl -o /dev/null --silent -w "%{http_code}\n" ${APP_URL})
if [ $STATUS_CODE -eq 200 ]; then
  echo "Test Case1: Check Status Code: OK"
else 
  echo "Deployment failed"
  exit 1
fi