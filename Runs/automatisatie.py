# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 09:34:10 2024

@author: Wessel Poorthuis
@org: PBL
"""

# -*- coding: utf-8 -*-

# For this to work the "pause" needs to be deleted from the end of the batch file

# Environment information:
# https://stackoverflow.com/questions/43145667/anaconda-is-not-creating-full-environment
# https://medium.com/@apremgeorge/using-conda-python-environments-with-spyder-ide-and-jupyter-notebooks-in-windows-4e0a905aaac5

# Reset parameters between runs of script in Spyder
from IPython import get_ipython
get_ipython().magic('reset -sf')

# Import modules
import pandas as pd           # To work with input and output data
import os                     # To define paths, make folders, rename files
import logging                # To log information to logfile
import subprocess             # To run the batchfile
import shutil                 # To move folders
import sys                    # To exit script, log modules
from datetime import datetime # To time how long the runs take

# Setting paths
vesta_path      = r'C:\Vesta' # Set this to your Vesta folder
data_path       = r'K:\'' 
geodms_version  = '14.14.1'   # Set this to your GeoDMS version
batchfile_name  = 'batch_leidraad_runs.bat'
PD_name         = 'PD_SA'
PD_path         = os.path.join(vesta_path, PD_name)
SD_path         = os.path.join(data_path, 'SD50_SA')
LD_path         = os.path.join(vesta_path, 'LD')
runs_path       = os.path.join(PD_path, 'runs')
batchfile_path  = os.path.join(runs_path, batchfile_name)
results_path    = os.path.join(LD_path, PD_name)

Gevoeligheidsanalyse = True
    
def run_vesta(scenario_name, batchfile_path):
    # Execute the bash file to start run
    # From https://stackoverflow.com/questions/70189890/running-batch-file-with-subprocess-call-does-not-work-and-freezes-ipython-consol
    hestia_run = subprocess.Popen([batchfile_path], creationflags=subprocess.CREATE_NEW_CONSOLE)
    hestia_run.wait(timeout=None)
    
def rename_results_folder():
    # Create dedicated results folder
    date = datetime.now().strftime('%Y_%m_%d-%H_%M_%S')
    run_resultsfolder_name = date #+ '_GeoDMSv' + geodms_version
    run_resultsfolder_path = os.path.join(results_path, run_resultsfolder_name)
    os.makedirs(run_resultsfolder_path)
    
    return run_resultsfolder_path
                
def change_text(filepath, text_lookup, text_write):
    # Read in the file
    with open(filepath, 'r') as file:
      filedata = file.read()
    
    # Replace the target string
    filedata = filedata.replace(text_lookup.lower(), text_write.lower())
    
    # Write the file out again
    with open(filepath, 'w') as file:
      file.write(filedata)

def main():    
    # Set scenario's
    if Gevoeligheidsanalyse == True:
        scenario_dict = {'G01' : 'veel_kostenreductie',
                         'G02' : 'weinig_kostenreductie',
                         'G03' : 'lagere_energieprijzen',
                         'G04' : 'hogere_energieprijzen',
                         'G00' : 'main'} 
    else:
        scenario_dict = {'G00' : 'main'}

    # Set IncludeGA in sharedinvoer.dms to true or false
    if Gevoeligheidsanalyse == True:
        change_text(os.path.join(runs_path, 'sharedinvoer.dms'), 'parameter<bool> IncludeGA := false;'.lower(), 'parameter<bool> IncludeGA := true;'.lower())
    else:
        change_text(os.path.join(runs_path, 'sharedinvoer.dms'), 'parameter<bool> IncludeGA := true;'.lower(), 'parameter<bool> IncludeGA := false;'.lower())

    # Loop over scenario's
    for abbreviation, scenario_name in scenario_dict.items():
        
        # copy PD_SA to new location and rename PD_SA to PD_SA_{scenario} if not normal run
        destination_path = os.path.join(vesta_path, f'{PD_name}_{scenario_name}')            
        if 'main' not in scenario_name:
            print(scenario_name)
            # Copy PD
            try:
                shutil.copytree(PD_path, destination_path)
            except PermissionError:
                print('PD is open in Visual Studios')
            except FileExistsError:
                print(f'{destination_path} already exists, so no copy was made')
                continue
        
            # Set scenario-parameter for gevoeligheidsanalyse in sharedinvoer.dms of copied PD
            change_text(os.path.join(destination_path, 'runs', 'sharedinvoer.dms'), f'parameter<bool> {abbreviation}_aan := false;'.lower(),  f'parameter<bool> {abbreviation}_aan := true;')
        
            # Run Vesta from new PD
            
            # Delete copied PD
            shutil.rmdir(destination_path)
        
        else: 
            continue
            # Run Vesta from normal PD

    # Set parameter for gevoeligheidsanalyse in sharedinvoer.dms back to false
    change_text(os.path.join(runs_path, 'sharedinvoer.dms'), 'parameter<bool> IncludeGA := true;'.lower(), 'parameter<bool> IncludeGA := false;'.lower())
        
        
    # Rename all results folders in LD/newPDs
    
    

if __name__ == "__main__":
	main()









