dir = "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step2.5_enhance/";
list = getFileList(dir);
for(i=0;i<list.length;i++){
	title = list[i];
	title = title.substring(4,title.length()-4);
open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step2.5_crop/NG2-"+title+".tif");
setThreshold(117, 255);
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-(117, 255).tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-(117, 255).tif");
run("Analyze Particles...", "size=0-3 pixel clear overlay add");
if(nResults>0){
run("Create Mask");
imageCalculator("Subtract create", "NG2-"+title+"-(117, 255).tif","Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-(117, 255).tif");
} run("Close All");


open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step2.5_enhance/NG2-"+title+".tif");
setAutoThreshold("RenyiEntropy dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-Renyi-crop.tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-Renyi-crop.tif");
open("H:/230500 Nimo round2_histology_retina/NG2/ROI_Zip/"+title+"-ROI.zip");
roiManager("Select", 2);
setBackgroundColor(0, 0, 0);
run("Clear Outside");
roiManager("Select", 0);roiManager("Delete");
roiManager("Select", 0);roiManager("Delete");
roiManager("Select", 0);roiManager("Delete");
run("Select None");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-Renyi-crop.tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-Renyi-crop.tif");
run("Analyze Particles...", "size=0-3 pixel clear overlay add");
if(nResults>0){
run("Create Mask");
imageCalculator("Subtract create", "NG2-"+title+"-Renyi-crop.tif","Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-Renyi-crop.tif");
roiManager("Delete");
} run("Close All");


open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step2.5_crop/NG2-"+title+".tif");
setAutoThreshold("RenyiEntropy dark");
setOption("BlackBackground", true);
run("Convert to Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-crop-Renyi.tif");
run("Close All");

open("H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-crop-Renyi.tif");
run("Analyze Particles...", "size=0-3 pixel clear overlay add");
if(nResults>0){
run("Create Mask");
imageCalculator("Subtract create", "NG2-"+title+"-crop-Renyi.tif","Mask");
saveAs("Tiff", "H:/230500 Nimo round2_histology_retina/NG210X_enhance/_Step3_/NG2-"+title+"-crop-Renyi.tif");
roiManager("Delete");
} run("Close All");
}