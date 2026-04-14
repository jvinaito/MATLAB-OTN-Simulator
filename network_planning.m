function [num_slots, efficiency] = network_planning(client_bw)
    ts_bw = 1.25; % Dung lượng 1 khe TS chuẩn G.709
    
    % Thuật toán: Chia và làm tròn lên để đảm bảo đủ băng thông
    num_slots = ceil(client_bw / ts_bw);
    
    % Tính hiệu suất: (Băng thông thực tế / Băng thông cấp phát) * 100
    allocated_bw = num_slots * ts_bw;
    efficiency = (client_bw / allocated_bw) * 100;
    
    fprintf('--- KẾT QUẢ QUY HOẠCH ---\n');
    fprintf('Băng thông yêu cầu: %.2f Gbps\n', client_bw);
    fprintf('Số khe TS (1.25G) cần dùng: %d khe\n', num_slots);
    fprintf('Hiệu suất sử dụng: %.2f%%\n', efficiency);
end