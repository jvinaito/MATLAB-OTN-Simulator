function monitoring_system(otn_frame)
    % otn_frame nên là một mảng các số nguyên từ 0-255 (các byte)
    fprintf('--- Hệ thống giám sát BIP-8 Real-time ---\n');
    pause(0.5);

    % 1. Tính toán BIP-8 thực tế từ dữ liệu đầu vào
    % Ta thực hiện XOR dồn tất cả các byte trong frame
    calculated_bip = 0;
    for i = 1:length(otn_frame)
        calculated_bip = bitxor(calculated_bip, otn_frame(i));
    end

    % 2. Giả lập byte BIP-8 nhận được từ Overhead (để so sánh)
    % Bình thường nó phải khớp với calculated_bip. 
    % Ta giả lập lỗi bằng cách thỉnh thoảng làm sai lệch nó đi.
    if rand > 0.8
        received_bip = bitxor(calculated_bip, randi([1, 255])); % Gây lỗi
    else
        received_bip = calculated_bip; % Khớp hoàn toàn
    end

    % 3. So sánh và đưa ra kết luận
    if calculated_bip ~= received_bip
        % Mã lỗi chính là kết quả XOR giữa 2 giá trị (vị trí các bit bị lệch)
        errorCode = bitxor(calculated_bip, received_bip);
        fprintf('! CẢNH BÁO: Phát hiện lỗi Bit trên đường truyền !\n');
        fprintf('Mã lỗi BIP-8 mismatch: 0x%s\n', dec2hex(errorCode, 2));
    else
        fprintf('STATUS: Link Healthy - Checksum khớp (0x%s).\n', dec2hex(calculated_bip, 2));
    end
end