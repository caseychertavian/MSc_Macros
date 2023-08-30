run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/Lectin/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);

open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_AND/"+title+"-c-137.tif");
run("Shape Index Map", "gaussian_blur_radius=3");
setThreshold(0.001, 1e30);
setOption("BlackBackground", true);
run("Convert to Mask");
run("Outline");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/outline.tif");
run("Close All");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step2.5_enhance/PDGFRb-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/Lectin10X_enhance/_Step2.5_enhance/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/outline.tif");
run("Merge Channels...", "c1=PDGFRb-"+title+".tif c2=lectin-"+title+".tif c3=outline.tif create");
saveAs("Jpeg", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_check/"+title+"-c-137.jpg");
run("Close All");


open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_AND/"+title+"-c-ren.tif");
run("Shape Index Map", "gaussian_blur_radius=3");
setThreshold(0.001, 1e30);
setOption("BlackBackground", true);
run("Convert to Mask");
run("Outline");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/outline.tif");
run("Close All");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step2.5_enhance/PDGFRb-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/Lectin10X_enhance/_Step2.5_enhance/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/outline.tif");
run("Merge Channels...", "c1=PDGFRb-"+title+".tif c2=lectin-"+title+".tif c3=outline.tif create");
saveAs("Jpeg", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_check/"+title+"-c-ren.jpg");
run("Close All");


open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step4_AND/"+title+"-c-yen.tif");
run("Shape Index Map", "gaussian_blur_radius=3");
setThreshold(0.001, 1e30);
setOption("BlackBackground", true);
run("Convert to Mask");
run("Outline");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/outline.tif");
run("Close All");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step2.5_enhance/PDGFRb-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/Lectin10X_enhance/_Step2.5_enhance/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/outline.tif");
run("Merge Channels...", "c1=PDGFRb-"+title+".tif c2=lectin-"+title+".tif c3=outline.tif create");
saveAs("Jpeg", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_check/"+title+"-c-yen.jpg");
run("Close All");
	}