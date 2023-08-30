dir_processing = "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step3_c_e_t/NeuN/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);
open("E:/230500 Nimo round2_histology_retina/NeuN_new/_Step3_c_e_t/NeuN/"+title+".tif");
run("Watershed");
saveAs("Tiff", "E:/230500 Nimo round2_histology_retina/NeuN_new/_Step4_/NeuN/"+title+".tif");
run("Close All");
	}