<a name="readme-top"></a>



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a>
    <img src="https://hackr.io/tutorials/operating-systems/logo-operating-systems.svg?ver=1557984006" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Backup cron job</h3>

  <p align="center">
    This is a cron job for backing up the contents of a source directory to a backup directory periodically
    <br />
    <br />
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
This project is basically a cronjob that backs up a given source directory to a given backup directory periodically using previously written backup bash script, the way the algorithm works is as follows:
<p>
  1. Check if this is the first backup
  <br>
  2. if it is then back up the source directory
  <br>
  3. if not check if there were any changes made to the source directory
  <br>
  4. if changes were made back them up and delete any number of backups above the maximum you specified
  <br>
  5. if no changes were made to the source directory go back to step 3
</p>


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started


### Prerequisites

Bash scripts are designed to work on linux OS so it essential to have your distro of choice setup on you machine or you could follow the tutorial in the this <a href="https://learn.microsoft.com/en-us/windows/wsl/install">link</a>

### Installation

* The only step you need to get your script ready is the following command to make sure it is executable
   ```sh
   chmod u+x <path to script>
   ```
* Additionally you will ned to make sure the cron service is running
   ```sh
   sudo service cron start
   ```
   ```sh
   sudo service cron status
   ```
   This is what you should expect
   ```sh
   *cron is running
   ```

   


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

* Type the following command to open up your crontab file and edit it
   ```sh
   crontab -e
   ```
   it might require a bit of setup at the beginning if it is your first time to use a cronjob ( I suggest you use the nano editor)
   
   in the nano editor you should enter the following to make your cronjob run every minute
   ```sh
   * * * * * '<full path up to backup script>/CronBackup.sh' <full path to source directory> <full path to backup directory> <maximum number of backups>
   ```
   Make sure to include all directories with spaces in single quotes to avoid any inconvenient errors

   of course if you want to configure your cronjob on different periods like for example the 3rd friday of every month you could do the following
   ```sh
   31 15-21 * * 5 '<full path up to backup script>/CronBackup.sh' <full path to source directory> <full path to backup directory> <maximum number of backups>
   ```
   for more configurations you could follow this schema
    ```sh
    *   *   *   *   *  sh /path/to/script/script.sh
    |   |   |   |   |              |
    |   |   |   |   |      Command or Script to Execute        
    |   |   |   |   |
    |   |   |   |   |
    |   |   |   |   |
    |   |   |   | Day of the Week(0-6)
    |   |   |   |
    |   |   | Month of the Year(1-12)
    |   |   |
    |   | Day of the Month(1-31)  
    |   |
    | Hour(0-23)  
    |
    Min(0-59)
   ```
   



* Or Alternatively you could just run the makefile which sets up a cronjob that runs every minute by default
   ```sh
   make dir=<source directory> backupdir=<backup directory> max-backups=<maximum number of backups>
  ```
  Make sure you are in the current directory of the makefile when executing this command
  
  The makefile can also be used to change the arguments of the cronjob even while it is running

* For starting and stopping the cron service use the follwing commands
   ```sh
   sudo service cron start
  ```
   ```sh
   sudo service cron stop
  ```


<p align="right">(<a href="#readme-top">back to top</a>)</p>






<!-- CONTACT -->
## Contact

Adham Elshafei  - es-adham.mohsen20@alexu.edu.eg - adham_mohsen@outlook.com


<p align="right">(<a href="#readme-top">back to top</a>)</p>

