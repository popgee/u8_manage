@echo off
echo *********************************
echo  U8ѧ���˽��̹�����v1.0 
echo  By popgeek / www.fune.fun 
echo *********************************
echo 1��ɱ��U8ѧ���˼�ؽ���
echo 2����������U8ѧ���˽���
echo.&echo.
set /p a=������1��2���س�:
if "%a%"=="1" Goto function1
if "%a%"=="2" Goto function2

:function1
Echo ����ɱ��U8ѧ���˽���
Echo *********************************
taskkill /f /im U8DispatchService.exe
taskkill /f /im U8KeyManagePool.exe
taskkill /f /im U8MPool.exe
taskkill /f /im U8SCMPool.exe
taskkill /f /im U8TaskService.exe
taskkill /f /im U8WebPool.exe
taskkill /f /im UFIDA.U8.UAP.ReportService.exe
taskkill /f /im StudentMain.exe

Echo ���ڽ���ѧ���˷���
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
Echo ֹͣѧ����ض˳ɹ�����������˳���

pause&null
goto end

:function2

@Echo off

Echo ��������U8ѧ���˷��� - �ù��̿�����Ҫ1���ӻ����
Echo �ȴ��������벻Ҫ�رմ��ڻ��������������κ��ַ�
Echo �ű�ִ����ɺ����ʾ��ȫ�������ɹ���
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
Echo ��������U8ѧ���˼�س��� StudentMain.exe
start /d "C:\Program Files (x86)\Mythware\������ӽ������ v4.0 2015 ������\" StudentMain.exe
Echo *********************************
Echo ȫ�������ɹ�����������˳���
pause&null

goto end

:end
echo complete