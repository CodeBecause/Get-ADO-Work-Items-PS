$token = "ADD PAT"

$url="https://dev.azure.com/codebecause0069/ADO%20Tutorials/_apis/wit/wiql?api-version=5.1"

$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($token)"))

$JSON = @'
{
  "query": "SELECT [System.Id],[System.Title],[System.State] FROM workitems WHERE [System.TeamProject] = @project AND [system.WorkItemType] = 'Task' "
}
'@

$response = Invoke-RestMethod -Uri $url -Headers @{Authorization = "Basic $token"} -Method Post -Body $JSON -ContentType application/json

Write-Host "result = $($response | ConvertTo-Json -Depth 100)"