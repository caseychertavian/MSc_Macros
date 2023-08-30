dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/ROI outer/"; 
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		// open(list[i]);
		title = list[i];
		title = title.substring(0,title.length()-10);
		run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/allzero.tif");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/ROI outer/"+title+"-outer.roi");
run("Fill", "slice");
run("Select None");
run("Gaussian Blur...", "sigma=10");
setThreshold(2, 255);
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/is sup/"+title+".tif");
run("Close All");

	}

	
