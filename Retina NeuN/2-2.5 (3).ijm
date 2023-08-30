dir_processing = "E:/230500 Nimo round2_histology_retina/NeuN/NeuN_ROI";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);

open("E:/230500 Nimo round2_histology_retina/NeuN/_Step2_sub/NeuN/NeuN-"+title+".tif");
open("E:/230500 Nimo round2_histology_retina/NeuN/_Step6_creat line/"+title+".tif");
imageCalculator("AND create", "NeuN-"+title+".tif",""+title+".tif");
saveAs("Tiff", "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step2.5_enhance/NeuN/NeuN-"+title+".tif");
run("Close All");
	}

dir_processing = "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step2.5_enhance/NeuN/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);

open("E:/230500 Nimo round2_histology_retina/NeuN_new/_Step2.5_enhance/NeuN/"+title+".tif");
resetMinAndMax();
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
saveAs("Tiff", "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step2.5_enhance/NeuN/"+title+".tif");
run("Close All");
	}