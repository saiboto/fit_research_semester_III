# The use of the IoT technology ‘LoRaWAN’ in forest and environmental monitoring 
![vision_lora](https://user-images.githubusercontent.com/57041076/78720565-3b5ead00-7926-11ea-8322-07cc2c69e511.jpg)
## Description
Project documentation on the feasibility of the IoT technology LoRaWAN in the forestry and environmental sector, carried out at the J.H. v. Thuenen Institute, Department of Forest Ecology and Biodiversity. This feasibility study was carried out during the research semester of the study course Forest Information Technology at the University for Sustainable Development in Eberswalde.

![pic1_britz](https://user-images.githubusercontent.com/57041076/75095818-51442880-5599-11ea-864a-949eaae4b699.jpg)
Node with connected sensor in Stevenson screen.


### About the project
This project is divided into three parts:

1. Building the local gateway infrastructure
2. Construction and programming of the sensors/ nodes
3. Data storage and visualization of the transmitted data.

# Part 1. Providing the infrastructure of gateways for communication
![lora_flow](https://user-images.githubusercontent.com/57041076/75113741-97a88e80-5650-11ea-9d76-278c2c08c37a.png)

**Enclosure**
- Nebra IP67 Waterproof/Weatherproof Enclosure                
- Pigtail U.FL -> N                                            	
- Delock LoRA 868Mhz Antenna N Buchse 3 dBi 32 cm			        

**Power supply** 
- DSLRKIT Gigabit Ethernet Active PoE Splitter 5V Micro USB	  
- Ubiquiti POE-48-24W-G PoE Injektor				                  
- Outddor-Patchkabel (CAT6)						                       

**Electronic components**
- iC880A-SPI - LoRaWAN Concentrator 868 MHz (IMST GmbH)			           
- Backplane (DIY) 
- Raspberry pi 2b+/3b+ 				                          		  
- cables & other small parts	
### Total costs ~ 370€

![blackplane1](https://user-images.githubusercontent.com/57041076/78673284-3546dd00-78e2-11ea-996c-c97587c80db0.jpg)
The shown backplane for Raspberry pi and iC880a not only serves to connect both components, but also to isolate unwanted frequencies from the Raspberry pi to the iC880A. 

![blackplane3](https://user-images.githubusercontent.com/57041076/78673683-c7e77c00-78e2-11ea-8c1f-184f03ca78a7.jpg)
Circuit of the backplane

![lora_doku_gw2](https://user-images.githubusercontent.com/57041076/75115927-a9dff800-5663-11ea-8da8-a792499b60b2.jpg)
Power supply and data line run via Power over ethernet (PoE)

![lora_doku_gw1](https://user-images.githubusercontent.com/57041076/75115912-79985980-5663-11ea-9aa5-6189e7b346c4.jpg)
Ready-built gateway based on a Raspberry pi 3b+ and an iC880A 

## Commissioning of the gateway
- rasbian lite version 9 on sd card (not buster v10) 

  https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip

- create the file ssh (without ext. and without content) in boot

- from the zip file, add the two entries from the config.txt to the config.txt on the sd card at the end

- boot and log in with raspberry pi via ssh (read ip from dhcp-server)

- sudo su

- enter a password for root with passwd

- nano /etc/ssh/sshd_config => permitrootlogin remove comment and put yes with a space directly after permit... and delete   
  the rest in the line

- restart ssh /etc/init.d/ssh restart

- reboot pi 

- unzip the files in the attachment and copy them to /root. Grant execution rights to all files except config.txt.

  change to /root

- in_1... enter the name of the gateway

- execute ttn_setup-01.sh (pass input with enter, you will be asked for something later)

- after the boot switch back to root and execute ttn_setup-02. Then reboot again and overlayFS is installed. If you need to     
  change anything, always disable lpie first, then reboot, make changes and finally enable overlayFS again with lpie, enable 
  and reboot.
  
![Heatmap_EW](https://user-images.githubusercontent.com/57041076/79078997-886ac680-7d0c-11ea-93bb-87b1be900530.png)
Heatmap Eberswalde [Status 01.04.2020] 
# Part 2. Assembly of the node and programming
![node2](https://user-images.githubusercontent.com/57041076/79074425-91e43680-7cec-11ea-9a9d-80a2b86a7321.jpg)
eHarvester with 300mAh battery storage element.

# Part 3. Data storage and visualization
NodeRed, InfluxDB and Grafana
![lora_doku_nodered](https://user-images.githubusercontent.com/57041076/75171663-48379080-572c-11ea-85af-91a5eda60a23.png)
Node-RED is a visual tool for creating IoT prototypes by graphically connecting online services, APIs and hardware devices.

![scrennshot_grafana](https://user-images.githubusercontent.com/57041076/78503493-225bcd80-7767-11ea-8445-64cb7686b4b3.png)

## If you need help with a technical problem or if you would like to know more about this project, please send me an E-Mail. You can also visit our TTN-Eberswalde community page. Thanks for you interesst and you input!
tku837(at)hnee.de

https://www.thethingsnetwork.org/community/eberswalde/

