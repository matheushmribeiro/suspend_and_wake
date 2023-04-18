# Definir a hora de suspensão e reinício
$suspendTime = "hh:mm"
$wakeupTime = "hh:mm"


    # Verificar se é dia útil e se é hora de suspender
    if((Get-Date).DayOfWeek -ge "Monday" -and (Get-Date).DayOfWeek -le "Friday" -and (Get-Date).ToString("HH:mm") -eq $suspendTime) 
    {
        # Executar o PSShutdown para suspender o Windows
        C:\Windows\System32\psshutdown.exe -d -t 0
        write-host "Suspendendo"
    }
    
    # Verificar se é hora de ligar
    ## Simula o toque na tecla ENTER do teclado
    if((Get-Date).ToString("HH:mm") -eq $wakeupTime) {
        # Executar o PSShutdown para reiniciar o Windows
         [void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
         [Microsoft.VisualBasic.Interaction]::AppActivate((Get-Process -Id $pid).MainWindowTitle) 
         [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
             write-host "voltando da suspensão"
    }

