# ALMVMs

PowerShell scripts for downloading the ALM VM's without a download manager.

## Overview

If you don't know Brian Keller and his ALM VM's, you should really [check them out](http://aka.ms/ALMVMs). Each VM contains a completely installed environment for a specific (ALM-related) scenario and comes with a comprehensive set of demo's and hands-on-labs.

If you've read the download instructions for these VM's, you'll know that it tells you to use the 'Free Download Manager' and copy/paste a list of url's to download all the parts. This works nice, but the first thing I do after I'm done downloading, is remove the download manager. It intercepts every download, which I find rather annoying.

To be able to download the VM's without the download manager, I wrote the PowerShell scripts in this repository. I'll add/update the scripts, if needed, when VM's are added or updated.

## How it works

Each VM, and accompanying files for hands-on-labs and demo's, can be downloaded by executing the corresponding command from the paragraph below.

Each command will download the script as a string, and then executes that string as a script. The script first downloads the web-page containing the url's. Then takes the url's from the page and splits them into an array. Finally, all url's are downloaded into a VM-specific folder in the current user's downloads-folder. The script for each VM is basically the same, only the url for the initial web-page and the folder in Downloads are different.

For more information read [this blog-post](http://blog.codeblack.nl/post/download-the-alm-vm-s-without-a-download-manager.aspx). If you think there's a problem with the scripts, or I'm missing additions/updates on the VM's, let me know on my blog or create an issue here.

Feel free to download the scripts and modify them as you wish, or fork this repo. If you do, don't forget to change the url's in the commands.

## Usage

### [Visual Studio 2013 Application Lifecycle Management Virtual Machine](http://aka.ms/vs13almvm)

	iex ((new-object net.webclient).DownloadString("https://raw.githubusercontent.com/CodeblackNL/ALMVMs/master/vs13almvm.ps1"))

### [Visual Studio 2012 Application Lifecycle Management Virtual Machine](http://aka.ms/vs11almvm)

	iex ((new-object net.webclient).DownloadString("https://raw.githubusercontent.com/CodeblackNL/ALMVMs/master/vs11almvm.ps1"))

### [Team Foundation Server 2012 and Project Server 2013 Integration Virtual Machine](http://aka.ms/TFSPSVM)

	iex ((new-object net.webclient).DownloadString("https://raw.githubusercontent.com/CodeblackNL/ALMVMs/master/tfspsvm.ps1"))

### [Team Foundation Server 2012 and System Center 2012 Operations Manager Integration Virtual Machine](http://aka.ms/TFSSCOMVM)

	iex ((new-object net.webclient).DownloadString("https://raw.githubusercontent.com/CodeblackNL/ALMVMs/master/tfsscomvm.ps1"))

