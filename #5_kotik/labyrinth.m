%%
% create lab from image
lab=imread('labyrinthe.png');
lab_norm=zeros([601,601]);

for i=1:601
    for j=1:601
        if (mod(i,2)==0)
           ind_i= (floor(i/2)-1)*6+3;
        else
            ind_i= floor(i/2)*6+1;
        end
        if (mod(j,2)==0)
            ind_j= (floor(j/2)-1)*6+3;
        else
            ind_j= floor(j/2)*6+1;
        end
        
        lab_norm(i,j)=lab(ind_i,ind_j,1)/255;
    end
end
lab_norm(1,:)=0;
lab_norm(601,:)=0;
lab_norm(:,1)=0;
lab_norm(:,601)=0;

fileid=fopen('labirinth.dat','w');
fprintf(fileid,'%d %d\n',601,601);
fprintf(fileid,'%d ',lab_norm(:));
fclose(fileid);
%%
%rough reader of lab_files.dat
clear all;
fileid=fopen('labirinth.dat','r');
A=fscanf(fileid,'%d',2);
ik=A(1); jk=A(2);
lab=zeros([ik,jk],'uint8');
lab(:)=fscanf(fileid,'%d ',ik*jk);
fclose (fileid);
%%
% cat
kotik=imread('cat.jpg');
c=kotik(:,421:(end-420),:);
c_resize=imresize(c,[601,601]);
lab3d=cat(3,lab,lab,lab);
lab_kotik=c_resize.*lab3d;
% imagesc(lab_kotik);
lab_kotik_scaled=imresize(lab_kotik,8);
imwrite(lab_kotik_scaled,'lab_nice_cat.png')