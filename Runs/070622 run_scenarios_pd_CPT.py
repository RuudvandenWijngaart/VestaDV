# -*- coding: utf-8 -*-

# For this to work the "pause" needs to be deleted from the end of batch_HestiaRun_KalibratieTellingen.bat

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
import shutil                 # To remove the CalcCache
import sys                    # To exit script, log modules
from datetime import datetime # To time how long the runs take

# Setting paths
hestia_path     = r'K:\Hestia' # Set this to your Hestia folder
geodms_version  = '7.407'      # Set this to your GeoDMS version
batchfile_name  = 'batch_HestiaRun_KalibratieTellingen.bat'
PD_path         = os.path.join(hestia_path, 'PD')
SD_path         = os.path.join(hestia_path, 'SD')
LD_path         = os.path.join(hestia_path, 'LD')
runs_path       = os.path.join(PD_path, 'runs')
batchfile_path  = os.path.join(runs_path, batchfile_name)
scurve_path     = os.path.join(PD_path, 'scurve')
results_path    = os.path.join(LD_path, 'PD', 'Results', 'Kalibratie')
calccache_path  = os.path.join(LD_path,'PD','CalcCachex64.v%s'%(geodms_version))
tellingen_name  = 'KalibratieTellingen.csv'
tellingen_path  = os.path.join(results_path, tellingen_name)

