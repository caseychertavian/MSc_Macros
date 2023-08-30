dir_processing = "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/DAPI/"; 
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		// open(list[i]);
		title = list[i];
		title = title.substring(5,title.length()-4);
		run("Close All");
		
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/IBA1/blur/IBA1-"+title+".tif");
run("Analyze Particles...", "size=0-10000000 pixel clear add"); // get roi
if(nResults > 0){
roiManager("Save", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_roi/blur/"+title+".zip");
run("Close All");
roiManager("Delete");

roiManager("Open", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_roi/blur/"+title+".zip");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/IBA1/select/IBA1-"+title+".tif");
roiManager("Measure"); // IBA
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_IBA1/blur/"+title+".csv");
run("Clear Results");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/DAPI/DAPI-"+title+".tif");
roiManager("Measure"); // has DAPI?
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_DAPI/blur/"+title+".csv");
run("Clear Results");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/is sup/"+title+".tif");
roiManager("Measure"); // is surface?
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_is sup/blur/"+title+".csv");
run("Clear Results");
roiManager("Delete");
run("Close All");
}
else{print(title,"/blur/: no IBA1");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/allzero.tif");
run("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_IBA1/blur/"+title+".csv");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_DAPI/blur/"+title+".csv");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_is sup/blur/"+title+".csv");
run("Clear Results");
run("Close All");}


open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/IBA1/select/IBA1-"+title+".tif");
run("Analyze Particles...", "size=0-10000000 pixel clear add");
if(nResults > 0){
roiManager("Save", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_roi/select/"+title+".zip");
run("Close All");
roiManager("Delete");

roiManager("Open", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_roi/select/"+title+".zip");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/IBA1/select/IBA1-"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_IBA1/select/"+title+".csv");
run("Clear Results");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/DAPI/DAPI-"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_DAPI/select/"+title+".csv");
run("Clear Results");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/_Step5_select/is sup/"+title+".tif");
roiManager("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_is sup/select/"+title+".csv");
run("Clear Results");
roiManager("Delete");
run("Close All");
}
else{print(title,"/select/: no IBA1");
open("H:/230500 Nimo round2_histology_retina/IBA1_fluo/allzero.tif");
run("Measure");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_IBA1/select/"+title+".csv");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_DAPI/select/"+title+".csv");
saveAs("Results", "H:/230500 Nimo round2_histology_retina/IBA1_fluo/_excel_is sup/select/"+title+".csv");
run("Clear Results");
run("Close All");}


	}

	
