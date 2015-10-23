# Note_DevStack
Hướng dẫn cài đặt OpenStack thông qua DevStack
=======

### 1. Khái niệm:

DevStack là một dự án viết ra phục vụ cho việc cài đặt nhanh chóng OpenStack với mục đích test các tính năng và phục vụ cho người lập trình trong OpenStack. Về bản chất DevStack sẽ clone từ source trên GitHup của OpenStack về cài đặt mà không thông qua các Repo của hệ điều hành.  

### 2. Các kịch bản cài đặt

Việc cài đặt OpenStack có thể theo nhiều kịch bản và mô hình khác nhau như: mô hình All in One, multi node, lựa chọn các projec cho việc cài đặt. Tương tự việc cài theo DevStack nó cũng có nhiều các kịch bản khác nhau như và sẽ được định nghĩa trong file local.conf tại thư mục devstack sau khi ta clone DevStack về.

Vậy cái khó khăn duy nhất của DevStack là ta cần tạo ra một file local.conf để xác định kịch bản cài đặt. Dưới đây sẽ có nhiều template phục vụ cho việc cài đặt:
