@echo off
rem 其他东西：
rem 这个功能还没做→请在帮助页面输入helpmore获取。这里不能写太多，要不就不好找到初始化设置了。。
rem 只需要改动下面的就行
REM 初始化设置
	set recomment=1
	rem 是否显示过多的帮助信息 1.显示 2.不显示
	rem 试题的程序数据文件名必须一样，区别是扩展名
	set input=in
	rem 上面设置输入文件的扩展名，默认为“in”（*.in）
	set output=out
	rem 上面设置输入文件的扩展名，默认为“out”（*.out）
	set answer=ans
	rem 上面设置标准答案的扩展名，默认为“out”（*.out）
	set numinit=1
	rem 程序从第几个开始计算，也就是a0.in还是a1.in
	REM set notshowdetails=0
	REM 不支持这个功能！ rem 0.不显示错误细节  1.显示错误细节
	set AutoCheck_Enable=0
	rem 上一行是否开启自动评测
	rem 0 正常命令行进行
	rem 1 从自身程序读入
	rem 2 从额外的配置文件读入
	rem 自动评测功能，在2模式双击运行，即可生成配置文件。//NOT SUPPORT
	rem 下面几行是用来更改出错时（RE，WA，TLE）程序如何处理的
	set Todo_WhenERROR=rem
	rem 上一排
	rem rem 无操作 
	rem pause^>nul   或者   pause
	rem 	在错误时等待任意键继续
	rem ping -n X 127.0.0.1^>nul
	rem 	在错误时等待X-1秒
	rem 正常评测就用上面的就够了==================================================
	if "%1"=="AutoCheck" (
		rem 自动切换为外部评测模式
		set AutoCheck_Enable=3
		rem 参数形式 judge.bat AutoCheck 试题名称 测试时间 到第几号测试点 是否编译 IO方式
		rem 比如下面的  judge AutoCheck cir 5 9 1 1
	)
rem 下面是AutoCheck_Enable=1时自动评测设置
	set UserInput_Name=cir
	rem 文件名（不需要加cpp）
	set UserInput_time=5
	rem 手动输入测试时限（0.01s）
	set UserInput_Number=9
	rem 输入到第几号测试点
	set UserInput_Compile=1
	rem 是否编译，输入1跳过编译，其他输入开始g++编译
	set UserInput_IOways=1
	rem 1.文件读写  2.标准输入输出，请选择（默认2）：
rem 外部评测初始化
	if "%AutoCheck_Enable%"=="3" (
		set UserInput_Name=%2
		rem 文件名（不需要加cpp）
		set UserInput_time=%3
		rem 手动输入测试时限（0.01s）
		set UserInput_Number=%4
		rem 输入到第几号测试点
		set UserInput_Compile=%5
		rem 是否编译，输入1跳过编译，其他输入开始g++编译
		set UserInput_IOways=%6
		rem 1.文件读写  2.标准输入输出，请选择（默认2）：
	)
rem 初始化变量数目
	set num_wa=0
	set num_ac=0
	set num_re=0
	set num_tle=0