def format_timedelta(timedelta):
    '''
    From https://stackoverflow.com/questions/538666/format-timedelta-to-string
    '''
    seconds = int(timedelta.total_seconds())
    hours, remainder = divmod(seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    return '{:02}:{:02}:{:02}'.format(int(hours), int(minutes), int(seconds))

def log_modules():
    ''' 
    Adapted from Sido Mylius
    '''
    logging.info("Modules in hestia_env:")
    for module in sys.modules:
        try:
            logging.info(str(module) + str(sys.modules[module].__version__))
        except:
            try:
                if  type(module[module].version) is str:
                    logging.info(str(module) + str(sys.modules[module].version))
                else:
                    logging.info(str(module) + str(sys.modules[module].version()))
            except:
                try:
                    logging.info(str(module) + str(sys.modules[module].VERSION))
                except:
                    pass
    logging.info('\n')
    
def main():
    starttime_script = datetime.now()
    
    # Create dedicated results folder
    date = datetime.now().strftime('%Y_%m_%d-%H_%M_%S')
    resultsfolder_name = date #+ '_GeoDMSv' + geodms_version
    dedicated_resultsfolder_path = os.path.join(results_path, resultsfolder_name)
    os.makedirs(dedicated_resultsfolder_path)
    
    # Create logfile
    # from https://stackoverflow.com/questions/24816456/python-logging-wont-shutdown
    logfile_name = 'KalibratieAutomatisatie.txt'
    logfile_path = os.path.join(dedicated_resultsfolder_path, logfile_name)
    logger = logging.getLogger()
    logger.setLevel(logging.INFO)
    fh = logging.FileHandler(filename=logfile_path)
    fh.setLevel(logging.INFO)
    formatter = logging.Formatter(
                    fmt='%(asctime)s %(levelname)s: %(message)s',
                    datefmt='%Y-%m-%d %H:%M:%S'
                    )
    fh.setFormatter(formatter)
    logger.addHandler(fh)
    
    # Log modules in env
    log_modules()
    
    # Initializing variables
    scenario_num = 0

    # Read in scenario's and associated parameter values
    scenariosfile_name = 'ScenarioInputs_CPT.csv'
    scenarios_path = os.path.join(runs_path, scenariosfile_name)
    scenario_inputdata = pd.read_csv(scenarios_path, dtype=object, sep=',')
    number_of_scenarios = len(scenario_inputdata.index)
    logging.info('Inputdata has been read')
    logging.info(f'{number_of_scenarios} scenario\'s will be ran')

    # Select and group S-curve values
    # From https://datagy.io/pandas-select-columns/
    gebouwoptie_beta = scenario_inputdata.loc[ : , [col for col in scenario_inputdata.columns if ('Gebouwoptie' in col and 'BETA' in col)]]
    gebouwoptie_p50p = scenario_inputdata.loc[ : , [col for col in scenario_inputdata.columns if ('Gebouwoptie' in col and 'P50P' in col)]]
    investering_beta = scenario_inputdata.loc[ : , [col for col in scenario_inputdata.columns if ('Investering' in col and 'BETA' in col)]]
    investering_p50p = scenario_inputdata.loc[ : , [col for col in scenario_inputdata.columns if ('Investering' in col and 'P50P' in col)]]
    isolatie_beta    = scenario_inputdata.loc[ : , [col for col in scenario_inputdata.columns if ('Isolatie'    in col and 'BETA' in col)]]
    isolatie_p50p    = scenario_inputdata.loc[ : , [col for col in scenario_inputdata.columns if ('Isolatie'    in col and 'P50P' in col)]]
    
    # Creating S-curve DataFrames needed to write to CSV's
    gebouwoptieFrame = pd.DataFrame(columns = ['Installatie','Eigendom','BETA','P50P'])
    gebouwoptieFrame['Installatie']         = gebouwoptie_beta.columns.str.split('-').str[1]
    gebouwoptieFrame['Eigendom']            = gebouwoptie_beta.columns.str.split('-').str[2]
    gebouwoptieFrame['BETA']                = gebouwoptie_beta.iloc[scenario_num].tolist()
    gebouwoptieFrame['P50P']                = gebouwoptie_p50p.iloc[scenario_num].tolist()
    
    investeringFrame = pd.DataFrame(columns = ['Isolatieambitie','Gebouwoptie','Eigendom','BETA','P50P'])
    investeringFrame['Isolatieambitie']     = investering_beta.columns.str.split('-').str[1]
    investeringFrame['Gebouwoptie']         = investering_beta.columns.str.split('-').str[2]
    investeringFrame['Eigendom']            = investering_beta.columns.str.split('-').str[3]
    investeringFrame['BETA']                = investering_beta.iloc[scenario_num].tolist()
    investeringFrame['P50P']                = investering_p50p.iloc[scenario_num].tolist()
    
    isolatieFrame = pd.DataFrame(columns    = ['Isolatie','Eigendom','BETA','P50P'])
    isolatieFrame['Isolatie']               = isolatie_beta.columns.str.split('-').str[1]
    isolatieFrame['Eigendom']               = isolatie_beta.columns.str.split('-').str[2]
    isolatieFrame['BETA']                   = isolatie_beta.iloc[scenario_num].tolist()
    isolatieFrame['P50P']                   = isolatie_p50p.iloc[scenario_num].tolist()

    # Loop runs over all scenario's
    while scenario_num < number_of_scenarios:
        
        # Open KalibratieInput.csv and write parameterdata belonging to scenario
        inputfile_name = 'KalibratieInput.csv'
        path_in = os.path.join(runs_path, inputfile_name)
        run_inputdata = scenario_inputdata.iloc[scenario_num]
        parameter_inputs = run_inputdata[:14]
        parameter_inputs =  pd.DataFrame(parameter_inputs).T
        parameter_inputs.to_csv(path_in, index = False)
        number_of_years = int(parameter_inputs['nrYears'].loc[parameter_inputs.index[0]])
        
        # Write s-curve parameters
        inputfile_name = 'Scurves_gebouwoptie.csv'
        path_in = os.path.join(scurve_path, inputfile_name)
        gebouwoptie_csvready = gebouwoptieFrame.rename(columns = {'Installatie' : '', 'Eigendom' : ''})
        gebouwoptie_csvready.to_csv(path_in, index = False)
        
        inputfile_name = 'Scurves_investering.csv'
        path_in = os.path.join(scurve_path, inputfile_name)
        investering_csvready = investeringFrame.rename(columns = {'Isolatieambitie' : '', 'Gebouwoptie' : '', 'Eigendom' : ''})
        investering_csvready.to_csv(path_in, index = False)
        
        inputfile_name = 'Scurves_isolatie.csv'
        path_in = os.path.join(scurve_path, inputfile_name)
        isolatie_csvready = isolatieFrame.rename(columns = {'Isolatie' : '', 'Eigendom' : ''})
        isolatie_csvready.to_csv(path_in, index = False)
        
        # Execute the bash file to start run
        # From https://stackoverflow.com/questions/70189890/running-batch-file-with-subprocess-call-does-not-work-and-freezes-ipython-consol
        starttime_run = datetime.now()
        logging.info('Start run %s.'%(scenario_num+1))
        hestia_run = subprocess.Popen([batchfile_path], creationflags=subprocess.CREATE_NEW_CONSOLE)
        hestia_run.wait(timeout=None)
        runtime = datetime.now() - starttime_run
        logging.info('Run %s is finished and took %s to complete.'%(scenario_num+1, str(format_timedelta(runtime))))
        
        # Add scenario_ID to output
        kalibratietellingendf = pd.read_csv(tellingen_path,  sep=';')
        kalibratietellingendf.columns = kalibratietellingendf.columns.str.strip("'")
        kalibratietellingendf['Scenario_ID'] = scenario_num +1

        # Move scenario_ID to front of dataframe 
        # From https://stackoverflow.com/questions/25122099/move-column-by-name-to-front-of-table-in-pandas
        cols = list(kalibratietellingendf)
        cols.insert(0, cols.pop(cols.index('Scenario_ID')))
        kalibratietellingendf = kalibratietellingendf.loc[:, cols]
        
        # Add inputdata to output
        kalibratietellingendf.reset_index(drop=True, inplace=True)
        run_inputdataT = pd.concat([pd.DataFrame(run_inputdata).T]*number_of_years, ignore_index=True)
        run_inputdataT.reset_index(drop=True, inplace=True)
        outputdf = pd.concat([kalibratietellingendf, run_inputdataT], axis=1)
        outputdf.to_csv(tellingen_path, index = False)
    
        # Rename results of run and move to dedicated results folder
        os.rename(tellingen_path,os.path.join(dedicated_resultsfolder_path,'Scenario%s.csv'%(scenario_num+1)))
        logging.info('Scenario%s.csv has been saved.'%(scenario_num+1))
        
        # Delete the CalcCache
        shutil.rmtree(calccache_path) 
        
        # Increase scenario count
        scenario_num += 1
    
    # Move hestia logfile to dedicated results folder
    os.rename(os.path.join(LD_path, 'log', 'HestiaRun.txt'),os.path.join(dedicated_resultsfolder_path,'HestiaRun_log.txt'))
    logging.info('HestiaRun logfile has been moved to the results folder.')
    
    # Move scenario inputs to dedicated results folder
    shutil.copy(scenarios_path,os.path.join(dedicated_resultsfolder_path,scenariosfile_name))
    logging.info('Scenario inputs have been moved to the results folder.')
    
    # Final operations
    runtime_script = datetime.now() - starttime_script
    logging.info('Script finished. Total runtime: %s \n'%(str(format_timedelta(runtime_script))))
    logger.removeHandler(fh)

if __name__ == "__main__":
	main()









