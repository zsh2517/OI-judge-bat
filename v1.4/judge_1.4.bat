@echo off
rem ����������
rem ������ܻ�û�������ڰ���ҳ������helpmore��ȡ�����ﲻ��д̫�࣬Ҫ���Ͳ����ҵ���ʼ�������ˡ���
rem ֻ��Ҫ�Ķ�����ľ���
REM ��ʼ������
	set recomment=1
	rem �Ƿ���ʾ����İ�����Ϣ 1.��ʾ 2.����ʾ
	rem ����ĳ��������ļ�������һ������������չ��
	set input=in
	rem �������������ļ�����չ����Ĭ��Ϊ��in����*.in��
	set output=out
	rem �������������ļ�����չ����Ĭ��Ϊ��out����*.out��
	set answer=ans
	rem �������ñ�׼�𰸵���չ����Ĭ��Ϊ��out����*.out��
	set numinit=1
	rem ����ӵڼ�����ʼ���㣬Ҳ����a0.in����a1.in
	REM set notshowdetails=0
	REM ��֧��������ܣ� rem 0.����ʾ����ϸ��  1.��ʾ����ϸ��
	set AutoCheck_Enable=0
	rem ��һ���Ƿ����Զ�����
	rem 0 ���������н���
	rem 1 ������������
	rem 2 �Ӷ���������ļ�����
	rem �Զ����⹦�ܣ���2ģʽ˫�����У��������������ļ���//NOT SUPPORT
	rem ���漸�����������ĳ���ʱ��RE��WA��TLE��������δ����
	set Todo_WhenERROR=rem
	rem ��һ��
	rem rem �޲��� 
	rem pause^>nul   ����   pause
	rem 	�ڴ���ʱ�ȴ����������
	rem ping -n X 127.0.0.1^>nul
	rem 	�ڴ���ʱ�ȴ�X-1��
	rem ���������������ľ͹���==================================================
	if "%1"=="AutoCheck" (
		rem �Զ��л�Ϊ�ⲿ����ģʽ
		set AutoCheck_Enable=3
		rem ������ʽ judge.bat AutoCheck �������� ����ʱ�� ���ڼ��Ų��Ե� �Ƿ���� IO��ʽ
		rem ���������  judge AutoCheck cir 5 9 1 1
	)
rem ������AutoCheck_Enable=1ʱ�Զ���������
	set UserInput_Name=cir
	rem �ļ���������Ҫ��cpp��
	set UserInput_time=5
	rem �ֶ��������ʱ�ޣ�0.01s��
	set UserInput_Number=9
	rem ���뵽�ڼ��Ų��Ե�
	set UserInput_Compile=1
	rem �Ƿ���룬����1�������룬�������뿪ʼg++����
	set UserInput_IOways=1
	rem 1.�ļ���д  2.��׼�����������ѡ��Ĭ��2����
rem �ⲿ�����ʼ��
	if "%AutoCheck_Enable%"=="3" (
		set UserInput_Name=%2
		rem �ļ���������Ҫ��cpp��
		set UserInput_time=%3
		rem �ֶ��������ʱ�ޣ�0.01s��
		set UserInput_Number=%4
		rem ���뵽�ڼ��Ų��Ե�
		set UserInput_Compile=%5
		rem �Ƿ���룬����1�������룬�������뿪ʼg++����
		set UserInput_IOways=%6
		rem 1.�ļ���д  2.��׼�����������ѡ��Ĭ��2����
	)
rem ��ʼ��������Ŀ
	set num_wa=0
	set num_ac=0
	set num_re=0
	set num_tle=0
