dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/IBA1/"; 
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		//open(list[i]);
		title = list[i];
		title = title.substring(0,title.length()-4);
		//run("Close All");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/IBA1/"+title+".tif");
run("Analyze Particles...", "size=0-100 pixel clear overlay add");
run("Create Mask");
imageCalculator("Subtract create", ""+title+".tif","Mask");
selectWindow("Result of "+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/IBA1/select/"+title+".tif");
run("Close All");
roiManager("Delete");

open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step4_thres/IBA1/"+title+".tif");
run("Gaussian Blur...", "sigma=1.9");
setAutoThreshold("Default dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/IBA1/blur/"+title+".tif");
run("Close All");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/IBA1/blur/"+title+".tif");
run("Analyze Particles...", "size=0-100 pixel clear overlay add");
run("Create Mask");
imageCalculator("Subtract create", ""+title+".tif","Mask");
selectWindow("Result of "+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/IBA1/blur/"+title+".tif");
run("Close All");
roiManager("Delete");

	}
	
