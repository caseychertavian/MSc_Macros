run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/Lectin10X_enhance/_Step3_thres_crop/RenyiEntropy/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);
open("H:/230500 Nimo round2_histology_brain/Lectin10X_enhance/_Step3_thres_crop/RenyiEntropy/"+title+".tif");  // DEFINE YOUR LECTIN
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/"+title+".tif");
run("Close All");
	}
	
run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);

open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/PDGFRb-"+title+"-c-yen.tif");
imageCalculator("OR create", "PDGFRb-"+title+"-c-yen.tif","lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR/"+title+"-c-yen.tif");
imageCalculator("AND create", "PDGFRb-"+title+"-c-yen.tif","lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_AND/"+title+"-c-yen.tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/PDGFRb-"+title+"-c-137.tif");
imageCalculator("OR create", "PDGFRb-"+title+"-c-137.tif","lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR/"+title+"-c-137.tif");
imageCalculator("AND create", "PDGFRb-"+title+"-c-137.tif","lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_AND/"+title+"-c-137.tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step3_/PDGFRb-"+title+"-c-ren.tif");
imageCalculator("OR create", "PDGFRb-"+title+"-c-ren.tif","lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR/"+title+"-c-ren.tif");
imageCalculator("AND create", "PDGFRb-"+title+"-c-ren.tif","lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_AND/"+title+"-c-ren.tif");
run("Close All");
	}

run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);

open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR/"+title+"-c-ren.tif");
run("Analyze Particles...", "size=0-5 pixel clear overlay add");
if(nResults>0){
run("Create Mask");
imageCalculator("Subtract create", ""+title+"-c-ren.tif","Mask");
roiManager("Delete");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR/"+title+"-c-ren.tif");
} run("Close All");


open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR/"+title+"-c-ren.tif");
run("Fill Holes");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_OR_fillholes/"+title+"-c-ren.tif");
run("Shape Index Map", "gaussian_blur_radius=3");
setThreshold(0.001, 1e30);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step5_OR_shape/"+title+"-c-ren.tif");
run("Skeletonize");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step6_skel/"+title+"-c-ren.tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step5_OR_shape/"+title+"-c-ren.tif");
open("H:/230500 Nimo round2_histology_brain/frame for shape.roi");
setBackgroundColor(0, 0, 0);
run("Clear Outside");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step5_OR_shape/"+title+"-c-ren.tif");
run("Close All");
	}