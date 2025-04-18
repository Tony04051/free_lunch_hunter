<?php
require 'config.php';
require 'premium_check.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$user_id = $_SESSION['user_id'];

if (!isPremium($user_id, $conn) || getUserPremiumLevel($user_id, $conn) < 2) {
    echo "你沒有權限訪問此頁面。";
    exit;
}

// 獲取所有活動
$sql = "SELECT * FROM activities";
$stmt = $conn->prepare($sql);
$stmt->execute();
$activities = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['delete'])) {
        $activity_id = $_POST['activity_id'];
        $sql = "DELETE FROM activities WHERE id = :activity_id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':activity_id', $activity_id);
        $stmt->execute();
        header('Location: manage_activities.php');
        exit;
    } elseif (isset($_POST['edit'])) {
        $activity_id = $_POST['activity_id'];
        $title = $_POST['title'];
        $content = $_POST['content'];
        $img = $_POST['img'];
        $act_date = $_POST['act_date'];
        $rate = $_POST['rate'];
        $place = $_POST['place'];
        $start_time = $_POST['start_time'];
        $end_time = $_POST['end_time'];
        $url = $_POST['url'];
        $lunch = $_POST['lunch'];

        $sql = "UPDATE activities SET title = :title, content = :content, img = :img, act_date = :act_date, rate = :rate, place = :place, STARTT = :start_time, ENDT = :end_time, URL = :url, LUNCH = :lunch WHERE id = :activity_id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':content', $content);
        $stmt->bindParam(':img', $img);
        $stmt->bindParam(':act_date', $act_date);
        $stmt->bindParam(':rate', $rate);
        $stmt->bindParam(':place', $place);
        $stmt->bindParam(':start_time', $start_time);
        $stmt->bindParam(':end_time', $end_time);
        $stmt->bindParam(':url', $url);
        $stmt->bindParam(':lunch', $lunch);
        $stmt->bindParam(':activity_id', $activity_id);
        $stmt->execute();
        header('Location: manage_activities.php');
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理活動 - 免費午餐分享平台</title>
    <link rel="stylesheet" href="styles1.css">
    <style>
        .navbar_admin {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 10px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar_admin a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
        }

        .navbar_admin a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            margin-top: 60px;
        }
    </style>
</head>

<body>
    <div class="navbar_admin">
        <h1 style="color: white; margin: 0;">管理員控制台</h1>
        <div>
            <a href="admin_dashboard.php">活動總覽</a>
            <a href="create_activities.php">發布新活動</a>
            <a href="manage_activities.php">管理活動</a>
            <a href="login.php">登出</a>
        </div>
    </div>

    <div class="container">
        <h2>編輯活動</h2>
        <?php foreach ($activities as $activity): ?>
            <?php
            // 格式化日期
            $actDate = new DateTime($activity['act_date']);
            ?>
            <div class="activity">
                <form action="manage_activities.php" method="post">
                    <input type="hidden" name="activity_id" value="<?php echo htmlspecialchars($activity['id']); ?>">
                    <div class="input-group">
                        <input type="text" name="title" value="<?php echo htmlspecialchars($activity['title']); ?>"
                            required>
                        <label>Title:</label>
                    </div>
                    <div class="input-group">
                        <textarea name="content" required><?php echo htmlspecialchars($activity['content']); ?></textarea>
                        <label>Content:</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="img" value="<?php echo htmlspecialchars($activity['img']); ?>">
                        <label>Image URL:</label>
                    </div>
                    <div class="input-group">
                        <input type="date" name="act_date" value="<?php echo $actDate->format('Y-m-d'); ?>" required>
                        <label>Activity Date:</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="place" value="<?php echo htmlspecialchars($activity['place']); ?>"
                            required>
                        <label>Place:</label>
                    </div>
                    <div class="input-group">
                        <input type="hidden" name="start_time" value="00:00">
                        <input type="hidden" name="end_time" value="00:00">
                    </div>
                    <div class="input-group">
                        <input type="url" name="url" value="<?php echo htmlspecialchars($activity['URL']); ?>">
                        <label>URL:</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="lunch" value="<?php echo htmlspecialchars($activity['LUNCH']); ?>">
                        <label>Lunch:</label>
                    </div>
                    <div class="input-group">
                        <button type="submit" name="edit" class="btn">保存變更</button>
                        <button type="submit" name="delete" class="btn"
                            onclick="return confirm('你確定要刪除這個活動嗎？');">刪除活動</button>
                    </div>
                </form>
            </div>
            <hr>
        <?php endforeach; ?>
    </div>

    <footer>
        <p>CopyRight © 2024 Great Purpose Team All Rights Reserved</p>
    </footer>
</body>

</html>