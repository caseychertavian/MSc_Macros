run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/Lectin10X_enhance/_Step3_thres_crop/(19, 255)";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);


open("H:/230500 Nimo round2_histology_brain/Lectin10X_enhance/_Step3_thres_crop/(19, 255)/lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step3_thres_crop/Lectin/lectin-"+title+".tif");
run("Close All");
open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/aSMCA/aSMCA-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step3_thres_crop/aSMCA/aSMCA-"+title+".tif");
run("Close All");
	}
