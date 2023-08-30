run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step2.5_enhance/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step2.5_enhance/"+title+".tif");
setAutoThreshold("RenyiEntropy dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/"+title+"-c-ren.tif");
run("Close All");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step2.5_enhance/"+title+".tif");
setAutoThreshold("Yen dark");
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/"+title+"-c-yen.tif");
run("Close All");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step2.5_enhance/"+title+".tif");
setThreshold(137, 255);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/"+title+"-c-137.tif");
run("Close All");
	}
	
run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/"+title+".tif");
run("Analyze Particles...", "size=0-3 pixel clear overlay add");
if(nResults>0){
run("Create Mask");
imageCalculator("Subtract create", title+".tif","Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/"+title+".tif");
roiManager("Delete");
} run("Close All");
	}
	