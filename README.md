### Under construction!!!

# FIT_Research_semester_III 
![vision_lora](https://user-images.githubusercontent.com/57041076/78720565-3b5ead00-7926-11ea-8322-07cc2c69e511.jpg)
## Description
Project documentation on the feasibility of the IoT technology LoRaWAN in the forestry and environmental sector, carried out at the J.H. v. Thuenen Institute, Department of Forest Ecology and Biodiversity. This feasibility study was carried out during the research semester of the study course Forest Information Technology at the University for Sustainable Development in Eberswalde

![pic1_britz](https://user-images.githubusercontent.com/57041076/75095818-51442880-5599-11ea-864a-949eaae4b699.jpg)



### About the project
This project is divided into three parts:

- Part 1. Providing the infrastructure of gateways for communication
- Part 2. Assembly of the node and programming
- Part 3. Data storage and visualization

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

![blackplane3](https://user-images.githubusercontent.com/57041076/78673683-c7e77c00-78e2-11ea-8c1f-184f03ca78a7.jpg)

![lora_doku_gw2](https://user-images.githubusercontent.com/57041076/75115927-a9dff800-5663-11ea-8da8-a792499b60b2.jpg)

![lora_doku_gw1](https://user-images.githubusercontent.com/57041076/75115912-79985980-5663-11ea-9aa5-6189e7b346c4.jpg)

## Commissioning of the gateway
1. rasbian lite version 9 on sd card (not buster v10) 

https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip

2.1 create the file ssh (without ext. and without content) in boot

2.2 from the zip file, add the two entries from the config.txt to the config.txt on the sd card at the end

3. boot and log in with pi raspberry via ssh (read ip from dhcp-server)

4. sudo su

5. enter a password for root with passwd

6. nano /etc/ssh/sshd_config => permitrootlogin remove comment and put yes with a space directly after permit... and delete the rest in the line

7. restart ssh /etc/init.d/ssh restart

8. reboot pi 

9. unzip the files in the attachment and copy them to /root. Grant execution rights to all files except config.txt.

change to /root

10. in_1... enter the name of the gateway

11. execute ttn_setup-01.sh (pass input with enter, you will be asked for something later)

12. after the boot switch back to root and execute ttn_setup-02. Then reboot again and overlayFS is installed. If you need to change anything, always disable lpie first, then reboot, make changes and finally enable overlayFS again with lpie enable and reboot.

Translated with www.DeepL.com/Translator (free version)


# Part 2. Assembly of the node and programming

# Part 3. Data storage and visualization
nodered, influxDB and "fancy :)" grafana
![lora_doku_nodered](https://user-images.githubusercontent.com/57041076/75171663-48379080-572c-11ea-85af-91a5eda60a23.png)

![scrennshot_grafana](https://user-images.githubusercontent.com/57041076/78503493-225bcd80-7767-11ea-8445-64cb7686b4b3.png)


