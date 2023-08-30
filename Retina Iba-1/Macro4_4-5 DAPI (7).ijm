dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/DAPI/"; 
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		// title = title.substring(0,title.length()-4);
		// run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/DAPI/"+list[i]);
title = getTitle();

run("Analyze Particles...", "size=0-50 pixel clear overlay add");
run("Create Mask");
imageCalculator("Subtract create", title,"Mask");
selectWindow("Result of "+title);
// run("Watershed");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/DAPI/"+title);
run("Close All");
roiManager("Delete");

	}
	
