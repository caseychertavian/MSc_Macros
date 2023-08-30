dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/ROI whole/"; 
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		// open(list[i]);
		title = list[i];
		title = title.substring(0,title.length()-4);
		run("Close All");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/ROI whole/"+title+".roi");
setForegroundColor(255, 255, 255);
run("Fill", "slice");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step6.1_create tissue/"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/ROI outer/"+title+"-outer.roi");
run("Fill", "slice");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step6.2_create line/"+title+".tif");
run("Close All");

	}

	
