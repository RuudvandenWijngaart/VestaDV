import os
import sys


#inputdir = r"Y:\data\Vesta\v2\automatisering\automatisering_juni2016_python\test\Run4Combi_2016_Referentie"
#outfile = r"Y:\data\Vesta\v2\automatisering\automatisering_juni2016_python\test\eindresultaat_mut.csv"
#methodlist = "mut_lijsT"
if (len(sys.argv) != 4):
    print ("Give first argument the output directory of VESTA.")
    print ("Give second argument the filename of the merged output.")
    print ("Give third argument the name of the module that contains the sortlist information.")
    sys.exit(1)
inputdir = sys.argv[1]
outfile = sys.argv[2]
methodlist = sys.argv[3]

# The import of one of these modules contains the sortlist with filenames.
if (methodlist == "mut_lijst"):
    from mut_lijst import *
elif (methodlist == "mut_allstock_lijst"):
    from mut_allstock_lijst import *
elif (methodlist == "matrix_allflow"):
    from matrix_allflow import *
elif (methodlist == "matrix_allstock"):
    from matrix_allflow import *
elif (methodlist == "NL"):
    from NL import *
elif (methodlist == "NL_emission"):
    from NL_emission import *
elif (methodlist == "gebiedsmaatregelen"):
    from gebiedsmaatregelen import *
elif (methodlist == "opwekking"):
    from opwekking import *
elif (methodlist == "verbetering"):
    from verbetering import *
elif (methodlist == "mut_bebouwing_allflow"):
    from mut_bebouwing_allflow import *
elif (methodlist == "mut_bebouwing_allstock"):
    from mut_bebouwing_allstock import *
else:
    raise IOError("Import module is not correct.Specify another sortinglist.")

# Get all objects (years) on the outputdirectory
lfound_startyear = False
years = []
filelist = os.listdir(inputdir)
for obj in filelist:
    if (os.path.isdir(os.path.join(inputdir,obj))):
        # Check whether it is the startyear
        if (obj.upper() == "STARTJAAR"):
            lfound_startyear = True
        # Check whether it is a year of the form J<year>
        elif (obj[0:1].upper() == "J"):
            try:
                year = int(str(obj)[1:])
                # Yes this obj we want.
                years.append(year)
            except ValueError:
                # No year, so directory is skipped.
                print(obj + " is not a year. Directory is skipped")

# Check whether startyear is available.
if (not lfound_startyear):
    raise IOError("Directory startjaar is not found.")

# Sort years.
years.sort()

# Make the directory list of output years.
dirlist=["StartJaar"]
for year in years:
    dirlist.append("J"+str(year))

# Sort the filenames
sortlist.sort()

fp_out = open(outfile,"w")
for obj in dirlist:
    for item in range(len(sortlist)):
        filename = os.path.join(inputdir,os.path.join(str(obj),sortlist[item][1]))
        lexist = True
        if (not os.path.isfile(filename)):
            if (sortlist[item][2]):
                raise IOError("File: " + filename + " does not exist")
            else:
                print ("File "+ filename + " is missing.")
            lexist = False
            lines = []
        else:
            fp = open(filename,"r")
            lines = fp.readlines()
            fp.close()
        fp_out.write(filename + "\n")
        if (len(lines) > sortlist[item][3]):
            print ("Length of file: " + sortlist[item][1] + " is too short.")
            print ("Length of file: " + sortlist[item][1] + " must be: ", len(lines))
            raise IOError()
        for line in lines:
            fp_out.write(line)
        for item in range(len(lines),sortlist[item][3]):
            fp_out.write("\n")
fp_out.close()