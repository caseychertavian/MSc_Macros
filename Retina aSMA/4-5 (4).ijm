run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step3_thres_crop/Lectin/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(7,title.length()-4);
open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step4_thres_crop_OR/"+title+".tif");
run("Shape Index Map", "gaussian_blur_radius=3");
setThreshold(0.001, 1e30);
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step5_thres_crop_OR_shape/"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step5_thres_crop_OR_shape/"+title+".tif");
makeRectangle(2, 2, 510, 510);
open("H:/230500 Nimo round2_histology_brain/frame for shape.roi");
setBackgroundColor(0, 0, 0);
run("Clear Outside");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step5_thres_crop_OR_shape/"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step5_thres_crop_OR_shape/"+title+".tif");
run("Fill Holes");
setOption("BlackBackground", true);
run("Skeletonize");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/LectinaSMCA10X_enhance/_Step6_diameter/"+title+".tif");
run("Close All");
	}