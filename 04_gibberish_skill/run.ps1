$ErrorActionPreference = "Stop"

function Invoke-Vally {
    & vally @args
    if ($LASTEXITCODE -ne 0) {
        throw "vally exited with code $LASTEXITCODE"
    }
}

Push-Location $PSScriptRoot
try {
    # Invoke-Vally lint . --eval-spec .\eval-skill-activation.yaml
    # Invoke-Vally lint . --eval-spec .\eval-token-efficiency.yaml
    # Invoke-Vally eval --eval-spec .\eval-skill-activation.yaml

    # The shorthand:
    # vally experiment run .\token-efficiency.experiment.yaml --compare
    # but it doesn't accept the --judge-model option, and defaults to the claude-sonnet-4.6 in Vally 0.15.0 which might not be available

    Invoke-Vally experiment run .\token-efficiency.experiment.yaml

    $experiment = Get-ChildItem .\vally-experiment-results -Directory |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1

    Invoke-Vally compare $experiment.FullName --judge-model claude-sonnet-5
}
finally {
    Pop-Location
}
