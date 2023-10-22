# Create reports folder
#sudo mkdir $REPORTS_DIR && sudo chmod 777 $REPORTS_DIR
REPORTS_DIR=$(pwd)/$ROBOT_REPORTS_DIR
TESTS_DIR=$(pwd)/$ROBOT_TESTS_DIR
RESOURCES_DIR=$(pwd)/$ROBOT_RESOURCES_DIR


#Variables
#--user $(id -u):$(id -g) \
docker run --user $(id -u):$(id -g) --shm-size=$ALLOWED_SHARED_MEMORY \
  -e BROWSER=$BROWSER \
  -e ROBOT_THREADS=$ROBOT_THREADS \
  -e PABOT_OPTIONS="$PABOT_OPTIONS" \
  -e ROBOT_OPTIONS="$ROBOT_OPTIONS" \
  -e ROBOT_USER_LOGIN="$ROBOT_USER_LOGIN" \
  -e ROBOT_USER_PASSWORD="$ROBOT_USER_PASSWORD" \
  -v $REPORTS_DIR:/opt/robotframework/reports:Z \
  -v $TESTS_DIR:/opt/robotframework/tests:Z \
  -v $RESOURCES_DIR:/opt/robotframework/resources:Z \
  $ROBOT_RUNNER_IMAGE
