# Jenkins CI/CD Deployment untuk Aplikasi Golang 🚀

Repository ini berisi konfigurasi untuk membuat pipeline **Jenkins CI/CD** yang secara otomatis melakukan deploy aplikasi **Golang** ke dalam **Docker container**. Dengan pengaturan ini, kita dapat mengotomatiskan seluruh proses build, test, dan deployment.

## Deskripsi Umum 📝
Repository ini akan:
1. **Membangun** aplikasi Golang.
2. **Mendockerisasi** aplikasi tersebut.
3. **Melakukan deploy** Docker container ke server yang dituju.
4. Menggunakan **Jenkins** untuk proses Continuous Integration dan Continuous Deployment (CI/CD).

## Persyaratan ⚙️
- **Jenkins**: Pastikan Jenkins sudah terpasang dan dikonfigurasi pada lingkungan Anda.
- **Docker**: Docker harus terinstal di server tujuan.
- **GitHub**: Repository ini berisi kode sumber untuk aplikasi Golang Anda.
- **SSH Key**: Untuk deployment via SSH, pastikan konfigurasi public key pada server deployment sudah benar.
