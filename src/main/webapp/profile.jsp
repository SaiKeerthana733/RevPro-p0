<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e8f0fe; /* Soft light blue background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .profile-container {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            padding: 30px;
            text-align: center;
        }

        .profile-header {
            background-color: #007bb5;
            padding: 20px;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
            color: #fff;
            font-size: 24px;
            font-weight: bold;
        }

        .profile-body {
            padding: 20px;
        }

        .profile-body p {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }

        .profile-body p strong {
            color: #007bb5;
        }

        /* Adding icons for each field */
        .profile-body .profile-item {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }

        .profile-body .profile-item i {
            margin-right: 10px;
            color: #007bb5;
        }

        .profile-footer {
            background-color: #f4f4f4;
            padding: 15px;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>

    <div class="profile-container">
        <!-- Profile Header -->
        <div class="profile-header">
            User Profile
        </div>

        <!-- Profile Body -->
        <div class="profile-body">
            <div class="profile-item">
                <i class="fas fa-id-card"></i> <!-- Icon for user ID -->
                <p><strong>User ID:</strong> ${user.id}</p>
            </div>
            <div class="profile-item">
                <i class="fas fa-envelope"></i> <!-- Icon for email -->
                <p><strong>Email:</strong> ${user.email}</p>
            </div>
            <div class="profile-item">
                <i class="fas fa-user-tag"></i> <!-- Icon for role -->
                <p><strong>Role:</strong> ${user.role}</p>
            </div>
        </div>

        
    </div>

    <!-- FontAwesome Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

</body>
</html>
