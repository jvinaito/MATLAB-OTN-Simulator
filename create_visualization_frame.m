function otn_frame = create_visualization_frame()
    % Khởi tạo ma trận khung chuẩn 4x4080
    otn_frame = zeros(4, 4080);
    
    % Module hóa các vùng bằng Array Slicing
    % Quy định: OH = 1, Payload = 2, FEC = 3 (để vẽ màu)
    otn_frame(:, 1:16) = 1;        % Vùng Overhead (16 cột đầu)
    otn_frame(:, 17:3824) = 2;     % Vùng Payload (Dữ liệu)
    otn_frame(:, 3825:4080) = 3;   % Vùng FEC (Sửa lỗi)
    
    % Vẽ biểu đồ ma trận
    figure('Name', 'G.709 Frame Map');
    imagesc(otn_frame);
    colormap([1 1 0; 0 0.8 0; 1 0 0]); % Vàng (OH), Xanh (Data), Đỏ (FEC)
    title('Bản đồ phân bổ dữ liệu Khung OTN');
    xlabel('Cột (Bytes)'); ylabel('Hàng');
    colorbar('Ticks',[1, 2, 3], 'TickLabels',{'Overhead','Payload','FEC'});
end