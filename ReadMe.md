# Autopilot Scripts for Intune Packages for POS Rollout

Each folder contains a separate packges with scripts to automate the installation of required software for POS.

Each folder has an Install.ps1 and an Uninstall.ps1 script and other required scripts and files for each package.

## Prepare Win32 app content for upload

Download the [Win32 Content Prep Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool)

Run the tool from the root folder and answer the questions.

- Source folder is the package folder you want to package
- Setup file is install.ps1
- Output folder it "output". This will create an output folder in folder with the install.intunewin file.

```
Please specify the source folder: linkly
Please specify the setup file: install.ps1
Please specify the output folder: output
The output file 'output\install.intunewin' already exists. Do you want to delete it (Y/N)?y
Do you want to specify catalog folder (Y/N)?n
```

Once the Intune Package has been created you can upload the package to Intune.

## Uploading package to intune.

When you create the packge on intune. Set the following

### Program Settings

```
Install Command: Powershell.exe -NoProfile -ExecutionPolicy ByPass -File .\Install.ps1
Uninstall Command: Powershell.exe -NoProfile -ExecutionPolicy ByPass -File .\Uninstall.ps1
```

### Detection Rules

Each package will have an individual detection rule that needs to be set. See the packages ReadMe.md for details.
