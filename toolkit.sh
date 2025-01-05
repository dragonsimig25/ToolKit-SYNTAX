#!/bin/bash

# Display ASCII Art
clear
echo "████      ▄██████▄   ▄██████▄   ▄█          ▄█   ▄█▄  ▄█      ███"
echo "▀█████████▄ ███    ███ ███    ███ ███         ███ ▄███▀ ███  ▀█████████▄"
echo "   ▀███▀▀██ ███    ███ ███    ███ ███         ███▐██▀   ███▌    ▀███▀▀██"
echo "    ███   ▀ ███    ███ ███    ███ ███        ▄█████▀    ███▌     ███   ▀"
echo "    ███     ███    ███ ███    ███ ███       ▀▀█████▄    ███▌     ███"
echo "    ███     ███    ███ ███    ███ ███         ███▐██▄   ███      ███"
echo "    ███     ███    ███ ███    ███ ███▌    ▄   ███ ▀███▄ ███      ███"
echo "   ▄████▀    ▀██████▀   ▀██████▀  █████▄▄██   ███   ▀█▀ █▀      ▄████▀"
echo "                                 @Syntax"
echo

# Password requirement
read -p "Enter password to access the toolbox: " input
password="syntax"

if [[ "$input" != "$password" ]]; then
    echo "Incorrect password! Exiting..."
    sleep 3
    exit 1
fi

# Main Menu
menu() {
    clear
    echo "=========================================================="
    echo "                    ADVANCED TOOLBOX"
    echo "=========================================================="
    echo "[1] Shut down PCs by IP"
    echo "[2] Remove Toolbox"
    echo "[3] Show joined WiFi passwords"
    echo "[4] Get IP information"
    echo "[5] View WiFi profiles"
    echo "[6] Start scanning"
    echo "[7] Packet Sender (DoS Tool)"
    echo "[8] Network Speed Test"
    echo "[9] IP Geolocation Lookup"
    echo "[10] Network Port Scanner"
    echo "[11] Exit"
    echo "=========================================================="
    echo "Created by: Syntax"
    echo "=========================================================="
    read -p "Select an option (1-11): " choice

    case $choice in
        1) shutdown_pcs ;;
        2) remove_toolbox ;;
        3) show_wifi_passwords ;;
        4) get_ip_info ;;
        5) view_wifi_profiles ;;
        6) start_scanning ;;
        7) packet_sender ;;
        8) network_speed_test ;;
        9) ip_geolocation ;;
        10) network_port_scanner ;;
        11) exit 0 ;;
        *) menu ;;
    esac
}

# Shutdown PCs by IP
shutdown_pcs() {
    clear
    read -p "Enter the IP address of the computer to shut down: " ip
    echo "Attempting to shut down PC with IP: $ip"
    sudo shutdown -h now "$ip"
    sleep 2
    menu
}

# Remove Toolbox
remove_toolbox() {
    clear
    echo "Removing toolbox..."
    sleep 2
    rm -- "$0"
    echo "Toolbox has been removed."
    exit 0
}

# Show joined WiFi passwords (requires sudo)
show_wifi_passwords() {
    clear
    echo "Here are the saved WiFi profiles:"
    sudo iw dev wlan0 scan | grep SSID
    read -p "Enter the name of a WiFi profile: " wifi
    sudo cat /etc/NetworkManager/system-connections/"$wifi" | grep psk= | cut -d '=' -f2
    sleep 2
    menu
}

# Get IP information
get_ip_info() {
    clear
    read -p "Enter the IP address you want to get information about: " ip
    echo "Gathering information about $ip..."
    ping -c 1 $ip
    nslookup $ip
    traceroute -m 5 $ip
    sleep 2
    menu
}

# View WiFi profiles
view_wifi_profiles() {
    clear
    echo "Displaying all saved WiFi profiles:"
    sudo cat /etc/NetworkManager/system-connections/*
    sleep 2
    menu
}

# Start scanning the network
start_scanning() {
    clear
    echo "Scanning the network (pinging all PCs in the subnet)..."
    for i in {1..254}; do
        ping -c 1 192.168.1.$i | grep "64 bytes"
    done
    sleep 2
    menu
}

# Packet Sender (DoS Tool for Wi-Fi Stress Testing)
packet_sender() {
    clear
    echo "WARNING: Only use this tool on networks you own or have permission to test."
    read -p "Enter the IP address of the target Wi-Fi AP: " target_ip
    read -p "Enter the duration of the stress test (in seconds): " duration
    read -p "Enter the number of packets to send per second: " packet_count

    echo "Starting DoS test against $target_ip for $duration seconds..."
    echo "Sending $packet_count packets per second..."
    for ((i=1;i<=duration;i++)); do
        for ((j=1;j<=packet_count;j++)); do
            ping -c 1 $target_ip > /dev/null
        done
    done
    echo "Test completed."
    sleep 2
    menu
}

# Network Speed Test (requires speedtest-cli)
network_speed_test() {
    clear
    echo "Running Network Speed Test..."
    speedtest-cli
    sleep 2
    menu
}

# IP Geolocation Lookup (requires curl)
ip_geolocation() {
    clear
    read -p "Enter IP Address: " ip
    echo "Fetching geolocation data for $ip..."
    curl https://ipinfo.io/$ip/json
    sleep 2
    menu
}

# Network Port Scanner
network_port_scanner() {
    clear
    read -p "Enter IP address to scan: " target_ip
    read -p "Enter port range (e.g., 1-1024): " port_range

    echo "Scanning ports in range $port_range on $target_ip..."
    for port in $(seq $(echo $port_range | cut -d '-' -f1) $(echo $port_range | cut -d '-' -f2)); do
        echo "Scanning port $port..."
        nc -zv -w1 $target_ip $port
    done
    sleep 2
    menu
}

# Run the main menu
menu
