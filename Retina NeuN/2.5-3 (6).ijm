dir_processing = "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step2.5_enhance/NeuN/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);
open("E:/230500 Nimo round2_histology_retina/NeuN_new/_Step2.5_enhance/NeuN/"+title+".tif");
setAutoThreshold("Shanbhag dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step3_c_e_t/NeuN/"+title+"-sha.tif");
run("Close All");

open("E:/230500 Nimo round2_histology_retina/NeuN_new/_Step2.5_enhance/NeuN/"+title+".tif");
setAutoThreshold("Minimum dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step3_c_e_t/NeuN/"+title+"-min.tif");
run("Close All");
	}

dir_processing = "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step3_c_e_t/NeuN/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);
open("E:/230500 Nimo round2_histology_retina/NeuN_new/_Step3_c_e_t/NeuN/"+title+".tif");
run("Analyze Particles...", "size=0-9 pixel clear include overlay add");
if(nResults>0){ 
run("Create Mask");
imageCalculator("Subtract create", ""+title+".tif","Mask");
saveAs("Tiff", "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step3_c_e_t/NeuN/"+title+".tif");
roiManager("Delete");
} run("Close All");
	}