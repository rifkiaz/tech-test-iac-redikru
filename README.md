# Infrastruktur sebagai Kode (IaC) dengan Terraform

## Deskripsi

Proyek ini menggunakan Terraform untuk mengelola infrastruktur AWS dengan konfigurasi berikut:

- Virtual Private Cloud (VPC)
- Subnet publik
- Instance EC2 dengan Ubuntu
- Bucket S3

## Struktur Folder

```plaintext
.
├── ec2/              # Konfigurasi untuk instance EC2
│   ├── main.tf       # Definisi resource instance EC2
│   ├── outputs.tf    # Output yang diekspor dari modul EC2
│   └── variables.tf  # Variabel yang digunakan di modul EC2
├── main.tf           # File utama untuk menghubungkan modul-modul
├── outputs.tf        # Output utama yang diekspor dari proyek Terraform
├── README.md         # File ini, dokumentasi proyek
├── s3/               # Konfigurasi untuk bucket S3
│   ├── main.tf       # Definisi resource bucket S3
│   ├── outputs.tf    # Output yang diekspor dari modul S3 (jika diperlukan)
│   └── variables.tf  # Variabel yang digunakan di modul S3
└── subnet/           # Konfigurasi untuk subnet publik
    ├── main.tf       # Definisi resource subnet publik
    ├── outputs.tf    # Output yang diekspor dari modul subnet (jika diperlukan)
    └── variables.tf  # Variabel yang digunakan di modul subnet
```

## Prasyarat

Sebelum menjalankan Terraform, pastikan telah mempersiapkan:

- **AWS CLI**: Terhubung ke akun AWS dengan credentials yang sesuai.
- **Terraform**: Instalasi Terraform telah dilakukan di lingkungan lokal.
- **SSH Key Pair**: Sudah dibuat dan disimpan dengan baik.

## Langkah-langkah Penggunaan

1. **Inisialisasi Terraform**

   Jalankan perintah ini untuk menginisialisasi konfigurasi Terraform dan mendownload provider AWS:

   ```sh
   terraform init
   ```

2. **Validasi Konfigurasi**

   Pastikan konfigurasi Terraform Anda valid:

   ```sh
   terraform validate
   ```

3. **Terapkan Konfigurasi**

   Terapkan konfigurasi infrastruktur ke lingkungan AWS:

   ```sh
   terraform apply
   ```

   Anda akan diminta untuk meninjau perubahan yang akan diterapkan. Ketik `yes` untuk melanjutkan.

4. **Akses Instance EC2**

   Setelah selesai, Anda dapat mengakses instance EC2 dengan menggunakan SSH:

   ```sh
   ssh -i /path/to/your-key.pem ubuntu@<public-ip>
   ```

5. **Membersihkan (Opsional)**

   Jika Anda ingin menghapus infrastruktur yang telah dibuat:

   ```sh
   terraform destroy
   ```

   Ketik `yes` untuk mengonfirmasi penghapusan.

## Output yang Dihasilkan

Setelah menjalankan `terraform apply`, Anda akan melihat output berupa IP publik dari instance EC2 yang dibuat.

## Kontribusi

Jika Anda ingin berkontribusi pada proyek ini, silakan lakukan langkah-langkah berikut:

1. Fork repositori ini.
2. Buat branch baru (`git checkout -b fitur-kontribusi`).
3. Lakukan perubahan yang diperlukan.
4. Commit perubahan Anda (`git commit -am 'Menambahkan fitur baru'`).
5. Push ke branch Anda (`git push origin fitur-kontribusi`).
6. Buat pull request baru.

## Lisensi

Proyek ini dilisensikan di bawah lisensi MIT. Lihat [LICENSE](LICENSE) untuk informasi lebih lanjut.

---

Silakan sesuaikan README ini dengan detail spesifik dari proyek infrastruktur sebagai kode Anda. Pastikan untuk mencantumkan semua prasyarat, langkah-langkah penggunaan, dan informasi lain yang mungkin diperlukan oleh pengguna atau kontributor potensial.