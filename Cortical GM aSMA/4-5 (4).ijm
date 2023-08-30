run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_merge/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);
open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step4_thres_OR/"+title+".tif");
run("Shape Index Map", "gaussian_blur_radius=3");
setThreshold(0.001, 1e30);
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X aSMCATri/_Step5_thres_OR_shape/"+title+".tif");
run("Close All");
	}