dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step1_raw/"; 
// the IBA1 fluo !!!!!!!! raw LSM images folder
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		open(list[i]);
		title = getTitle();
		title = title.substring(0,title.length()-4);
		run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step1_raw/"+title+".lsm");
run("Split Channels");
selectWindow("C4-"+title+".lsm");
run("Subtract Background...", "rolling=10");
run("Enhance Contrast", "saturated=0.35");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step2_sub/IBA1/IBA1-"+title+".tif");

selectWindow("C3-"+title+".lsm");
run("Subtract Background...", "rolling=10");
run("Enhance Contrast", "saturated=0.35");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step2_sub/DAPI/DAPI-"+title+".tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step2_sub/IBA1/IBA1-"+title+".tif");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step2_sub/DAPI/DAPI-"+title+".tif");
run("Merge Channels...", "c1=IBA1-"+title+".tif c2=DAPI-"+title+".tif create");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step2_sub/merge/"+title+".tif");
run("Close All");

	}
	
