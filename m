From: Jonathan Brett <jonbrett.dev@gmail.com>
Date: Wed, 15 Aug 2012 19:47:32 +0000
Subject: [PATCH 1/2] staging: asus_oled: Change printk calls to dev_xxx
Message-Id: <1345060053-14917-1-git-send-email-jonbrett.dev@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

- Use dev_err whenever a struct device * is present
- None of the printk calls had levels set, but looked like they should
  probably be dev_err

Signed-off-by: Jonathan Brett <jonbrett.dev@gmail.com>
---
 drivers/staging/asus_oled/asus_oled.c |   18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/asus_oled/asus_oled.c b/drivers/staging/asus_oled/asus_oled.c
index f63c1d3..9a8843f 100644
--- a/drivers/staging/asus_oled/asus_oled.c
+++ b/drivers/staging/asus_oled/asus_oled.c
@@ -42,8 +42,6 @@
 #define ASUS_OLED_NAME			"asus-oled"
 #define ASUS_OLED_UNDERSCORE_NAME	"asus_oled"
 
-#define ASUS_OLED_ERROR			"Asus OLED Display Error: "
-
 #define ASUS_OLED_STATIC		's'
 #define ASUS_OLED_ROLL			'r'
 #define ASUS_OLED_FLASH			'f'
@@ -383,13 +381,13 @@ static int append_values(struct asus_oled_dev *odev, uint8_t val, size_t count)
 
 		default:
 			i = 0;
-			printk(ASUS_OLED_ERROR "Unknown OLED Pack Mode: %d!\n",
+			dev_err(odev->dev, "Unknown OLED Pack Mode: %d!\n",
 			       odev->pack_mode);
 			break;
 		}
 
 		if (i >= odev->buf_size) {
-			printk(ASUS_OLED_ERROR "Buffer overflow! Report a bug:"
+			dev_err(odev->dev, "Buffer overflow! Report a bug:"
 			       "offs: %d >= %d i: %d (x: %d y: %d)\n",
 			       (int) odev->buf_offs, (int) odev->buf_size,
 			       (int) i, (int) x, (int) y);
@@ -435,7 +433,7 @@ static ssize_t odev_set_picture(struct asus_oled_dev *odev,
 		odev->buf = kmalloc(odev->buf_size, GFP_KERNEL);
 		if (odev->buf = NULL) {
 			odev->buf_size = 0;
-			printk(ASUS_OLED_ERROR "Out of memory!\n");
+			dev_err(odev->dev, "Out of memory!\n");
 			return -ENOMEM;
 		}
 
@@ -473,7 +471,7 @@ static ssize_t odev_set_picture(struct asus_oled_dev *odev,
 			odev->pic_mode = buf[1];
 			break;
 		default:
-			printk(ASUS_OLED_ERROR "Wrong picture mode: '%c'.\n",
+			dev_err(odev->dev, "Wrong picture mode: '%c'.\n",
 			       buf[1]);
 			return -EIO;
 			break;
@@ -533,7 +531,7 @@ static ssize_t odev_set_picture(struct asus_oled_dev *odev,
 
 		if (odev->buf = NULL) {
 			odev->buf_size = 0;
-			printk(ASUS_OLED_ERROR "Out of memory!\n");
+			dev_err(odev->dev, "Out of memory!\n");
 			return -ENOMEM;
 		}
 
@@ -593,15 +591,15 @@ static ssize_t odev_set_picture(struct asus_oled_dev *odev,
 	return count;
 
 error_width:
-	printk(ASUS_OLED_ERROR "Wrong picture width specified.\n");
+	dev_err(odev->dev, "Wrong picture width specified.\n");
 	return -EIO;
 
 error_height:
-	printk(ASUS_OLED_ERROR "Wrong picture height specified.\n");
+	dev_err(odev->dev, "Wrong picture height specified.\n");
 	return -EIO;
 
 error_header:
-	printk(ASUS_OLED_ERROR "Wrong picture header.\n");
+	dev_err(odev->dev, "Wrong picture header.\n");
 	return -EIO;
 }
 
-- 
1.7.9.5