rem ���߽��� 
	title  By.ZHSHH OI������� Version 1.4 (Date 2018-10-05^)
	rem echo DEBUG %recomment%
	if %recomment% EQU 1 (
		echo By.ZHSHH OI������� Version 1.4 (Date 2018-10-05^)
		echo.
		echo ������վ��https^:^/^/zsh2517.wordpress.com
		echo.
		echo OIģ����Թ��ߣ��ݲ�֧��ʶ��CE RE TLE WA֮��Ĵ���
		echo WA�ж�����ΪWindows��fc����Ƚϲ�ͬ
		echo �����Ҫ��������������һ��ҳ������help
		echo ������������exeĿ¼�£���ŵ�exeĿ¼�¡���
		echo.
		echo ��ʽ �ļ���ʹ��
		echo name.exe
		echo ������������Ϊ
		echo name1.in
		echo name2.in
		echo ...
		echo ������Ϊ name1.ans name2.ans..........
		echo ��ver1.1�У�����˶���ans/in�ļ��Զ�����չ���ͱ��
		echo ��֧�֡�����Ա༭���������ʼ�����еĳ�ʼ��ֵ��
		echo.
		echo.
		echo ��һ(������N�汾���¼ƻ���
		echo ��ӳ�ʱ�رգ�RE�رգ���ֹsystem���õ�
		echo ���������
		pause>nul
	) else (
		echo.
		echo By.ZHSHH OI������� Version 1.4 (Date 2018-10-05^)
		echo ��Ҫ��ϸ���ݣ����ü��±��򿪲���������recomment=2�ĳ�=1
		echo.&echo.&echo.&echo.&echo.&echo.&echo.
		echo ������ʼ
		rem pause>nul
		ping -n 2 127.0.0.1>nul
	)
	cls
rem �����֧
	REM echo %AutoCheck_Enable%
	REM pause
	goto AutoCheck_Enable%AutoCheck_Enable%
	:AutoCheck_Enable0
	REM if "%AutoCheck_Enable%" == "1" (
	rem �������� 
		set /p name=�������ƣ����ü�cpp����
		if %name%==help goto h
		rem echo �Ƿ���룿1=�����У����� 2=O2�Ż�  3=O3�Ż�
		echo ����1�������룬�������뿪ʼg++����
		set /p y=�Ƿ���б��룿��Ŀǰ֧��CPP��ʹ��g++�������룩
		if "%y%" NEQ "1" (
			echo �����С�����
			rem g++ %name%.cpp -o2 %name%.exe
			rem echo g++ returned %errorlevel%
			rem title %errorlevel%
			g++ %name%.cpp -o %name%.exe
			if NOT "%errorlevel%"=="0" echo ��CE������ʧ�ܣ���������˳�&pause&goto quit
			echo ����ɹ�
			echo ��ע��g++��ʾ����Ϊû���ҵ��ļ�Ҳ��ʶ��Ϊ�ɹ���
			echo.
		)
		set /p tim=����ʱ�ޣ���λ0.01s����
		set /p allnum=�����뵽���Ų��Ե㣺
		set /p way=1.�ļ���д  2.��׼�����������ѡ��Ĭ��2����
		if "%way%"=="" set way=2
		echo ���ԵȲ�����
		goto AutoCheck_Enableend
	REM )
	:AutoCheck_Enable1
	:AutoCheck_Enable3
	REM if %AutoCheck_Enable% EQU 1 (
		set name=%UserInput_Name%
		set y=%UserInput_Compile%
		if "%y%" NEQ "1" (
			rem echo �����С�����
			rem g++ %name%.cpp -o2 %name%.exe
			rem echo g++ returned %errorlevel%
			echo �����С�����
			g++ %name%.cpp -o %name%.exe
			rem title %errorlevel%
			if NOT %errorlevel%==0 echo ��CE������ʧ�ܣ���������˳�&pause&goto quit
			echo ����ɹ�
		)
		set tim=%UserInput_time%
		set allnum=%UserInput_Number%
		set way=%UserInput_IOways%
		rem if "%way%"=="" set way=2
		echo ���ԵȲ�����
	REM )
	:AutoCheck_Enableend
	set /a number=%numinit%-1
:a
	rem ÿһ������ǰ�Ĳ���
	echo -----------------------------------------
	set /a number=number+1
	title TEST%number%  ALL %allnum%
	if  %number% GTR %allnum% goto exi
	goto way%way%
:way1
	del %name%.%input%>nul
	copy %name%%number%.%input% %name%.%input%>nul
	set TLE_KILLFILE=%name%%number%
	echo qwq>%TLE_KILLFILE%
	set /a TLE_TIME=tim+100
	start /b cmd /c tlekill %name%.exe %TLE_KILLFILE% %TLE_TIME%
	REM TODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODO
	set a=%time%
	%name%.exe
	set rune=%errorlevel%
	set b=%time%
	del %TLE_KILLFILE%
	fc %name%.%output% %name%%number%.%answer% 1>fc 2>>fc
	set errorl=%errorlevel%
	goto endway
:way2
	set TLE_KILLFILE=%name%%number%
	set /a TLE_TIME=tim+100
	echo qwq>%TLE_KILLFILE%
	start /b cmd /c tlekill %name%.exe %TLE_KILLFILE% %TLE_TIME%
	set a=%time%
	%name%.exe<%name%%number%.%input%>%name%.out
	set rune=%errorlevel%
	set b=%time%
	del %TLE_KILLFILE%
	fc %name%.%output% %name%%number%.%answer% 1>fc 2>>fc
	set errorl=%errorlevel%
:endway

rem ʱ����� 
	set h1=%a:~0,2%
	set m1=%a:~3,2%
	set s1=%a:~6,2%
	set ss1=%a:~9,2%
	echo %a%>>his.txt
	echo %b%>>his.txt
	set h2=%b:~0,2%
	set m2=%b:~3,2%
	set s2=%b:~6,2%
	set ss2=%b:~9,2%
	rem	if  ss2 LSS ss1 set /a s2=s2-1
	rem	if  s2 LSS s1 set /a s2=s2+60
	rem	if  ss2 LSS ss1 set /a ss2=ss2+100
	set /a used=(h2-h1)*100*60*60+(m2-m1)*100*60+(s2-s1)*100+ss2-ss1

rem �¹ʴ���
:re
:tle
	REM TLE ���ȼ���ǰ��������ʱ��kill��֮�����ʾTLE�����Ǵ��󷵻�RE��
	REM if NOT %used% LEQ %tim% (
	REM 	echo ��TLE�� TEST%number%��TIME USED %used%
	REM 	set /a tle=tle+1
	REM 	set tlelist=%tlelist%  %number%
	REM 	%Todo_WhenERROR%
	REM 	goto a
	REM )
	if NOT %used% LEQ %tim% (
		echo ��TLE�� TEST%number%��TIME USED %used%
		set /a num_tle=num_tle+1
		set tlelist=%tlelist%  %number%[%used%]
		%Todo_WhenERROR%
		goto a
	)
if NOT %rune%==0 (
	echo ��RE��TEST%number%:Program OUT %rune%
	set relist=%relist%  %number%
	set /a num_re=num_re+1
	%Todo_WhenERROR%
	goto a
)
:wa
	if NOT %errorl%==0 (
		echo ��WA��  TEST%number%:TIME USED %used%
		echo ------------------------
		echo ��WA��  TEST%number%:TIME USED %used%>>wa.txt
		type fc
		%Todo_WhenERROR%
		type fc>>wa.txt
		set walist=%walist%  %number%
		set /a num_wa=num_wa+1
	rem	echo %number% >>wa.list
		echo ------------------------
		goto a
	)
:ac

	echo ��AC��  TEST%number%��%used%
	set /a num_ac=num_ac+1
	set aclist=%aclist%  %number%
rem	echo %number% >>ac.list
	goto a

:exi
title ͳ�Ƴɹ���AC:%num_ac%  WA:%num_wa%  TLE:%num_tle%  RE:%num_re%
if %num_ac% GTR 0 (
echo -------------------------------------
echo AC����Ŀ��%num_ac%��
echo %aclist%
rem type ac.list
)
if %num_wa% GTR 0 (
echo -------------------------------------
echo WA����Ŀ��%num_wa%��
echo %walist%
rem type wa.list
)
echo -------------------------------------
if %num_tle% GTR 0 (
echo TLE����Ŀ��%num_tle%��
echo %tlelist%
rem type tle.list
echo -------------------------------------
)
if %num_re% GTR 0 (
echo RE����Ŀ��%num_re%��
echo %relist%
rem type tle.list
echo -------------------------------------
)
echo �������ݣ����κ������������˳���ɾ���������
pause 1>nul 2>nul
del his.txt 1>nul 2>nul
rem FOR /L %%i IN (1,1,%allnum%) DO del %name%%%i.out>nul
del %name%.out 1>nul 2>nul
del wa.txt 1>nul 2>nul
del error 1>nul 2>nul
del fc 1>nul 2>nul
goto quit


:h
cls
title OITEST By zhshh  --HELP
echo https^:^/^/zhidao.baidu.com^/question^/194371330.html
echo ���ִ�����Ϣ��˵��
echo CE Compilation Error 
echo �жϷ�����g++����󷵻�ֵ������0
echo ---����ʧ�ܣ��޷�����������һ�����⣬��ֱ���˳�
echo.
echo RE Runtime Error 
echo �жϷ�������������󷵻�ֵ��Ϊ0
echo ---���ܻᵯ������Ӧ�ĵ������رպ���ܼ���
echo.
echo TLE Time Limit Exceeded
echo ����Ԥ��ʱ�ޣ���λ��0.01s��,�����ڲ�Ϊ
echo ----------------------------------------------------------------------
echo ��XX.in�ļ�ɾ����׼����  ^/^/�ļ���д
echo ��ʱ��ʼ
echo (�ض���)����  ^/^/���ض�������
echo ��¼����ֵ�����ڼ������⣬����������¼�����ܺ����潻�������һ����ϲ���ʱ�䣩
echo ��ʱ����
echo ����˲��Ե���
echo ----------------------------------------------------------------------
echo �����ڸ��ݳ������������ͬ����ѡ��
echo ��ʱ���ż�����ָ��������ز⣬Ŀǰ��û���ҵ�������Դ����
echo ���������Ľ���ʱ���㣬����Ҫ����
echo.
echo ��������� ���ظ���
pause>nul
echo WA Wrong Answer
echo �жϷ�����Ŀǰ��ʹ�õ�Windows��FC����ϸ��ж�
echo �����������������ж���һ�����е�����ĩ�ո���ͨ����
echo �һ��ʱ��д���жϽű���
echo.
echo AC Accepted
echo �����������û�г��֣�����Ӧ����AC��
echo.
echo �����������ȼ�CE^>TLE^>RE^>WA^>AC (������˳��)
echo ������˳�
pause>nul
goto quit
REM :make_autockeck

goto quit
���ǲ���ִ�еġ�����
	���¼�¼
	v1.0
		����������ɡ�
		����ʵ����������Ҫ���ܡ�
	v1.1
		�Ż���ʾ���ݣ���������ȷ
		��Ӹ����Զ������ԣ���չ�������ԣ�
		�ṩ���־��򣨼��ٰ���ҳ��ģʽ
		�����ҵ�blog
	v1.2(UPDATE 2018-07-07)
		�ṩ����������ݵ�����ģʽ
		�Ż�Դ���롣����������ƣ�����ṹ�����ע��
	v1.3(UPDATE 2018-09-20)
		���Ʋ�������ģʽ
		����ִ��˳�����ʾ���ݡ�
	v1.4(UPDATE 2018-10-05)
		TLE����ʵ���Զ��رա�����������
:quit
	REM �����Ķ���
	REM ��֪�����᲻����£��������������Ļ��������ˡ��ټӹ��ܹ����Ǹ��ֵ�����exe�ˣ���û����������ı�Ҫ��
	REM Github��https://github.com/zsh2517/OI-judge-bat
	REM BLOG: http://blog.zsh2517.com