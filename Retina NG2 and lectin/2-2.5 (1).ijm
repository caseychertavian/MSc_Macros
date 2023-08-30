dir = "H:/230500 Nimo round2_histology_retina/NG2/_Step2.2_subtract background images/";
list = getFileList(dir);
for(i=0;i<list.length;i++){
	title = list[i];
	title = title.substring(7,title.length()-4);


open("H:/230500 Nimo round2_histology_retina/NG2/_Step2.2_subtract background images/sub_C3-"+title+".tif");
run("Apply LUT");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step2.5_enhance/NG2-"+title+".tif");
run("Close All");
}