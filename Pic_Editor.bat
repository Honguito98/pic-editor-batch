@echo off
:    Pic Editor - A simple tool to create maps and sprites used by Seta:Gpu
:    Copyright (C) 2013,2014  Honguito98
:
:    This program is free software: you can redistribute it and/or modify
:    it under the terms of the GNU General Public License as published by
:    the Free Software Foundation, either version 3 of the License, or
:    (at your option) any later version.
:
:    This program is distributed in the hope that it will be useful,
:    but WITHOUT ANY WARRANTY; without even the implied warranty of
:    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:    GNU General Public License for more details.
:
:    You should have received a copy of the GNU General Public License
:    along with this program.  If not, see <http://www.gnu.org/licenses/>.

	if not [%1]==[ok] (
	core\ansicon "%~0" ok
	exit
)
	setlocal enabledelayedexpansion enableextensions
	call:var
:New Proyect
	%disp% [0;1;40;31m
	%disp% [7;23HÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	%disp% [8;23H³ş  New Project:  ş³Û
	%disp% [9;23HÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´Û
	%disp% [10;23H³Name:[           ]³Û
	%disp% [11;23H³Type: [ ]    [ ]  ³Û
	%disp% [12;23H³    Colours Simple³Û
	%disp% [13;23HÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´Û
	%disp% [14;23H³ş      [Ok]      ş³Û
	%disp% [15;23HÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÛ
	%disp% [16;23H ßßßßßßßßßßßßßßßßßßßß
	if !mode!==color (%disp% [11;31H*) else (%disp% [11;38H*)
	%disp% [10;30H!name!
	for /f "tokens=1,2,3" %%a in ('core\bg mouse') do set/a x=%%c+1,y=%%b+1
	if !y!==10 if !x! geq 30 if !x! leq 42 call:input
	if !y!==11 (
	if !x!==31 set mode=color
	if !x!==38 set mode=simple
	)
	
	if !y!==14 if !x! geq 31 if !x! leq 34 (
	if not defined name goto:new
	<nul set/p "=[0;1;40;33m[1;3H!xxz!!p1!!p2!!mc.ds!"
		if !mode!==color (
			for /l %%a in (1,1,69) do set "space=!space![0;0;40;30m [;m"
			for /l %%a in (1,1,19) do set line[%%a]=!space!
			<nul set/p =!bar.color![27;5H!bar.cl![28;14H%pen%[;m
			%bs% p
	)
		if !mode!==simple (
			for /l %%b in (1,1,69) do set "space=!space! "
			for /l %%a in (1,1,19) do set line[%%a]=!space!
			%disp% [;m
			set pen=^^!tip^^!&%bs% p
	)
	goto:main
)
	goto:new
:input
	set name=
	set/p "name=[10;30H          [10;30H"
	if not defined name goto:input
	if exist "sprites\!name!.pic" goto:input
	goto:eof
:main
	for /f "tokens=1,2,3" %%a in ('core\bg mouse') do set/a x=%%c+1,y=%%b+1,z=%%a
	::title !x!,!y! [light bg:!col.bl!] [light fg:!col.fl!] [minx:!minx!]
	if !y! geq 4 if !y! leq 22 if !x! geq 2 if !x! leq 69 (
	if !z!    EQU 2 goto:menu
	if !mode! EQU color  call:insert_1
	if !mode! EQU simple call:insert_2
	<nul set/p =[!y!;!x!H%pen%
)
	if !y!==26 call:bcolor b
	if !y!==27 call:bcolor f
	if !y!==26 (
	if !x!==29 set tip=Û
	if !x!==31 set tip=²
	if !x!==33 set tip=±
	if !x!==35 set tip=°
	if !x!==37 set tip=Ü
	if !x!==39 set tip=ß
	if !x!==41 set tip=
	if !x!==43 set tip=
	if !x!==45 set tip=
	if !x!==47 set tip=Ú
	if !x!==49 set tip=Ä
	if !x!==51 set tip=¿
	if !x!==53 set tip=À
	if !x!==55 set tip=Ù
	if !x!==57 set tip=©
	if !x!==59 set tip=¸
	if !x!==61 set tip=É
	if !x!==63 set tip=Í
	if !x!==65 set tip=»
	if !x!==67 set tip=Î
	if !x!==69 set tip=È
	%bs% p
	)
	if !y!==27 (
	if !x!==29 set tip=
	if !x!==31 set tip=
	if !x!==33 set tip=
	if !x!==35 set tip=
	if !x!==37 set tip=
	if !x!==39 set tip=
	if !x!==41 set tip=
	if !x!==43 set tip=
	if !x!==45 set tip=
	if !x!==47 set tip=Á
	if !x!==49 set tip=Â
	if !x!==51 set tip=Ã
	if !x!==53 set tip=Å
	if !x!==55 set tip=´
	if !x!==57 set tip=³
	if !x!==59 set tip=®
	if !x!==61 set tip=¯
	if !x!==63 set tip=¹
	if !x!==65 set tip=º
	if !x!==67 set tip=¼
	if !x!==69 set tip=Ê
	%bs% p	
	)
	if !y!==28 (
	if !x!==29 set tip=
	if !x!==31 set tip=ş
	if !x!==33 set tip=Ø
	if !x!==35 set tip=
	if !x!==37 set tip=
	if !x!==39 set tip=
	if !x!==41 set tip=
	if !x!==43 set tip=ª
	if !x!==45 set tip=
	if !x!==47 set tip=
	if !x!==49 set tip=
	if !x!==51 set tip=
	if !x!==53 set tip=÷
	if !x!==55 set tip=î
	if !x!==57 set tip=ï
	if !x!==59 set tip=ğ
	if !x!==61 set tip=ù
	if !x!==63 set tip=ú
	if !x!==65 set tip=Ï
	if !x!==67 set tip=Ì
	if !x!==69 set tip=Ë
	%bs% p
	)
	if !y!==25 if !x!==38 set tip= &set/a col.fl=0,col.bl=0,col.bg=0,col.fg=0&%bs% p
if !y!==2 (
	if !x! geq 18 if !x! leq 22 call:var &goto:new
	if !x! geq 33 if !x! leq 38 goto:open
	if !x! geq 41 if !x! leq 46 exit
	if !x! geq 25 if !x! leq 30 (
	del "Sprites\!name!.pic" >nul 2>&1
	If !Mode!==color echo.!Head_Color!>>"Sprites\!name!.pic"
	If !Mode!==simple echo.!Head_bw!>>"Sprites\!name!.pic"

	for /l %%a in (1,1,19) do (
		if !mode!==color echo.!line[%%a]:~17!>>"Sprites\!name!.pic"
		if !mode!==simple echo.!line[%%a]:~1!>>"Sprites\!name!.pic"
		)
	)
)
	goto:main
:insert_1
	set/a tmp.y=!y!-4+1,minx=!x!*17-17,maxx=!x!*17
	set "line[!tmp.y!]=!line[%tmp.y%]:~,%minx%!%pen%[;m!line[%tmp.y%]:~%maxx%!"
	goto:eof
:insert_2
	set/a tmp.y=!y!-4+1,minx=!x!-1
	set "line[!tmp.y!]=!line[%tmp.y%]:~,%minx%!!tip!!line[%tmp.y%]:~%x%!"
	goto:eof
:menu
	Core\bg.exe Cursor 100
	!ui! sendkey esc press &!ui! sendkey esc press
	set/a yy=!y!+1,og.y=!y!,og.x=!x!,max.x=!x!+19&%disp% [;m
	%disp% [!yy!;!x!HÚÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ &set/a yy+=1&set y1=!yy!
	%disp% [!yy!;!x!H³ú³Select Area     ³Û&set/a yy+=1&set y2=!yy!
	%disp% [!yy!;!x!H³ú³Copy Source code³Û&set/a yy+=1&set y3=!yy!
	%disp% [!yy!;!x!H³ú³Copy Pen color  ³Û&set/a yy+=1&set y4=!yy!
	%disp% [!yy!;!x!H³ú³Paste Here      ³Û&set/a yy+=1
	%disp% [!yy!;!x!HÀÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÛ&set/a yy+=1
	%disp% [!yy!;!x!H ßßßßßßßßßßßßßßßßßßßß
	%disp% [!Y!;!X!H
	:menux
	for /f "tokens=1,2,3" %%a in ('core\bg mouse') do set/a x=%%c+1,y=%%b+1,z=%%a
	if !z!==1 (
	if !y!==!y1! if !x! geq !og.x! if !x! leq !max.x! call:copy chr
	if !y!==!y2! if !x! geq !og.x! if !x! leq !max.x! call:copy src
	if !y!==!y3! if !x! geq !og.x! if !x! leq !max.x! call:copy pen
	if !y!==!y4! if !x! geq !og.x! if !x! leq !max.x! call:paste
	call:refresh &goto:main
)
	goto:menux
:paste
	del "!tmp!\paste.txt" 2>nul
	!ui! clipboard writefile "!tmp!\paste.txt"
	for /f "tokens=1,* delims=[]" %%a in ('type "!tmp!\paste.txt"^|find /n /v ""') do (
	if [%%a]==[1] set "paste=%%b")
	if !mode!==simple call:pt_simple
	if !mode!==color call:pt_color
	call:refresh
	goto:main
:pt_color
	set "paste=!paste: = !"
echo.!paste!|find "">nul||(
	call:countchr "!paste!"
	set "past="&set/a chrs-=1
	for /l %%a in (0,1,!chrs!) do (set "past=!past![!col.bl!;!col.fl!;4!col.bg!;3!col.fg!m!paste:~%%a,1![;m")
	set "paste=!past!"
)
	call:countchr2 "!paste!"
	set/a tmp.y=!og.y!-4+1,minx=!og.x!*17-17,maxx=!og.x!*17+!chrs!-17
	set "line[!tmp.y!]=!line[%tmp.y%]:~,%minx%!!paste!!line[%tmp.y%]:~%maxx%!"
	set "line[!tmp.y!]=!line[%tmp.y%]:~0,1173!"
	goto:eof
:pt_simple
	set "paste=!paste: = !"
	set "paste=!paste:=!"
	call:countchr "!paste!"
	set/a tmp.y=!og.y!-4+1,minx=!og.x!-1,maxx=!og.x!+!chrs!-1
	set "line[!tmp.y!]=!line[%tmp.y%]:~,%minx%!!paste!!line[%tmp.y%]:~%maxx%!"
	set "line[!tmp.y!]=!line[%tmp.y%]:~0,69!"
	goto:eof
:countchr [txt]
	set "txt_co=%~1"&set chrs=0
	:l222
	if not defined txt_co goto:eof
	set "txt_co=!txt_co:~1!"
	set/a chrs+=1
	goto:l222
:countchr2 [txt]
	set "txt_co=%~1"&set chrs=0
	:l222_1
	if not defined txt_co (set/a "chrs*=17"&goto:eof)
	set "txt_co=!txt_co:~17!"
	set/a chrs+=1
	goto:l222_1
:copy
	if [%1]==[chr] (
	call:refresh
	chcp 1252 >nul
	!ui! sendmouse right click
	!ui! sendkey down press
	!ui! sendkey enter press
	core\bg sleep 800
	chcp 850 >nul
	)
if [%1]==[src] call:ssrc
if [%1]==[pen] (
	if !mode!==color call:dropp_1
	if !mode!==simple call:dropp_2
	call:refresh
)
	goto:main
:ssrc
	%disp% [13;17H[0;1;40;36m[Press right click for options]
	title Press right click for options
	ping -n 2 localhost>nul& call:refresh
	:ssrcv
	set xpoint_i=&set ypoint_i=&set xpoint_f=&set ypoint_f=
	:ssrcx
	for /f "tokens=1,2,3" %%a in ('core\bg mouse') do set/a x=%%c+1,y=%%b+1,z=%%a
	if !z!==1 (
	if !y! geq 4 if !y! leq 22 if !x! geq 2 if !x! leq 69 (
	if not defined xpoint_i set xpoint_i=!x!
	if not defined ypoint_i set ypoint_i=!y!
	set xpoint_f=!x!&set ypoint_f=!y!
	call:refresh not
%disp% [!ypoint_i!;!xpoint_i!H[1;1;41;31m*^
[!ypoint_f!;!xpoint_f!H[1;1;41;31m*
))
	if !z!==2 goto:sscr_menu
	goto:ssrcx
:sscr_menu
	Core\bg.exe Cursor 100
	!ui! sendkey esc press &!ui! sendkey esc press
	set/a yy=!y!+1,og.y=!y!,og.x=!x!,max.x=!x!+10&%disp% [;m
	%disp% [!yy!;!x!HÚÄÂÄÄÄÄÄÄ¿ &set/a yy+=1&set y1=!yy!
	%disp% [!yy!;!x!H³ú³Retry ³Û&set/a yy+=1&set y2=!yy!
	%disp% [!yy!;!x!H³ú³Copy  ³Û&set/a yy+=1&set y3=!yy!
	%disp% [!yy!;!x!H³ú³Cancel³Û&set/a yy+=1
	%disp% [!yy!;!x!HÀÄÁÄÄÄÄÄÄÙÛ&set/a yy+=1
	%disp% [!yy!;!x!H ßßßßßßßßßß
	%disp% [!Y!;!X!H
	:sscr_menux
	for /f "tokens=1,2,3" %%a in ('core\bg mouse') do set/a x=%%c+1,y=%%b+1,z=%%a
	if !z!==1 (
	if !y!==!y1! if !x! geq !og.x! if !x! leq !max.x! (call:refresh &goto:ssrcv)
	if !y!==!y2! if !x! geq !og.x! if !x! leq !max.x! (call:src_copy&goto:main)
	if !y!==!y3! if !x! geq !og.x! if !x! leq !max.x! (title !xxz!&call:refresh &goto:main)
	call:refresh
	title !xxz!
%disp% [!ypoint_i!;!xpoint_i!H[1;1;41;31m*^
[!ypoint_f!;!xpoint_f!H[1;1;41;31m*
	goto:ssrcx
	)
	goto:sscr_menux
:src_copy
	del "!tmp!\paste.txt" 2>nul
	if !mode!==simple (
	set/a maxx=!xpoint_f!-!xpoint_i!+1,ypoint_i-=3,ypoint_f-=3,xpoint_i-=1
	)
	if !mode!==color (
	set/a xpoint_i*=17,xpoint_f*=17
	set/a maxx=!xpoint_f!-!xpoint_i!+17,ypoint_i-=3,ypoint_f-=3,xpoint_i-=17
	)
	for /l %%a in (!ypoint_i!,1,!ypoint_f!) do (
	echo !line[%%a]:~%xpoint_i%,%maxx%!>>"!tmp!\paste.txt")
	title !xxz!
	!ui! clipboard readfile "!tmp!\paste.txt"
	call:refresh
	goto:eof
:dropp_1
	set/a ox=!og.x!*17-17,oy=!og.y!-4+1
	set "tmp_var=!line[%oy%]:~%ox%,17!"
	for /f "tokens=1,2,3,4,5 delims=;" %%a in ('echo !tmp_var!') do (
	set col.bl=%%a&set col.bl=!col.bl:~2!
	set col.fl=%%b
	set col.bg=%%c&set col.bg=!col.bg:~1!
	set col.fg=%%d&set col.fg=!col.fg:~1,1!
	set    tip=%%d&set tip=!tip:~3,1!
)
	goto:eof
:dropp_2
	set/a ox=!og.x!-1,oy=!og.y!-4+1
	set tip=!line[%oy%]:~%ox%,1!
	goto:eof
:refresh [not]
	Core\bg.exe Cursor 0
	set yy=4
	if not [%1]==[not] %disp% [0;1;40;33m[1;3H!xxz!!p1!!p2!!mc.ds!
	if !mode!==color (
	%disp% !bar.color!
	for /l %%a in (1,1,19) do (
	%disp% [!yy!;2H!line[%%a]:~17!!lf!
	set/a yy+=1
)) 
	if !mode!==simple (
	%disp% [;m
	for /l %%a in (1,1,19) do (
	%disp% [!yy!;2H!line[%%a]:~1!!lf!
	set/a yy+=1
))
	if not [%1]==[not] %bs% p
	goto:eof
:bcolor
	if !x!==5  %bs%0 %1
	if !x!==6  %bs%1 %1
	if !x!==7  %bs%2 %1
	if !x!==8  %bs%3 %1
	if !x!==9  %bs%4 %1
	if !x!==10 %bs%5 %1
	if !x!==11 %bs%6 %1
	if !x!==12 %bs%7 %1
	if !x!==18 set col.%1l=0&%bs% p
	if !x!==21 set col.%1l=1&%bs% p
	if !x!==24 set col.%1l=5&%bs% p
	goto:eof
:open
	%disp% [0;1;40;32m
	%disp% [07;25HÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	%disp% [08;25H³şName of File: ş³Û
	%disp% [09;25H³[              ]³Û
	%disp% [10;25HÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÛ
	%disp% [11;25H ßßßßßßßßßßßßßßßßßß
	:openx
	set/p "name=[09;27H              [09;27H"
	if not defined name goto:openx
	if not exist "Sprites\!name!.pic" goto:openx
	set "ln_h=[0;1;40;34m [;m"& set mode=color
	type "sprites\!name!.pic"|find "!Head_color!" >nul||(
		set "ln_h= "
		set mode=simple
		Set Space=
			for /l %%b in (1,1,69) do set "space=!space! "
			for /l %%a in (1,1,19) do set line[%%a]=!space!
	)
	for /f "Tokens=1,* Skip=1 Delims=[]" %%a in ('type "sprites\!name!.pic"^|find /n /v ""') do (
	Set/a _Tmp_=%%a-1
	set "line[!_Tmp_!]=!ln_h!%%b"
	)
	For /l %%Y in (1,1,19) Do set "line[%%Y]=!line[%%Y]: = !"
	if !mode!==simple (
		%disp% [;m
		set pen=^^!tip^^!&%bs% p
)
	if !mode!==color (
		set pen=[^^!col.bl^^!;^^!col.fl^^!;4^^!col.bg^^!;3^^!col.fg^^!m^^!tip^^!
		)
	call:refresh
	goto:main
:var
	md "!cd!\Sprites\" 2>nul
	mode con cols=70 lines=30
	set "xxz=.::{Pic Editor: Map & Sprite Editor in Batch By Honguito98}::."
	title !xxz!
	set mode=color
	Set "Head_Color=Pic Editor, Developed By Honguito98, 2013 - ANSI Color Sequences File"
	Set "Head_Bw=Pic Editor, Developed By Honguito98, 2013 - ASCII File"
	set pen=[^^!col.bl^^!;^^!col.fl^^!;4^^!col.bg^^!;3^^!col.fg^^!m^^!tip^^!
	set "bs=call:base "
	set tip=±
	set "disp=<nul set/p = "
	set space=&set p2=&set bar.cl=
	set sp=&  set mc.ds=&set name=
	set ui=core\ui.dll
	set lf=^


	set/a bg=9,fg=11,col.bg=0,col.fg=0,col.fl=0,col.bl=0
	set "p1=[2;18H[0;1;40;36m[New]  [Save]  [Open]  [Exit]"
	for /l %%a in (0,1,7) do (
	call:base %%a b
	set "bar.cl=!bar.cl![0;!col.bl!;40;3!col.bg!mş[;m"
)
	set/a col.bl=5,col.fl=1
	%bs% 1 f & %bs% 3 b
	for %%c in (
	"[24;1H[;m"
	"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
	"³Colors:       ³Brightness³³Brushes:[#]                              ³"
	"³BG:        [ ]³[ ][ ][ ] ³³Û ² ± ° Ü ß    Ú Ä ¿ À Ù © ¸ É Í » Î È³"
	"³FG:        [ ]³[ ][ ][ ] ³³         Á Â Ã Å ´ ³ ® ¯ ¹ º ¼ Ê³"
	"³BF:-  -  - [ ]³ 0  1  5  ³³ ş Ø     ª     ÷ î ï ğ ù ú Ï Ì Ë³"
	"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
	) do set "p2=!p2!%%~c"
	set "bar.color=[26;5H!bar.cl![27;5H!bar.cl!"
	for /l %%a in (1,1,19) do set "sp=!sp!³                                                                    ³"
	for %%a in (
	"[3;1H[0;1;40;32m"
	"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
	"!sp!"
	"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
	) do set "mc.ds=!mc.ds!%%~a"
	<nul set/p "=[0;1;40;33m[1;3H!xxz!!p1!!p2!!mc.ds!"
	if !mode!==color (<nul set/p =!bar.color![27;5H!bar.cl![28;14H%pen%[;m)
	if !mode!==simple (%disp% [28;14H!tip!)
	goto:eof

:base [n] [b\f] [p]
	if !mode!==simple (%disp% [28;14H!tip!&goto:eof)
	if %1==p goto:ppp
	if %1==0 set/a col.%2g=0
	if %1==1 set/a col.%2g=4
	if %1==2 set/a col.%2g=2
	if %1==3 set/a col.%2g=6
	if %1==4 set/a col.%2g=1
	if %1==5 set/a col.%2g=5
	if %1==6 set/a col.%2g=3
	if %1==7 set/a col.%2g=7
	:ppp
<nul set/p =[26;14H[0;!col.bl!;4!col.bg!;30m!tip!^
[27;14H[0;!col.fl!;40;3!col.fg!m!tip!^
[;m[28;14H%pen%[;m
%disp% [26;18Hÿ[26;21Hÿ[26;24Hÿ^
[27;18Hÿ[27;21Hÿ[27;24Hÿ
	if !col.bl!==0 %disp% [26;18H*
	if !col.bl!==1 %disp% [26;21H*
	if !col.bl!==5 %disp% [26;24H*
	if !col.fl!==0 %disp% [27;18H*
	if !col.fl!==1 %disp% [27;21H*
	if !col.fl!==5 %disp% [27;24H*
	goto:eof