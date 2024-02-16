//Conversion of RGB image to grey by SANGESH S
//this code is a implementation of the paper https://www.sciencedirect.com/science/article/pii/S187705092031200X
module RGB2grey; //module name

parameter m = 360;    //number of rows of image 
parameter n = 480;    //number of columns of image

reg [7:0] hexfile[((m*n*3)-1):0];    //declaring hexadecimal file to store input image
reg [7:0] grayfile[(m*n)-1:0];     //declaring converted gray file - hexdecimal
reg [7:0] red[(m*n)-1:0];          //red color values
reg [7:0] blue[(m*n)-1:0];         //blue color values
reg [7:0] green[(m*n)-1:0];        //green color values

reg [7:0] red1[(m*n)-1:0];          //red color values
reg [7:0] red2[(m*n)-1:0];          //red color values
reg [7:0] blue1[(m*n)-1:0];         //blue color values
reg [7:0] blue2[(m*n)-1:0];         //blue color values
reg [7:0] green1[(m*n)-1:0];        //green color values
reg [7:0] green2[(m*n)-1:0];        //green color values
integer file;
integer i, j, k=0;

initial begin 
	$readmemh("imagevalue.hex", hexfile);        //reading hexadecimal file of image into memory hexfile
end
initial begin
	for(i=0; i<m*n; i=i+1)begin
			
		red[i] = hexfile[k];           
		green[i] = hexfile[k+1];
		blue[i] = hexfile[k+2];
		red1[i] = red[i]>>2;
		red2[i] = red[i]>>5;
		green1[i] = green[i]>>1;
		green2[i] = green[i]>>4;
		blue1[i] = blue[i]>>4;
		blue2[i] = blue[i]>>5;
		grayfile[i] = red1[i] + red2[i] + green1[i] + green2[i] + blue1[i] + blue2[i];       //adding all the values to obtain grayscale value
		k = k + 3;
		
	end	
end
initial begin	
	file = $fopen("grayimagevalue.hex", "w");          //creating a hex file to store grayscale values of converted image
	for(j=0; j<m*n; j=j+1)begin
		$fwrite(file, "%x\n", grayfile[j]);     //writing values into file
	end
	$fclose(file);       //closing file
end
endmodule 
