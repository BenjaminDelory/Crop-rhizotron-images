macro "Crop Rhizotron Images"{

dir1 = getDirectory("Directory containing rhizotron images to crop ");
dir2 = getDirectory("Destination directory for cropped images ");
list = getFileList(dir1);

setBatchMode(true); 

//Open dialog box
Dialog.create("Area to crop"); 
	Dialog.addNumber("x", 0);
	Dialog.addNumber("y", 0);
	Dialog.addNumber("width", 0);
	Dialog.addNumber("height", 0);
	Dialog.show;

//Get parameters
x = Dialog.getNumber();
y = Dialog.getNumber();
width = Dialog.getNumber();
height = Dialog.getNumber();

for (k=0; k<list.length; k++){
	
	path = dir1+list[k];
	showProgress(k, list.length);
	s=list[k];
	NameLength=lengthOf(s)-4;
	FName=substring(s,0,NameLength);
	extension=substring(s,NameLength+1,lengthOf(s));

	if(extension=="JPG"){
		open(path);
		h=getHeight();
		w=getWidth();
		if (h<w){run("Rotate 90 Degrees Right");}
		makeRectangle(x, y, width, height);
		run("Crop");
		run("Input/Output...", "jpeg="+95);
		saveAs("Jpeg", dir2+FName+".jpg");
		close();}}
}