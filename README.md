<h1 align="center">Splashscreen for Nobara KDE</h1>
<div align="center">
  <img src="https://raw.githubusercontent.com/JiayuanWen/nobara-kde-splashscreen/main/Nobara.SplashScreen/contents/previews/splash.png"/>
</div>

<div align="center">
  
A simple splashscreen for [Nobara Linux KDE](https://nobaraproject.org/). Nothing fancy, just something to make Nobara Linux feel more official. Feel free to fork to make something fancier. <br/>
</div>

> [!IMPORTANT]
> The main branch is being worked on for Plasma 6. For Plasma 5 code, see: https://github.com/JiayuanWen/nobara-kde-splashscreen/tree/plasma-5

> [!NOTE]
> This splashscreen is not uploaded to KDE Store, thus it cannot be found via settings


<br/>
<br/>

## To Install:
Download the tar archive [here](https://github.com/JiayuanWen/nobara-kde-splashscreen/releases/latest), save it somewhere convinent. \
\
Extract the archive with `tar`:
``` bash 
tar -xvf Nobara-Splashscreen.tar
```
\
Go into the extracted folder:
``` bash
cd Nobara-SplashScreen/
```
\
To install automatically, run `install` as root:
``` bash
sudo ./install
```
If `./install` give permission error, give execute permission:
``` bash
sudo sh -c 'chmod +x ./install && ./install'
```
\
Alternatively, you can copy the splashscreen manually:
```
cp -rv ./Nobara.SplashScreen ~/.local/share/plasma/look-and-feel/
```
<br/>
<br/>

## Credits:
Built on top of Breeze splashscreen by KDE Visual Design Group.
