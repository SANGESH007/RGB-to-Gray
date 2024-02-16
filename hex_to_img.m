%CONVERTING GRAYSCALE IMAGE HEX FILE INTO AN IMAGE TO BE VIEWED

grayhex = fopen('grayimagevalue.hex', 'r'); %opening converted grayscale image hexfile
imshow('sample1.bmp');                %original image
grayimg = fscanf(grayhex, '%2x');    %reading values from converted file
fclose(grayhex);                     %closing file

sizehex = fopen('sizenew.hex', 'r'); %opening size file
sizefile = fscanf(sizehex, '%x');
fclose(sizehex);
rows = sizefile(1); cols = sizefile(2); %extracting rows and columns from sizefile


disp(sizefile);
outimg = reshape(grayimg,[cols, rows]);  %constructing image from grayscale values
outimg = outimg';
figure
imshow(outimg, [])    %display final grayscale image


