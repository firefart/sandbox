(Get-Content sandbox.wsb.template).replace('__SANDBOX__', $PSScriptRoot) | Set-Content .\sandbox.wsb
