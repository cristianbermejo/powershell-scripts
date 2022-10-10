# Set-CodeArtifactToken
Gets a CodeArtifact token and saves it to the user's environment variables as described on [the AWS documentation](https://docs.aws.amazon.com/codeartifact/latest/ug/tokens-authentication.html#env-var).

## Requirements

- [AWS CLI](https://aws.amazon.com/es/cli/)

## Usage

```
.\Set-CodeArtifactToken.ps1 -Domain my-domain
```

## Notes

- Make sure to download and configure AWS CLI first. This script will only work if:
  - ```aws.exe``` is in path.
  - Both ```%USERPROFILE%\.aws\config``` and ```%USERPROFILE%\.aws\credentials``` exist.
- The obtained token will be saved to the ```CODEARTIFACT_AUTH_TOKEN``` environment variable.