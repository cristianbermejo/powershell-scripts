param ($Domain = $(Throw "Domain parameter is required."))

function Test-CLIConfig {    
    if (
        (Get-Command aws -ErrorAction SilentlyContinue)`
        -And (Test-Path $env:UserProfile\.aws\config)`
        -And (Test-Path $env:UserProfile\.aws\credentials)
        ) {
            Return $True
        } else {
            Throw "Please install and configure AWS CLI."
        } 
}

if (Test-CLIConfig) {
    $Output = aws codeartifact get-authorization-token --domain $Domain --query authorizationToken --output text *>&1

    if ($?) {
        $env:CODEARTIFACT_AUTH_TOKEN = $Output
        [Environment]::SetEnvironmentVariable("CODEARTIFACT_AUTH_TOKEN", $env:CODEARTIFACT_AUTH_TOKEN, "User")
        Get-ChildItem Env:CODEARTIFACT_AUTH_TOKEN
    } else {
        Throw $Output
    }
}