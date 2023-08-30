dir_processing = "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step2.5_enhance/DAPI";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(5,title.length()-4);

thresP = newArray("-min","-sha");

for(k=0;k<thresP.length;k++){

titleP = thresP[k];

open("E:/230500 Nimo round2_histology_retina/NeuN_new/_Step4_/NeuN/NeuN-"+title+""+titleP+".tif");
run("Analyze Particles...", "size=0-1000000 pixel clear add");
roiManager("Measure");
saveAs("Results", "E:/230500 Nimo round2_histology_retina/NeuN_new/excel/-b"+titleP+"/NeuN/"+title+".csv");
run("Clear Results");

open("E:/230500 Nimo round2_histology_retina/NeuN_new/_Step4_/DAPI/DAPI-"+title+".tif");
roiManager("Measure");
saveAs("Results", "E:/230500 Nimo round2_histology_retina/NeuN_new/excel/-b"+titleP+"/DAPI/"+title+".csv");
run("Clear Results");
roiManager("Delete");
run("Close All");
						
	}}
	
