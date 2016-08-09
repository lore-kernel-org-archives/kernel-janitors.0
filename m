From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 09 Aug 2016 11:58:27 +0000
Subject: [PATCH] rtc: pcf2123: Add missing error code assignment before test
Message-Id: <1470743907-11498-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It is likely that checking the result of 'pcf2123_write_reg' is expected
here.
Also fix a small style issue. The '{' at the beginning of the function
is misplaced.

Fixes: 809b453b76e15 ("rtc: pcf2123: clean up writes to the rtc chip")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rtc/rtc-pcf2123.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index b4478cc92b55..8895f77726e8 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -182,7 +182,8 @@ static ssize_t pcf2123_show(struct device *dev, struct device_attribute *attr,
 }
 
 static ssize_t pcf2123_store(struct device *dev, struct device_attribute *attr,
-			     const char *buffer, size_t count) {
+			     const char *buffer, size_t count)
+{
 	struct pcf2123_sysfs_reg *r;
 	unsigned long reg;
 	unsigned long val;
@@ -199,7 +200,7 @@ static ssize_t pcf2123_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	pcf2123_write_reg(dev, reg, val);
+	ret = pcf2123_write_reg(dev, reg, val);
 	if (ret < 0)
 		return -EIO;
 	return count;
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

