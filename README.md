# nginx-log-analyser

## Table of Contents

- [About](#about)
- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation & Usage](#installation--usage)
- [Example Output](#example-output)
- [How It Works](#how-it-works)
- [Error Handling](#error-handling)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## About

`nginx-log-analyser` is my fifth Linux/Bash project in my DevOps learning journey. It is a simple command-line tool to analyze and extract statistics from nginx log files. It provides a quick overview of access patterns, server errors, and user agents.

**Project Reference:** [roadmap.sh/projects/nginx-log-analyser](https://roadmap.sh/projects/nginx-log-analyser)

## Features

- **Top 5 IP Addresses** : Identifies the most active sources
- **Most Requested Paths** : Analyzes the most accessed resources
- **HTTP Status Codes** : Summary of server responses
- **User Agents** : Detects the most common browsers and clients
- **Colorized Output** : Visual and easy-to-read results

## Project Structure

```text
nginx-log-analyser/
├── log-analyser.sh   # Main analysis script
├── README.md         # Project documentation
└── nginx.log         # nginx log file (to be placed in the directory)
```

## Requirements

- **Bash** 4.0 or higher
- **GNU coreutils** : `awk`, `sort`, `uniq`, `cat`
- Access to an nginx log file

## Installation & Usage

### 1. Clone or download the repository

Option A - Clone with Git:

```bash
git clone https://github.com/JescAude18/nginx-log-analyser.git
cd nginx-log-analyser
```

Option B - Download ZIP from GitHub:

1. Open the repository page: `https://github.com/JescAude18/nginx-log-analyser`
2. Click `Code` -> `Download ZIP`
3. Extract the archive and move into the project folder:

```bash
cd nginx-log-analyser
```

### 2. Make the script executable

```bash
chmod +x log-analyser.sh
```

### 3. Run the script

- Place your `nginx.log` file in the same directory as the script
- Run the analysis :

```bash
./log-analyser.sh
```

## Example Output

```text
=============================== NGINX LOG ANALYSER ! ========================================
Welcome ! This nginx log analyser displays statistics on the top 5 IP addresses, most 
requested paths, top response status codes, and top user agents of a nginx logs file.
Thanks for trying it ♥️!
============================================================================================

Top 5 IP adresses with the most requests :
192.168.1.100 - 1523 requests
10.0.0.50 - 892 requests
172.16.0.10 - 645 requests
203.0.113.45 - 412 requests
198.51.100.5 - 256 requests

Top 5 most requested paths :
/index.html - 2145 requests
/api/data - 1823 requests
/images/logo.png - 1456 requests
/css/style.css - 891 requests
/404.html - 234 requests

Top 5 response status codes :
200 - 5120 requests
304 - 1523 requests
404 - 345 requests
500 - 87 requests
403 - 42 requests

Top 5 user agents :
Mozilla/5.0 - 3456 requests
curl/7.68.0 - 1235 requests
Python-Requests/2.25.1 - 654 requests
Wget/1.20.3 - 432 requests
Custom-Bot/1.0 - 198 requests
```

## How It Works

### 1. **Top IP Addresses**

```bash
awk '{print $1}' | sort | uniq -c | sort -k1 -n -r | head -5
```

- Extracts the first column (IP address)
- Counts unique occurrences
- Sorts by descending count
- Displays the top 5 results

### 2. **Most Requested Paths**

```bash
awk -F '"' '{print $2}' | awk '{print $2}' | sort | uniq -c | sort -k1 -n -r | head -5
```

- Uses double quotes as delimiters
- Extracts the HTTP request path
- Counts and sorts occurrences

### 3. **HTTP Status Codes**

```bash
awk -F '"' '{print $3}'| awk '{print $1}' | sort | uniq -c | sort -nrk1 | head -5
```

- Parses status codes after the HTTP request
- Aggregates response statistics

### 4. **User Agents**

```bash
awk -F '"' '{print $6}' | sort | uniq -c | sort -nrk1 | head -5
```

- Extracts the user-agent from the log
- Identifies the most common clients

## Error Handling

The script currently performs a few basic checks before starting the analysis:

- It stops with a clear error message if `nginx.log` is missing from the current directory.
- It stops if the log file exists but is not readable.
- It stops if the log file is empty.

When one of these checks fails, the script exits before producing any statistics.

## Roadmap

- [ ] Support for command-line parameters to specify the log file
- [ ] Options to customize the number of results (top N)
- [ ] Support for multiple log formats
- [ ] Export results to JSON/CSV
- [ ] Error handling for non-conforming log formats

## Contributing

Contributions are welcome! To contribute:

1. Fork the project
2. Create a branch for your feature (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Author

**Created by**: Jessica MOUSSOUGAN

**Email**: [jessicamoussougan@gmail.com](mailto:jessicamoussougan@gmail.com)

**GitHub**: [@JescAude18](https://github.com/JescAude18)

## License

No license yet.

This project is currently for personal training and learning.
