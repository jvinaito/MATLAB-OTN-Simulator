% ==========================================================
% DỰ ÁN: HỆ THỐNG QUẢN LÝ VÀ GIÁM SÁT MẠNG QUANG G.709
% Người thực hiện: Nguyễn Hoàng Hải
% ==========================================================
clc; clear; close all;

fprintf('--- CHƯƠNG TRÌNH MÔ PHỎNG OTN G.709 STARTED ---\n\n');

% --- BƯỚC 1: MODULE QUY HOẠCH (Network Planning) ---
% Cho phép nhập băng thông thực tế để tính toán tài nguyên
bw_input = input('Nhập băng thông dịch vụ khách hàng (Gbps): ');
[slots, eff] = network_planning(bw_input);

% --- BƯỚC 2: MODULE ĐÓNG GÓI & TRỰC QUAN (Framing) ---
% Khởi tạo ma trận và vẽ bản đồ cấu trúc khung
frame = create_visualization_frame();

% --- BƯỚC 3: MODULE GIÁM SÁT & BÁO ĐỘNG (Monitoring) ---
% Chạy thuật toán kiểm tra lỗi logic BIP-8
monitoring_system(frame);

fprintf('\n--- KẾT THÚC QUY TRÌNH PHÂN TÍCH ---\n');