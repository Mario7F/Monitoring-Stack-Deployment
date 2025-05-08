### Use Vagrant (automation tool) to deploy a container

![image](https://github.com/user-attachments/assets/e28f892e-da40-48ea-b765-0a212059dad9)

### Edit the configuration file for Vagrant with the container name and IP address

![image](https://github.com/user-attachments/assets/1ebebdd8-98fd-47c6-b184-1b1f84eadbc8)

### Deploy the container

![image](https://github.com/user-attachments/assets/f2bfee0f-65dd-4045-b622-05f46c79b22c)

### SSH into the container and install InfluxDB

![image](https://github.com/user-attachments/assets/4d8e22e4-a1a1-478a-827c-b76902e89bbb)

### Start influxdb and install telegraf to collect the data

![image](https://github.com/user-attachments/assets/3f8ce6b8-b1c2-443f-a37e-f37baaba8c25)

### Configure telegraf to collect data from sources

![image](https://github.com/user-attachments/assets/dd4d119e-581e-4641-8044-fefe6a7aa030)

### Once configured start and enble telegraf. Log into influxdb to display the databases

![image](https://github.com/user-attachments/assets/4650ea02-bca2-4b86-9aaf-0cf2ef2c45ab)

### Display the tables that telegraf will collect data from

![image](https://github.com/user-attachments/assets/719942d0-9146-4c53-8dfd-2723911eb188)

### Install Grafana

![image](https://github.com/user-attachments/assets/c4fb6330-c244-42c8-8bb1-b4590d3b9fc3)

### Start the Grafana server and enable for when the system boots up

![image](https://github.com/user-attachments/assets/8f446a39-df15-4893-8f81-ffbdd0a6f2ab)

### Access the Grafana UI using the IP address and port number, change password

![image](https://github.com/user-attachments/assets/8347eda2-13b1-408e-8dde-a679563e512c)

### Import data into Grafana

![image](https://github.com/user-attachments/assets/28be72a6-65fb-40a1-84ec-74477782bfde)

### Display the dashboard, make sure that its pulling data from the Telegraf-influxdb (datasource)

![image](https://github.com/user-attachments/assets/a0566eec-051d-4cb2-9737-bda0619c598f)


