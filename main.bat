@ECHO OFF
cls
echo Welcome to PodTube v1
echo  
set /p Input=Enter YouTube Link to download: 
yt-dlp %Input%
md Download
move *.mp4 Download
cd Download
for %%F in (*.mp4) do handbrake-CLI.exe  --preset-import-file "../presets.json" -Z "Apple 240p30" -i "%%F" -o "%%~nF.m4v"
mkdir %USERPROFILE%/Videos/PodTube Converted Videos/
move *.m4v %USERPROFILE%/Videos/PodTube Converted Videos

echo All files were successfully downloaded, converted, and placed in your Videos library in the PodTube Converted Videos folder. Enjoy :)