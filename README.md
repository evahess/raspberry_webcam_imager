# raspberry_webcam_imager

This is mainly a test repo to teach my little sister git and bash.
It contains an example script to show how to create a webcam image on your raspberry pi.

To use it add it to [your crontab](http://corntab.com/).

## Setup

To setup this script, clone the repo to your raspberry pi:

```
git clone https://github.com/evahess/raspberry_webcam_imager.git /home/pi/webcam
```

Then make the script executable:
```
chmod 750 /home/pi/webcam/save_image.sh
```

Install the dependencies:
```
sudo apt-get update
sudo apt-get install fswebcam guvcview
```

Then add the script to your crontab
```
export EDITOR=nano
crontab -e
```

And add the following job:
```
*/30 * * * * /home/pi/webcam/save_image.sh
```

## Use this script

This script saves an image every 30 minues in `/home/pi/webcam/images/<year>/<month>/`

