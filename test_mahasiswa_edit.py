#!/usr/bin/env python

import requests
import re

# Test login
login_url = "http://127.0.0.1:8001/admin/login/"
login_data = {
    'username': 'admin',
    'password': 'admin123'  # Ganti dengan password yang benar
}

session = requests.Session()

try:
    # Get CSRF token first
    print("Getting login page...")
    login_page = session.get(login_url)
    csrf_token = re.search(r'name="csrfmiddlewaretoken" value="([^"]+)"', login_page.text)

    if csrf_token:
        login_data['csrfmiddlewaretoken'] = csrf_token.group(1)
        print(f"CSRF token found: {csrf_token.group(1)[:20]}...")
    else:
        print("No CSRF token found")

    # Login
    print("Attempting to login...")
    login_response = session.post(login_url, data=login_data, allow_redirects=False)
    print(f"Login response status: {login_response.status_code}")

    if login_response.status_code == 302:
        print("Login successful, session cookies:", session.cookies.get_dict())

        # Now try to access mahasiswa edit page
        edit_url = "http://127.0.0.1:8001/admin/academic/mahasiswa/11/change/"
        print(f"Accessing {edit_url}...")

        edit_response = session.get(edit_url)
        print(f"Edit page response status: {edit_response.status_code}")

        if edit_response.status_code == 200:
            print("SUCCESS: Mahasiswa edit page loaded successfully")
            print("Page title:", re.search(r'<title>(.*?)</title>', edit_response.text).group(1) if re.search(r'<title>(.*?)</title>', edit_response.text) else "No title found")
        elif edit_response.status_code == 302:
            print("Redirected to:", edit_response.headers.get('Location', 'Unknown'))
        else:
            print(f"Error: Got status code {edit_response.status_code}")
            if edit_response.status_code >= 400:
                # Extract error message from Django debug page
                error_match = re.search(r'<h1>(.*?)</h1>', edit_response.text)
                if error_match:
                    print("Error type:", error_match.group(1))

                # Extract specific error details
                error_details_match = re.search(r'<pre.*?>(.*?)</pre>', edit_response.text, re.DOTALL)
                if error_details_match:
                    print("Error details:", error_details_match.group(1).strip())

                print("Full error content (first 2000 chars):")
                print(edit_response.text[:2000])

    else:
        print(f"Login failed with status: {login_response.status_code}")
        print("Login response:", login_response.text[:500])

except Exception as e:
    print(f"Error: {e}")