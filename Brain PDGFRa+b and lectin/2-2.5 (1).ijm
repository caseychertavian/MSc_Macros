run("Close All");
dir_processing = "H:/230500 Nimo round2_histology_brain/PDGFRb/_Step2_x_final sub/";
list = getFileList(dir_processing);
for(i = 0; i < list.length; i++) 
	{
		title = list[i];
		title = title.substring(0,title.length()-4);


open("H:/230500 Nimo round2_histology_brain/PDGFRb/_Step2_x_final sub/"+title+".tif");
resetMinAndMax();
run("Enhance Contrast", "saturated=0.35");
run("Apply LUT");
saveAs("Tiff", "H:/230500 Nimo round2_histology_brain/PDGFRb10X_enhance2/_Step2.5_enhance/"+title+".tif");
run("Close All");
	}
	