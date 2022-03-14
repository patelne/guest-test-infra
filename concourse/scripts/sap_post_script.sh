# Don't run this script on the scaleout nodes
if hostname | grep -qe '.*w[0-9]$'; then
  exit 0
fi

if grep -q "ERROR - Deployment Exited" /var/log/messages; then
    echo "ERROR" > result.txt
else
    echo "SUCCESS" > result.txt
fi
gsutil cp result.txt gs://__BUCKET__/workload-tests/sap/__RUNID__/run_result
sudo gsutil cp /var/log/messages gs://__BUCKET__/workload-tests/sap/__RUNID__/messages_log