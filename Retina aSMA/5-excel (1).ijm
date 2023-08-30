run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step3_thres_crop/Lectin/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/tissue/"+title+".tif");
run("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/excel/tissue area/"+title+".csv");
run("Clear Results");
run("Close All");


open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step5_thres_crop_OR_shape/"+title+".tif");
run("Analyze Particles...", "size=0-10000000 clear overlay add");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step4_thres_crop_OR/"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/excel/OR/"+title+".csv");
run("Clear Results");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step3_thres_crop/Lectin/lectin-"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/excel/Lectin/"+title+".csv");
run("Clear Results");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step3_thres_crop/aSMCA/aSMCA-"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/excel/aSMCA/"+title+".csv");
run("Clear Results");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step4_thres_crop_AND/"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/excel/AND/"+title+".csv");
run("Clear Results");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step6_diameter/"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/excel/diameter/"+title+".csv");
run("Clear Results");

roiManager("Delete");
run("Close All");

	}