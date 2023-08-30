dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/DAPI/"; 
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		// open(list[i]);
		title = list[i];
		title = title.substring(5,title.length()-4);
		run("Close All");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step6.1_create tissue/"+title+".tif");
run("Measure");  // tissue area
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_tissue area/"+title+".csv");
run("Close All");
run("Clear Results");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step6.2_create line/"+title+".tif");
run("Measure");  // length
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_length/"+title+".csv");
run("Clear Results");
run("Close All");


	}

	
