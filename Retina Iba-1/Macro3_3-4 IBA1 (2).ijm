dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step3_crop/IBA1/"; 
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		// open(list[i]);
		title = list[i];
		title = title.substring(0,title.length()-4);
		// run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step3_crop/IBA1/"+title+".tif");
setAutoThreshold("Moments dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/IBA1/"+title+".tif");
run("Close All");


	}
	
