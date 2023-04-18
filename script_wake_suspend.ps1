# Definir a hora de suspensão e reinício
$suspendTime = "hh:mm"
$wakeupTime = "hh:mm"

# Cria os objetos de gatilho e ação da tarefa de suspensão
$target1 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Monday 
$target2 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Tuesday 
$target3 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Wednesday
$target4 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Thursday 
$target5 = New-ScheduledTaskTrigger -Weekly -at  $suspendTime -DaysOfWeek Friday 

      # Cria os objetos de gatilho e ação da tarefa de retomada
$target6 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Monday 
$target7 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Tuesday 
$target8 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Wednesday
$target9 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Thursday 
$target0 = New-ScheduledTaskTrigger -Weekly -at  $wakeupTime -DaysOfWeek Friday  

      # Cria os objetos de ação da tarefa de suspensão
$SuspendAction = New-ScheduledTaskAction -Execute "C:\Windows\System32\psshutdown.exe " -Argument "-d -t 0"

      # Cria os objetos de ação da tarefa de retomada
$ResumeAction = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "[System.Windows.Forms.SendKeys]::SendWait ('ENTER')"

$settings = New-ScheduledTaskSettingsSet -WakeToRun

# Cria as tarefas agendadas de suspensão e retomada
Register-ScheduledTask -TaskName "Suspender o Computador" -Trigger $target1,$target2,$target3,$target4,$target5 -Action $SuspendAction -RunLevel Highest -Settings $settings
Register-ScheduledTask -TaskName "Ligar o Computador" -Trigger $target6,$target7,$target8,$target9,$target0 -Action $ResumeAction -RunLevel Highest -Settings $settings
