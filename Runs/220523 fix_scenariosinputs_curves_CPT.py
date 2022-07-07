# -*- coding: utf-8 -*-
"""
Created on Mon May 23 12:10:15 2022

@author: poorthuisw
"""

import pandas as pd           # To work with input and output data
import os                     # To define paths, make folders, rename files
import csv

# Setting paths
hestia_path     = r'K:\Hestia' # Set this to your Hestia folder
batchfile_name  = 'batch_HestiaRun_KalibratieTellingen.bat'
PD_path         = os.path.join(hestia_path, 'PD')
runs_path       = os.path.join(PD_path, 'runs')
scurve_path     = os.path.join(PD_path, 'scurve')

# Create naming list
names_list = []
parameter_list = ['nrYears', 'StudieGebied', 'StartgegevensAAN', 'Spreiding', 'Staart', 'RenovatieGrens',
      'CPT', 'LossAversion', 'DiminishingSensitivity', 'lambda', 'alpha', 'beta']
for param in parameter_list:
    names_list.append(param)  

# Making entry names for gebouwoptie
inputfile_name = 'Scurves_gebouwoptie.csv'
path_in = os.path.join(scurve_path, inputfile_name)
scurve_gebouwoptie = pd.read_csv(path_in,  sep=',')

count = 0
for optie in scurve_gebouwoptie.T:
    gebouwoptie = scurve_gebouwoptie.iloc[count,0]
    eigendom = scurve_gebouwoptie.iloc[count,1]
    entry_name_BETA = f'Gebouwoptie-{gebouwoptie}-{eigendom}-BETA'
    entry_name_P50P = f'Gebouwoptie-{gebouwoptie}-{eigendom}-P50P'
    names_list.append(entry_name_BETA)
    names_list.append(entry_name_P50P)
    count+=1

# Making entry names for investering
inputfile_name = 'Scurves_investering.csv'
path_in = os.path.join(scurve_path, inputfile_name)
scurve_investering = pd.read_csv(path_in,  sep=',')

count = 0
for optie in scurve_investering.T:
    niveau = scurve_investering.iloc[count,0]
    gebouwoptiecategorie = scurve_investering.iloc[count,1]
    eigendom = scurve_investering.iloc[count,2]
    entry_name_BETA = f'Investering-{niveau}-{gebouwoptiecategorie}-{eigendom}-BETA'
    entry_name_P50P = f'Investering-{niveau}-{gebouwoptiecategorie}-{eigendom}-P50P'
    names_list.append(entry_name_BETA)
    names_list.append(entry_name_P50P)
    count+=1
    
# Making entry names for isolatie
inputfile_name = 'Scurves_isolatie.csv'
path_in = os.path.join(scurve_path, inputfile_name)
scurve_isolatie = pd.read_csv(path_in,  sep=',')

count = 0
for optie in scurve_isolatie.T:
    iso_niveau = scurve_isolatie.iloc[count,0]
    eigendom = scurve_isolatie.iloc[count,1]
    entry_name_BETA = f'Isolatie-{iso_niveau}-{eigendom}-BETA'
    entry_name_P50P = f'Isolatie-{iso_niveau}-{eigendom}-P50P'
    names_list.append(entry_name_BETA)
    names_list.append(entry_name_P50P)
    count+=1
    
# Create placehodler input values
parameter_placeholder_inputs = [21, 'GM0050', 0, 0.8, 0.5, 2,
                                0,0,0,1,1,1]
placeholder_inputs = [1] * (len(names_list) -len(parameter_placeholder_inputs))
for input in placeholder_inputs:
    parameter_placeholder_inputs.append(input)

# Write to csv
with open('ScenarioInputs_CPT.csv', 'w', newline='') as f:
    write = csv.writer(f)
    write.writerow(names_list)
    write.writerow(parameter_placeholder_inputs)

