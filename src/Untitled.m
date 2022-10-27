path1 = 'C:\Users\anony\OneDrive\Desktop\TaiLieuDH\XuLyAnh\btlon\btl\Fingerprint-Recognition-Matlab-master\src\FVC2002\DB1_B\101_1.tif';
path2 = 'ljlkjkjl114_5.tif'
ind = regexp(path1, '[0-9][0-1][0-8]_[0-8]');
fprintf("%d", ind);

path3 = '114_6.tif'
a = path3(3:6)
fprintf('%d', a)

ta = table([1:4]',ones(4,3,2),eye(4,3))
disp(ta)
[r] = size(ta)
i=2