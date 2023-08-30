run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);

open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/allone.tif");
if(File.exists("H:/230500 Nimo round2_histology_brain/Lectin/ROI_Lectin/C1-"+title+".roi")){
open("H:/230500 Nimo round2_histology_brain/Lectin/ROI_Lectin/C1-"+title+".roi");
setBackgroundColor(0, 0, 0);
run("Clear", "slice");
run("Select None");
} saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/tissue/"+title+".tif");
run("Close All");


open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/tissue/"+title+".tif");
run("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/excel/tissue area/"+title+".csv");
run("Clear Results");
run("Close All");

	}

