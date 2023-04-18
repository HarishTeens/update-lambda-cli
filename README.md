# update-lambda-cli
This is intended mostly for amplify users who wish to deploy individual lambda functions instead of doing a "amplify push"

### Steps
- place the `lambda-deploy.sh` file in the root directory of your lambda functions.
- Adjust the permissions using this command: `chmod u+x lambda_deploy.sh` <i>one time</i>
- Deploy the functions like: `./lambda_deploy.sh [...args]` <i>the args here are the function names</i>


*Note: the CLI expects the lambda function name to be same the folder name*

### Here is an example in an Amplify Project

```python
# Setup
cd amplify/backend/function/
chmod u+x lambda_deploy.sh # one time
# Usage
./lambda_deploy.sh [...args] # the args here are the function names
# Lets say you want to deploy goSatsAuthentication & goSatsEngine, then do
./lambda_deploy.sh goSatsAuthentication goSatsEngine
```

### Example Output
<img width="1200" alt="Screenshot 2023-04-14 at 10 07 53 AM" src="https://user-images.githubusercontent.com/33366456/231943054-d37090e9-0bcd-4747-aaf9-f07be4490a9f.png">
