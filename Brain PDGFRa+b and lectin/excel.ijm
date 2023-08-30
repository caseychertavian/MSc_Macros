run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);


open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step5_OR_shape/"+title+"-c-ren.tif");
run("Analyze Particles...", "size=0-99999999 clear add");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR/"+title+"-c-ren.tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/excel/-c-ren/OR/"+title+".csv");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR_fillholes/"+title+"-c-ren.tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/excel/-c-ren/fillholes/"+title+".csv");
run("Clear Results");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/lectin-"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/excel/-c-ren/Lectin/"+title+".csv");
run("Clear Results");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_AND/"+title+"-c-ren.tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/excel/-c-ren/AND/"+title+".csv");
run("Clear Results");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/PDGFRb-"+title+"-c-ren.tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/excel/-c-ren/PDGFRb/"+title+".csv");
run("Clear Results");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step6_skel/"+title+"-c-ren.tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/excel/-c-ren/skel/"+title+".csv");
run("Clear Results");
roiManager("Delete");
run("Close All");
	}