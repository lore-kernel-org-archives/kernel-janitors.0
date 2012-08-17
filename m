From: Jonathan Brett <jonbrett.dev@gmail.com>
Date: Fri, 17 Aug 2012 20:13:18 +0000
Subject: [PATCH] Staging: asus_oled: Add suspend/resume callbacks
Message-Id: <1345234398-4675-1-git-send-email-jonbrett.dev@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

- Add simple suspend/resume PM callbacks to disable oled display on
  suspend and return to previous state on resume

Signed-off-by: Jonathan Brett <jonbrett.dev@gmail.com>
---
 drivers/staging/asus_oled/asus_oled.c |   35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/staging/asus_oled/asus_oled.c b/drivers/staging/asus_oled/asus_oled.c
index 42a5e7a..0018547 100644
--- a/drivers/staging/asus_oled/asus_oled.c
+++ b/drivers/staging/asus_oled/asus_oled.c
@@ -137,6 +137,7 @@ struct asus_oled_dev {
 	size_t			buf_size;
 	char			*buf;
 	uint8_t			enabled;
+	uint8_t			enabled_post_resume;
 	struct device		*dev;
 };
 
@@ -765,11 +766,45 @@ static void asus_oled_disconnect(struct usb_interface *interface)
 	dev_info(&interface->dev, "Disconnected Asus OLED device\n");
 }
 
+#ifdef CONFIG_PM
+static int asus_oled_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct asus_oled_dev *odev;
+
+	odev = usb_get_intfdata(intf);
+	if (!odev)
+		return -ENODEV;
+
+	odev->enabled_post_resume = odev->enabled;
+	enable_oled(odev, 0);
+
+	return 0;
+}
+
+static int asus_oled_resume(struct usb_interface *intf)
+{
+	struct asus_oled_dev *odev;
+
+	odev = usb_get_intfdata(intf);
+	if (!odev)
+		return -ENODEV;
+
+	enable_oled(odev, odev->enabled_post_resume);
+
+	return 0;
+}
+#else
+#define asus_oled_suspend NULL
+#define asus_oled_resume NULL
+#endif
+
 static struct usb_driver oled_driver = {
 	.name =		ASUS_OLED_NAME,
 	.probe =	asus_oled_probe,
 	.disconnect =	asus_oled_disconnect,
 	.id_table =	id_table,
+	.suspend =	asus_oled_suspend,
+	.resume =	asus_oled_resume,
 };
 
 static CLASS_ATTR_STRING(version, S_IRUGO,
-- 
1.7.9.5

