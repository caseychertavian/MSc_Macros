dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/ROI whole/"; 
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		// open(list[i]);
		title = list[i];
		title = title.substring(0,title.length()-4);
		// run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step2_sub/DAPI/DAPI-"+title+".tif");
setAutoThreshold("Triangle dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/DAPI/DAPI-"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/DAPI/DAPI-"+title+".tif");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/ROI whole/"+title+".roi");
setBackgroundColor(0, 0, 0);
run("Clear Outside");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/DAPI/DAPI-"+title+".tif");
run("Close All");


	}
	
