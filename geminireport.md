## System Architecture Report: SIP Kuliah (Django Academic Information System)

This report outlines the architecture of the `sip_kuliah` Django project, a web application designed for academic information management.

### 1. Project Structure and Core Components:

*   **`sip_kuliah/` (Django Project):** This is the main Django project directory.
    *   **`settings.py`**: Configures the entire Django project, including database settings (MySQL), installed applications (`academic`, `django.contrib.admin`, etc.), middleware, template directories, static/media file handling, and custom settings like `LOGIN_URL` and `GEMINI_API_KEY`. It uses `dotenv` to load environment variables for sensitive information like `SECRET_KEY` and database credentials.
    *   **`urls.py`**: The root URL configuration for the project. It includes URLs from the `academic` app and defines paths for the Django admin, custom login, and logout views.
    *   **`wsgi.py` / `asgi.py`**: Entry points for web servers (WSGI for synchronous, ASGI for asynchronous).
*   **`academic/` (Django App):** This is the primary application containing the business logic for academic management.
    *   **`models.py`**: Defines the database schema using Django's ORM. Key models include:
        *   `ProgramStudi`: Academic programs (e.g., D3, S1).
        *   `Dosen`: Lecturer profiles, linked to Django's `User` model.
        *   `Mahasiswa`: Student profiles, also linked to Django's `User` model.
        *   `MataKuliah`: Course information.
        *   `Kelas`: Specific class instances (e.g., "Calculus A" taught by a specific lecturer in a specific year/semester).
        *   `KRS`: Student course registration (Kartu Rencana Studi), linking `Mahasiswa` to `Kelas` with a status (pending, approved, rejected).
        *   `Jadwal`: Class schedules for `Kelas`.
        *   `Presensi`: Student attendance records for `KRS`.
        *   `Nilai`: Student grades for `KRS`.
        *   `Notification`: System notifications for users (e.g., KRS approval/rejection).
    *   **`views.py`**: Contains the logic for handling HTTP requests and rendering responses. It's divided into sections for `Mahasiswa` (student), `Dosen` (lecturer), and common functionalities like `custom_login` and `home`. It uses `@login_required` decorators to protect views. Helper functions like `hitung_ipk`, `hitung_ips`, and `konversi_nilai_ke_huruf` are also present.
    *   **`urls.py`**: Defines URL patterns specific to the `academic` app, mapping URLs to the views in `academic/views.py`.
    *   **`admin.py`**: Registers the models with the Django administration interface, customizing their display, filtering, and search capabilities. It also includes a `CustomAdminSite` to add statistics to the admin dashboard.
    *   **`forms.py`**: Defines Django forms for user registration and data input (e.g., `KRSForm`, `NilaiForm`).
    *   **`templates/academic/`**: Contains HTML templates for rendering the user interface for students and lecturers.
    *   **`static/admin/css/custom-admin.css`**: Custom CSS for the admin interface.

### 2. Data Flow and User Interaction:

1.  **Authentication:** Users access the system via a custom login page (`/login/`). Upon successful authentication, they are redirected to either the student dashboard (`/mahasiswa/`) or the lecturer dashboard (`/dosen/`) based on their associated profile.
2.  **Student Workflow:**
    *   **Dashboard (`mahasiswa_dashboard`):** Displays an overview, active KRS, total SKS, and IPK.
    *   **KRS (`mahasiswa_krs`, `tambah_krs`, `hapus_krs`):** Allows students to view available classes, add/remove courses to their KRS, and see the approval status. Notifications are sent to lecturers upon KRS submission.
    *   **KHS (`mahasiswa_khs`):** Displays academic transcripts (Kartu Hasil Studi) with grades and calculated IPS/IPK, with filtering by academic year and semester.
    *   **Jadwal (`mahasiswa_jadwal`):** Shows the student's class schedule.
    *   **Presensi (`mahasiswa_presensi`):** Displays attendance records.
    *   **Biodata (`mahasiswa_biodata`, `mahasiswa_edit_biodata`):** Allows students to view and edit their personal information.
3.  **Lecturer Workflow:**
    *   **Dashboard (`dosen_dashboard`):** Provides an overview of classes taught.
    *   **Kelas (`dosen_kelas`, `dosen_kelas_detail`):** Lists classes taught by the lecturer and details of each class, including enrolled students.
    *   **Input Nilai (`dosen_input_nilai`):** Allows lecturers to input grades for students in their classes.
    *   **Input Presensi (`dosen_input_presensi`):** Allows lecturers to record student attendance.
    *   **Biodata (`dosen_biodata`, `dosen_edit_biodata`):** Allows lecturers to view and edit their personal information.
    *   **Notifications (`dosen_notifications`):** Displays pending KRS approvals and other system notifications.
    *   **KRS Approval (`dosen_approve_krs`, `dosen_reject_krs`):** Lecturers can approve or reject student KRS submissions, triggering notifications back to the students.

### 3. Database and ORM:

*   The system uses **MySQL** as its database, configured via environment variables in `settings.py`.
*   Django's Object-Relational Mapper (ORM) is extensively used in `models.py` to define database tables and their relationships (e.g., `ForeignKey`, `OneToOneField`). This allows Python code to interact with the database without writing raw SQL.

### 4. Frontend and Templating:

*   The frontend is rendered using **Django's template engine**. HTML files are located in `academic/templates/academic/` and `sip_kuliah/templates/`.
*   The templates utilize a base template (`academic/base.html`) for consistent layout and styling.
*   Custom CSS is used for styling, particularly for the admin interface.

### 5. Deployment Considerations:

*   **`gunicorn.service` and `start_gunicorn.sh`**: These files suggest the application is intended to be deployed using Gunicorn, a WSGI HTTP server, likely behind a reverse proxy like Nginx.
*   **`nginx_vhost_recommended.conf`**: This file indicates that Nginx is used as a web server to serve static files and proxy requests to the Gunicorn application server.
*   **`.env`**: Used for managing environment variables, crucial for production deployments to keep sensitive information out of the codebase.

In summary, this is a well-structured Django application following common architectural patterns, designed to manage academic data for students and lecturers with distinct user roles and workflows.