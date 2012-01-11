From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 22:22:53 +0000
Subject: [PATCH v2 16/17] Staging: quickstart: Use scnprintf in quickstart_pressed_button_show
Message-Id: <1326320574-11220-19-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use scnprintf instead of snprintf in quickstart_pressed_button_show as
suggested in Documentation/filesystems/sysfs.txt.

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 2843cf7..b5ce1cc 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -98,7 +98,7 @@ static ssize_t quickstart_pressed_button_show(struct device *dev,
 						struct device_attribute *attr,
 						char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return scnprintf(buf, PAGE_SIZE, "%s\n",
 					(pressed ? pressed->name : "none"));
 }
 
-- 
1.7.8.3


