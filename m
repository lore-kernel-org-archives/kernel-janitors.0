From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Feb 2015 20:41:43 +0000
Subject: [patch] fujitsu-laptop: simplify show_brightness_changed()
Message-Id: <20150226204143.GF6820@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

->brightness_changed is either 0 or 1, and never a negative.  We can
just remove this code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 2a9afa2..aa5ee98 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -444,14 +444,7 @@ static ssize_t
 show_brightness_changed(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-
-	int ret;
-
-	ret = fujitsu->brightness_changed;
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%i\n", ret);
+	return sprintf(buf, "%i\n", fujitsu->brightness_changed);
 }
 
 static ssize_t show_lcd_level(struct device *dev,
