function th = OTSU(img)
v = zeros(1,256);
mG = mean(img(:));
for k = 1:256
    t = img < k;
    temp1 = img(t);
    temp2 = img(~t);
    p1 = sum(t(:))/numel(img(:));
    p2 = 1-p1;
    m1 = sum(temp1(:))/(p1*numel(img(:)));
    m2 = sum(temp2(:))/(p2*numel(img(:)));
    v(k) = p1*(m1-mG)^2 + p2*(m2-mG)^2;
end
th = find(v == max(v))-1;
if length(th)>1
    th = mean(th);
end
end