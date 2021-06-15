@echo off
echo *********************************
echo  U8学生端进程管理工具v1.0 
echo  By popgeek / www.fune.fun 
echo *********************************
echo 1、杀死U8学生端监控进程
echo 2、重新启动U8学生端进程
echo.&echo.
set /p a=请输入1或2并回车:
if "%a%"=="1" Goto function1
if "%a%"=="2" Goto function2

:function1
Echo 正在杀死U8学生端进程
Echo *********************************
taskkill /f /im U8DispatchService.exe
taskkill /f /im U8KeyManagePool.exe
taskkill /f /im U8MPool.exe
taskkill /f /im U8SCMPool.exe
taskkill /f /im U8TaskService.exe
taskkill /f /im U8WebPool.exe
taskkill /f /im UFIDA.U8.UAP.ReportService.exe
taskkill /f /im StudentMain.exe

Echo 正在禁用学生端服务
Echo *********************************
sc stop "STUDSRV"
sc stop "UFNet"
sc stop "U8DispatchService"
sc stop "U8KeyManagePool"
sc stop "U8MPool"
sc stop "U8SCMPool"
sc stop "U8TaskService"
sc stop "U8WebPool"
sc config "STUDSRV" start= disabled
sc config "UFNet" start= disabled
sc config "U8DispatchService" start= disabled
sc config "U8KeyManagePool" start= disabled
sc config "U8MPool" start= disabled
sc config "U8SCMPool" start= disabled
sc config "U8TaskService" start= disabled
sc config "U8WebPool" start= disabled
Echo *********************************
Echo 停止学生监控端成功！按任意键退出。

pause&null
goto end

:function2

@Echo off

Echo 正在启用U8学生端服务 - 该过程可能需要1分钟或更久
Echo 等待过程中请不要关闭窗口或在命令行输入任何字符
Echo 脚本执行完成后会显示“全部启动成功”
Echo *********************************
sc config "STUDSRV" start= auto
sc config "UFNet" start= auto
sc config "U8DispatchService" start= auto
sc config "U8KeyManagePool" start= auto
sc config "U8MPool" start= auto
sc config "U8SCMPool" start= auto
sc config "U8TaskService" start= auto
sc config "U8WebPool" start= auto
net start "STUDSRV"
net start "UFNet"
net start "U8DispatchService"
net start "U8KeyManagePool"
net start "U8MPool"
net start "U8SCMPool"

net start "U8TaskService"
net start "U8WebPool"
Echo *********************************
Echo 正在启动U8学生端监控程序 StudentMain.exe
start /d "C:\Program Files (x86)\Mythware\极域电子教室软件 v4.0 2015 豪华版\" StudentMain.exe
Echo *********************************
Echo 全部启动成功！按任意键退出。
pause&null

goto end

:end
echo complete