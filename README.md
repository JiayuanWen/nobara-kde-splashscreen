<h1 align="center">Nobara Purple Void</h1>
<div align="center">
  <img src="./NobaraPurpleVoid/contents/previews/splash.gif"/>
</div>

<div align="center">
  
A splashscreen for [Nobara Linux KDE](https://nobaraproject.org/). Nothing fancy, just something to make Nobara Linux feel more complete. <br/>
</div>

> [!IMPORTANT]
> The main branch is developed for Plasma 6. For Plasma 5, see: https://github.com/JiayuanWen/nobara-kde-splashscreen/tree/plasma-5

> [!NOTE]
> This splashscreen is not uploaded to KDE Store, thus it cannot be found via settings


<br/>
<br/>

## (For dev) To Preview:

<small>Note: You will have to be using KDE Plasma to be able to preview the splashscreen during development.</small>



To preview/test the splashscreen, first give the `./preview` script permission to execute:
```bash
sudo chmod +x ./preview
```

After granting permission, run the script to start the preview:
```bash
./preview
```
<br>


## To Install:

Clone this repository:
``` bash 
tar -xvf NobaraPurpleCycle.tar
```
\
Go into the extracted folder:
``` bash
cd NobaraPurpleCycle/
```
\
To install:
* Install for current user (accessible to you only):
  ``` bash
  sudo chmod +x ./install-user && ./install-user
  ````
* Install for entire system (everyone can use it):
  ``` bash
  sudo sh -c 'chmod +x ./install-system && ./install-system'
  ````

<br/>
<br/>

## Credits:
Built on top of Breeze splashscreen by KDE Visual Design Group.
