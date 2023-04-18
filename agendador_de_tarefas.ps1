####
$suspendTime = "xx:xx"
$wakeupTime = "xx:xx"


# Cria os objetos de gatilho e ação da tarefa de suspensão
$target1 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Monday 
$target2 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Tuesday 
$target3 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Wednesday
$target4 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Thursday 
$target5 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Friday 
# Cria os objetos de gatilho e ação da tarefa de religamento
$target6 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Monday 
$target7 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Tuesday 
$target8 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Wednesday
$target9 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Thursday 
$target0 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Friday  

#define a variavel para executar a ação 
$SuspendAction = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "C:\caminho_do_arquivo\script_suspend_and_wake.ps1 "


$ResumeAction = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "C:\caminho_do_arquivo\script_suspend_and_wake.ps1"

$settings = New-ScheduledTaskSettingsSet -WakeToRun

# Cria as tarefas agendadas de suspensão e retomada
Register-ScheduledTask -TaskName "Suspender o Computador" -Trigger $target1,$target2,$target3,$target4,$target5 -Action $SuspendAction -RunLevel Highest -Settings $settings
Register-ScheduledTask -TaskName "Ligar o Computador" -Trigger $target6,$target7,$target8,$target9,$target0 -Action $ResumeAction -RunLevel Highest -Settings $settings
