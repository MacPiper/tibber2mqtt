# tibber2mqtt
Publishes Tibber live consumption data from Tibber API per MQTT.

This version is based on / forked from danielringch/tibber2mqtt (bit thanks to him!) adding the following:

- Adaptions for running with docker compose
- Option to get plain numbers published to MQTT

## Introduction

If you are a customer of [Tibber](https://tibber.com/) and use a [Tibber Pulse](https://tibber.com/de/pulse), you can retrieve realtime consumption data via the Tibber API.

This program publishes realtime consumption data from Tibber to one or more MQTT brokers of your choise.

## Get tibber token and home id

* Go to https://developer.tibber.com/settings/access-token , log in with your Tibber credentials and you will see the access token
* After this, open https://developer.tibber.com/explorer and paste the following code into the left text box:
```
{
  viewer {
    homes {
      id
    }
  }
}
```
* Execute the query (play button above the text box) and you will see your home id in the left text box

## **Configuration**

The configuration is done via yaml file. The example file can be found in [config/sample.yaml](config/sample.yaml)

To keep sensitive content out of config files, some parameters can also be passed using environment variables. See the example config file for further explanations.

## Setup for running without docker
### **Prerequisites**

- Python version 3.8 or newer with pip + venv

This program should run in any OS, but I have no capacity to test this, so feedback is appreciated. My test machines run Ubuntu and Raspbian.

### **Install**

```
git clone https://github.com/danielringch/tibber2mqtt.git
python3 -m venv <path to virtual environment>
source <path to virtual environment>/bin/activate
python3 -m pip install -r requirements.txt
```


## **Usage**

```
source <path to virtual environment>/bin/activate
python3 -B tibber2mqtt/tibber2mqtt.py --config /path/to/your/config/file.yaml
```
## **Setup for running using docker**
For configuration copies of the sample configration files need to be created and adapted:

- config/config.yaml based on config/sample.yaml
- tibber.env based on tibber.env.sample
- mqtt.env based on mqtt.env.sample
Please not that mqtt.env may contain data for multiple servers, the name used for the server in config.yaml (e.g. server1) is part
of the environment variable names, e.g. ```T2M_MQTT_HOST_server1=localhost:1883```
. Just add a set of additional environment variables for
every additional server.

After ajusting the configuration the container can be started in the background using the following command:

```
docker compose up -d
```

## **Get support**

You have trouble getting started? Something does not work as expected? You have some suggestions or thoughts? Please let me know.

Feel free to open an issue here on github or contact me through email  [46072226+MacPiper@users.noreply.github.com](mailto:46072226+MacPiper@users.noreply.github.com)
