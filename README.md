# raspberry_webcam_imager

This script saves an webcam image to a Raspberry Pi.
Adding a crontab job will save an webcam image every 30 minutes.

To use it add it to [your crontab](http://corntab.com/).

## Setup

To setup this script, clone the repo to your Raspberry Pi:

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

Then add the script to your crontab:
```
export EDITOR=nano
crontab -e
```

And add the following job:
```
*/30 * * * * /home/pi/webcam/save_image.sh
```

## Use this script

This script saves an image every 30 minutes in `/home/pi/webcam/images/<year>/<month>/`

