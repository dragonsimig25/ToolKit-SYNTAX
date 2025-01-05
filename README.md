
#   Advanced Toolbox 

## **Description**
The **Advanced Toolbox** is a powerful shell script for Linux designed to provide various networking and system functionalities, including tools for Wi-Fi password retrieval, network speed testing, packet sending (DoS testing), port scanning, IP geolocation lookup, and much more. It is meant to be used for ethical and educational purposes only.

## **Features**
1. **Shut Down PCs by IP**: Remotely shut down computers by their IP addresses.
2. **Remove Toolbox**: Allows you to delete the toolbox script from your system.
3. **Show Joined Wi-Fi Passwords**: Displays saved Wi-Fi passwords (requires `sudo`).
4. **Get IP Information**: Gathers network information about a given IP address (ping, nslookup, traceroute).
5. **View Wi-Fi Profiles**: Displays saved Wi-Fi profiles from your network.
6. **Start Scanning**: Pings all devices in the local network's subnet (`192.168.1.x`).
7. **Packet Sender (DoS Tool for Wi-Fi Stress Testing)**: Performs a stress test on a Wi-Fi AP (use ethically on networks you own).
8. **Network Speed Test**: Uses `speedtest-cli` to test the network's download and upload speeds.
9. **IP Geolocation Lookup**: Retrieves geolocation data for a given IP address.
10. **Network Port Scanner**: Scans specified ports on a target IP using Netcat (`nc`).

## **Requirements**
For the script to function correctly, you will need to have the following tools installed on your system:

- `sudo` (to execute commands with superuser privileges)
- `speedtest-cli`: For running network speed tests.
  - Install it using: `sudo apt install speedtest-cli`
- `curl`: For IP geolocation lookup.
  - Install it using: `sudo apt install curl`
- `traceroute`: For network tracing.
  - Install it using: `sudo apt install traceroute`
- `nc` (Netcat): For port scanning.
  - Install it using: `sudo apt install netcat`

## **Installation**
1. Download the script and save it as `toolbox.sh`.

2. Make the script executable:

   ```bash
   chmod +x toolbox.sh
   ```

3. Run the script:

   ```bash
   ./toolbox.sh
   ```

## **Usage**

Once the script is executed, you will be prompted to enter a password to access the toolbox. The default password is **`syntax`**.

### **Main Menu Options:**
1. **Shut down PCs by IP**: Shut down a computer on your network by entering its IP address.
2. **Remove Toolbox**: Deletes the script from your system.
3. **Show joined Wi-Fi passwords**: View saved Wi-Fi passwords for networks your computer has connected to.
4. **Get IP information**: Retrieve information about a specific IP address (ping, nslookup, traceroute).
5. **View Wi-Fi profiles**: Display the saved Wi-Fi profiles on your system.
6. **Start scanning**: Ping all devices in your subnet (192.168.1.x).
7. **Packet Sender (DoS Tool)**: Stress test a Wi-Fi AP using a denial-of-service (DoS) attack. **(Use only on networks you own or have permission to test.)**
8. **Network Speed Test**: Run a speed test using `speedtest-cli` to check your network's upload and download speeds.
9. **IP Geolocation Lookup**: Get the geolocation of any IP address.
10. **Network Port Scanner**: Scan a target IP address for open ports.

## **Important Notes**
- **Ethical Use**: This toolbox is designed for educational and ethical use only. The DoS tool (Packet Sender) should only be used on networks you own or have explicit permission to test. Unauthorized use of DoS attacks on third-party networks is illegal and unethical.
- **sudo Permissions**: Some functionalities (like showing Wi-Fi passwords and scanning networks) may require `sudo` permissions. Ensure you have the necessary administrative privileges.
  
## **Troubleshooting**
- **Wi-Fi Passwords Not Displaying**: The script retrieves saved Wi-Fi passwords using `NetworkManager`. Ensure that your system is using NetworkManager and that you have the correct permissions (use `sudo`).
- **Command Not Found**: If any of the required tools (`speedtest-cli`, `curl`, `traceroute`, `nc`) are missing, install them using the `apt` package manager:
  ```bash
  sudo apt install speedtest-cli curl traceroute netcat
  ```

## **Contributing**
Feel free to contribute to the project by submitting issues or pull requests. If you'd like to improve the functionality or add new features, please create an issue, and we can discuss it further.

## **License**
This project is licensed under the MIT License.

## **Disclaimer**
The **Advanced Toolbox** script is intended for ethical and educational use. Misuse of the script for illegal activities, including unauthorized network scanning, denial of service attacks, or hacking, is prohibited. Always use this tool responsibly and with explicit permission on the networks you are testing.
