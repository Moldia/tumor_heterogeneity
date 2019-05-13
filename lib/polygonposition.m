function polygoncoord = polygonposition(Pos, grid_size, scale)

grid_nrx =  ceil(max(Pos(:,1))/grid_size);
grid_nry =  ceil(max(Pos(:,2))/grid_size);
grid_nr = grid_nrx*grid_nry;

polygoncoord = zeros(5,2,grid_nr);
grid_size = ceil(grid_size*scale);
for j = 1:grid_nrx   % j along x axis, column
    gridxmin = (j-1)*grid_size + min(Pos(:,1))*scale;
    gridxmax = j*grid_size + min(Pos(:,1))*scale;
    
    for i = 1:grid_nry  % i along y axis, row
        gridymin = (i-1)*grid_size + min(Pos(:,2))*scale;
        gridymax = i*grid_size + min(Pos(:,2))*scale;
        
        k = (j-1)*grid_nry+i; % counting direction: y
        
        polyx = [gridxmin,gridxmin,gridxmax,gridxmax,gridxmin];
        polyy = [gridymin,gridymax,gridymax,gridymin,gridymin];
        polygoncoord(:,:,k) = [polyx',polyy'];
    end
end
