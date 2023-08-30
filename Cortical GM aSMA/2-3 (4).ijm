run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/Lectin/_Step2_sub/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);


open("H:/230500 Nimo round2_histology_brain/aSMCA/_Step2_x_final sub/aSMCA-"+title+".tif");
run("Red");
run("Enhance Contrast", "saturated=0.35");
open("H:/230500 Nimo round2_histology_brain/Lectin/_Step2_sub/lectin-"+title+".tif");
run("Merge Channels...", "c1=aSMCA-"+title+".tif c2=lectin-"+title+".tif create");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_merge/"+title+".tif");
run("Close All");
						
open("H:/230500 Nimo round2_histology_brain/aSMCA/_Step2_x_final sub/aSMCA-"+title+".tif");
setAutoThreshold("Triangle dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/aSMCA/aSMCA-"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/Lectin/_Step2_sub/lectin-"+title+".tif");
setAutoThreshold("Otsu dark");
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/Lectin/lectin-"+title+".tif");
run("Close All");
open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/Lectin/lectin-"+title+".tif");
run("Analyze Particles...", "size=0-5 pixel clear overlay add");
run("Create Mask");
imageCalculator("Subtract create", "lectin-"+title+".tif","Mask");
selectWindow("Result of lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/Lectin/lectin-"+title+".tif");
run("Close All");
roiManager("Delete");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/allone.tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/tissue/"+title+".tif");
run("Close All");

if(File.exists("H:/230500 Nimo round2_histology_brain/aSMCA/ROI_aSMCA/C2-"+title+".roi")){
open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/Lectin/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/aSMCA/ROI_aSMCA/C2-"+title+".roi");
setBackgroundColor(0, 0, 0);
run("Clear", "slice");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/Lectin/lectin-"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/aSMCA/aSMCA-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/aSMCA/ROI_aSMCA/C2-"+title+".roi");
setBackgroundColor(0, 0, 0);
run("Clear", "slice");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/aSMCA/aSMCA-"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/tissue/"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/aSMCA/ROI_aSMCA/C2-"+title+".roi");
setBackgroundColor(0, 0, 0);
run("Clear", "slice");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/tissue/"+title+".tif");
run("Close All");

}
	}