rem 作者介绍 
	title  By.ZHSHH OI程序测试 Version 1.4 (Date 2018-10-05^)
	rem echo DEBUG %recomment%
	if %recomment% EQU 1 (
		echo By.ZHSHH OI程序测试 Version 1.4 (Date 2018-10-05^)
		echo.
		echo 作者网站：https^:^/^/zsh2517.wordpress.com
		echo.
		echo OI模拟测试工具，暂不支持识别CE RE TLE WA之外的错误
		echo WA判定条件为Windows的fc命令比较不同
		echo 如果需要帮助，可以在下一个页面输入help
		echo 如果这个不是在exe目录下，请放到exe目录下。。
		echo.
		echo 方式 文件名使用
		echo name.exe
		echo 测试数据命名为
		echo name1.in
		echo name2.in
		echo ...
		echo 答案命名为 name1.ans name2.ans..........
		echo 在ver1.1中，添加了对于ans/in文件自定义扩展名和编号
		echo 的支持。你可以编辑本程序在最开始代码中的初始化值。
		echo.
		echo.
		echo 下一(划掉）N版本更新计划：
		echo 添加超时关闭，RE关闭，禁止system调用等
		echo 任意键继续
		pause>nul
	) else (
		echo.
		echo By.ZHSHH OI程序测试 Version 1.4 (Date 2018-10-05^)
		echo 需要详细内容，请用记事本打开并将第七行recomment=2改成=1
		echo.&echo.&echo.&echo.&echo.&echo.&echo.
		echo 即将开始
		rem pause>nul
		ping -n 2 127.0.0.1>nul
	)
	cls
rem 评测分支
	REM echo %AutoCheck_Enable%
	REM pause
	goto AutoCheck_Enable%AutoCheck_Enable%
	:AutoCheck_Enable0
	REM if "%AutoCheck_Enable%" == "1" (
	rem 基本设置 
		set /p name=输入名称（不用加cpp）：
		if %name%==help goto h
		rem echo 是否编译？1=不进行，跳过 2=O2优化  3=O3优化
		echo 输入1跳过编译，其他输入开始g++编译
		set /p y=是否进行编译？（目前支持CPP，使用g++无氧编译）
		if "%y%" NEQ "1" (
			echo 编译中。。。
			rem g++ %name%.cpp -o2 %name%.exe
			rem echo g++ returned %errorlevel%
			rem title %errorlevel%
			g++ %name%.cpp -o %name%.exe
			if NOT "%errorlevel%"=="0" echo 【CE】编译失败！！任意键退出&pause&goto quit
			echo 编译成功
			echo 请注意g++提示，因为没有找到文件也会识别为成功！
			echo.
		)
		set /p tim=测试时限（单位0.01s）：
		set /p allnum=请输入到几号测试点：
		set /p way=1.文件读写  2.标准输入输出，请选择（默认2）：
		if "%way%"=="" set way=2
		echo 请稍等测试中
		goto AutoCheck_Enableend
	REM )
	:AutoCheck_Enable1
	:AutoCheck_Enable3
	REM if %AutoCheck_Enable% EQU 1 (
		set name=%UserInput_Name%
		set y=%UserInput_Compile%
		if "%y%" NEQ "1" (
			rem echo 编译中。。。
			rem g++ %name%.cpp -o2 %name%.exe
			rem echo g++ returned %errorlevel%
			echo 编译中。。。
			g++ %name%.cpp -o %name%.exe
			rem title %errorlevel%
			if NOT %errorlevel%==0 echo 【CE】编译失败！！任意键退出&pause&goto quit
			echo 编译成功
		)
		set tim=%UserInput_time%
		set allnum=%UserInput_Number%
		set way=%UserInput_IOways%
		rem if "%way%"=="" set way=2
		echo 请稍等测试中
	REM )
	:AutoCheck_Enableend
	set /a number=%numinit%-1
:a
	rem 每一次评测前的步骤
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

rem 时间计算 
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

rem 事故处理
:re
:tle
	REM TLE 优先级提前，这样超时被kill掉之后会显示TLE而不是错误返回RE。
	REM if NOT %used% LEQ %tim% (
	REM 	echo 【TLE】 TEST%number%：TIME USED %used%
	REM 	set /a tle=tle+1
	REM 	set tlelist=%tlelist%  %number%
	REM 	%Todo_WhenERROR%
	REM 	goto a
	REM )
	if NOT %used% LEQ %tim% (
		echo 【TLE】 TEST%number%：TIME USED %used%
		set /a num_tle=num_tle+1
		set tlelist=%tlelist%  %number%[%used%]
		%Todo_WhenERROR%
		goto a
	)
if NOT %rune%==0 (
	echo 【RE】TEST%number%:Program OUT %rune%
	set relist=%relist%  %number%
	set /a num_re=num_re+1
	%Todo_WhenERROR%
	goto a
)
:wa
	if NOT %errorl%==0 (
		echo 【WA】  TEST%number%:TIME USED %used%
		echo ------------------------
		echo 【WA】  TEST%number%:TIME USED %used%>>wa.txt
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

	echo 【AC】  TEST%number%：%used%
	set /a num_ac=num_ac+1
	set aclist=%aclist%  %number%
rem	echo %number% >>ac.list
	goto a

:exi
title 统计成功，AC:%num_ac%  WA:%num_wa%  TLE:%num_tle%  RE:%num_re%
if %num_ac% GTR 0 (
echo -------------------------------------
echo AC的题目有%num_ac%个
echo %aclist%
rem type ac.list
)
if %num_wa% GTR 0 (
echo -------------------------------------
echo WA的题目有%num_wa%个
echo %walist%
rem type wa.list
)
echo -------------------------------------
if %num_tle% GTR 0 (
echo TLE的题目有%num_tle%个
echo %tlelist%
rem type tle.list
echo -------------------------------------
)
if %num_re% GTR 0 (
echo RE的题目有%num_re%个
echo %relist%
rem type tle.list
echo -------------------------------------
)
echo 请检查数据，无任何问题后任意键退出并删除输出数据
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
echo 各种错误信息的说明
echo CE Compilation Error 
echo 判断方法：g++编译后返回值不等于0
echo ---编译失败，无法继续进行下一步评测，将直接退出
echo.
echo RE Runtime Error 
echo 判断方法：程序结束后返回值不为0
echo ---可能会弹出无响应的弹窗，关闭后才能继续
echo.
echo TLE Time Limit Exceeded
echo 超过预先时限（单位是0.01s）,程序内部为
echo ----------------------------------------------------------------------
echo 【XX.in文件删除等准备】  ^/^/文件读写
echo 计时开始
echo (重定向)运行  ^/^/含重定向输入
echo 记录返回值（由于技术问题，必须结束后记录，不能和下面交换，而且基本上不用时间）
echo 计时结束
echo 评测此测试点结果
echo ----------------------------------------------------------------------
echo 括号内根据程序输入输出不同进行选择
echo 计时如果偶尔出现负数，请重测，目前还没有找到问题来源。。
echo 不过后来改进计时计算，问题要少了
echo.
echo 任意键继续 加载更多
pause>nul
echo WA Wrong Answer
echo 判断方法：目前是使用的Windows的FC命令，严格判断
echo 经测试条件是允许有多余一个空行但是行末空格不能通过。
echo 我会抽时间写个判断脚本的
echo.
echo AC Accepted
echo 如果上述问题没有出现，程序应该是AC的
echo.
echo 上述出现优先级CE^>TLE^>RE^>WA^>AC (即介绍顺序)
echo 任意键退出
pause>nul
goto quit
REM :make_autockeck

goto quit
这是不会执行的。。。
	更新记录
	v1.0
		主程序框架完成。
		基本实现主程序主要功能。
	v1.1
		优化提示内容，描述更精确
		添加更多自定义属性（扩展名等属性）
		提供文字精简（减少帮助页）模式
		加入我的blog
	v1.2(UPDATE 2018-07-07)
		提供自身带有数据的运行模式
		优化源代码。整理变量名称，程序结构，添加注释
	v1.3(UPDATE 2018-09-20)
		完善参数运行模式
		整理执行顺序和提示内容。
	v1.4(UPDATE 2018-10-05)
		TLE终于实现自动关闭。。。。。。
:quit
	REM 其他的东西
	REM 不知道还会不会更新，批处理能做到的基本上完了。再加功能估计是各种第三方exe了，就没有了批处理的必要性
	REM Github：https://github.com/zsh2517/OI-judge-bat
	REM BLOG: http://blog.zsh2517.com