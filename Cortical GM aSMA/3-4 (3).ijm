run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_merge/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/Lectin/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step3_thres/aSMCA/aSMCA-"+title+".tif");
imageCalculator("OR create", "lectin-"+title+".tif","aSMCA-"+title+".tif");
selectWindow("Result of lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_OR/"+title+".tif");

imageCalculator("AND create", "lectin-"+title+".tif","aSMCA-"+title+".tif");
selectWindow("Result of lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_AND/"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_OR/"+title+".tif");
run("Analyze Particles...", "size=0-5 pixel clear overlay add");
if(nResults>0){
run("Create Mask");
imageCalculator("Subtract create", ""+title+".tif","Mask");
selectWindow("Result of "+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_OR/"+title+".tif");
roiManager("Delete");
}
run("Close All");

if(File.exists("H:/230500 Nimo round2_histology_brain/aSMCA/ROI_aSMCA/C2-"+title+".roi")){
open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_OR/"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/aSMCA/ROI_aSMCA/C2-"+title+".roi");
setBackgroundColor(0, 0, 0);
run("Clear", "slice");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_OR/"+title+".tif");
run("Close All");
}
	}
	

