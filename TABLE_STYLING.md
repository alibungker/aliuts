# Table Styling Documentation

## 🎨 Bootstrap Table Styling for Master Data

### **Updated Features:**

#### **1. Modern Table Headers**
- **Gradient Background**: Primary color gradient
- **White Text**: Uppercase with letter spacing
- **Increased Padding**: 1rem for better readability
- **Border Bottom**: 2px solid primary color

#### **2. Enhanced Table Body**
- **Alternating Rows**: Light gray striped pattern
- **Hover Effects**: Subtle lift with shadow
- **Consistent Padding**: 0.875rem cells
- **Modern Typography**: Proper font weights

#### **3. Bootstrap Badge Integration**
- **Color Variants**: Primary, Success, Info, Warning, Danger
- **Proper Sizing**: Consistent with Bootstrap 5
- **Letter Spacing**: Better readability
- **Rounded Corners**: 0.375rem radius

#### **4. Responsive Design**
- **Mobile-First**: Optimized for all screen sizes
- **Table 768px+**: Full desktop experience
- **Table 576px**: Compact mobile view
- **Font Scaling**: Adaptive text sizes

### **CSS Classes Applied:**

```css
/* Main Table Styles */
.table {
    font-size: 0.875rem;
    --bs-table-striped-bg: rgba(248, 249, 250, 0.8);
    --bs-table-active-bg: rgba(78, 115, 223, 0.1);
    --bs-table-hover-bg: rgba(248, 249, 250, 0.95);
}

.table thead th {
    background: linear-gradient(135deg, var(--wow-primary), #3a5ba6);
    color: white;
    font-size: 0.875rem;
    padding: 1rem 0.75rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.table tbody td {
    padding: 0.875rem 0.75rem;
    border-bottom: 1px solid var(--wow-gray-200);
}

.table-hover tbody tr:hover {
    background: var(--bs-table-hover-bg);
    transform: translateY(-1px);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}
```

### **Responsive Breakpoints:**

- **Desktop (≥768px)**: Full table experience
- **Table (≤768px)**: Reduced font size and padding
- **Mobile (≤576px)**: Compact view with minimal spacing

### **Master Data Tables Affected:**

✅ **Fakultas** → Modern gradient header
✅ **Program Studi** → Bootstrap styled with badges
✅ **Ruang** → Color-coded status badges
✅ **Mahasiswa** → Enhanced readability
✅ **Dosen** → Professional table layout
✅ **Mata Kuliah** → Organized data display
✅ **Semester** → Clean admin interface
✅ **Kelas** → Comprehensive information display
✅ **Jadwal** → Time-based table styling

### **Badge Examples:**

```html
<span class="badge bg-primary">Aktif</span>
<span class="badge bg-success">Kelas</span>
<span class="badge bg-info">Lab</span>
<span class="badge bg-warning">Auditorium</span>
<span class="badge bg-danger">Maintenance</span>
```

### **Benefits:**

1. **Consistent Branding**: Matches site theme
2. **Better UX**: Improved readability and interaction
3. **Mobile Friendly**: Works on all devices
4. **Bootstrap Compliant**: Uses standard Bootstrap 5 classes
5. **Modern Design**: Contemporary styling with gradients and shadows

---

*Last Updated: October 22, 2025*