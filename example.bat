@echo off
java -jar OLED.jar
:1
FOR /F "tokens=* USEBACKQ" %%F IN (`time /T`) DO (
SET var=%%F
)
ECHO %var%
FOR /f "skip=1" %%p in ('wmic cpu get loadpercentage /VALUE') do (
for /F "tokens=2 delims==" %%J in ("%%p") do SET CPU=%%J
)

java -jar OLED.jar "%date%" "%var%" "CPU %CPU%%%"
rem wait 10000

goto 1
