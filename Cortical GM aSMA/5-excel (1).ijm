run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_merge/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/tissue/"+title+".tif");
run("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/excel/tissue area/"+title+".csv");
run("Clear Results");
run("Close All");


open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step5_thres_OR_shape/"+title+".tif");
run("Analyze Particles...", "size=0-10000000 clear overlay add");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_OR/"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/excel/OR/"+title+".csv");
run("Clear Results");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/Lectin/lectin-"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/excel/Lectin/"+title+".csv");
run("Clear Results");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/aSMCA/aSMCA-"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/excel/aSMCA/"+title+".csv");
run("Clear Results");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_AND/"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/excel/AND/"+title+".csv");
run("Clear Results");
roiManager("Delete");
run("Close All");

	}