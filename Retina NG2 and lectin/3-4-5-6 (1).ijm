dir = "H:/230500 Nimo round2_histology_retina/NG210X_enhance/Lectin/";
list = getFileList(dir);
for(i=0;i<list.length;i++){
	title = list[i];
	title = title.substring(7,title.length()-4);
open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/Lectin/lectin-"+title+".tif");
open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-Renyi-crop.tif");
imageCalculator("AND create", "NG2-"+title+"-Renyi-crop.tif","lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step4_AND/"+title+"-Renyi-crop.tif");
imageCalculator("OR create", "NG2-"+title+"-Renyi-crop.tif","lectin-"+title+".tif");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step4_OR/"+title+"-Renyi-crop.tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step4_OR/"+title+"-Renyi-crop.tif");
run("Analyze Particles...", "size=0-5 pixel clear overlay add");
if(nResults>0){
run("Create Mask");
imageCalculator("Subtract create", title+"-Renyi-crop.tif","Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step4_OR/"+title+"-Renyi-crop.tif");
}run("Close All");

open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step4_OR/"+title+"-Renyi-crop.tif");
run("Shape Index Map", "gaussian_blur_radius=3");
setThreshold(0.001, 1e30);
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step5_OR_shape/"+title+"-Renyi-crop.tif");
run("Skeletonize");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step6_skel/"+title+"-Renyi-crop.tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step4_OR/"+title+"-Renyi-crop.tif");
run("Fill Holes");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step4_OR_fillhole/"+title+"-Renyi-crop.tif");
run("Close All");
}