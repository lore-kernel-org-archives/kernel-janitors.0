From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Sat, 23 Jul 2016 04:11:28 +0000
Subject: [PATCH 1/2] drivers: w1: insert whitespace around operators
Message-Id: <1469247089-8093-2-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Coding style correction as identified by the checkpatch.pl script.
White space inserted before and after operators at a number of
locations

Signed-off-by: Ben Werbowyj <ben.werbowyj@gmail.com>
---
 drivers/w1/slaves/w1_ds2406.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds2406.c b/drivers/w1/slaves/w1_ds2406.c
index d488961..d37a6e6 100644
--- a/drivers/w1/slaves/w1_ds2406.c
+++ b/drivers/w1/slaves/w1_ds2406.c
@@ -33,11 +33,11 @@ static ssize_t w1_f12_read_state(
 	struct bin_attribute *bin_attr,
 	char *buf, loff_t off, size_t count)
 {
-	u8 w1_buf[6]={W1_F12_FUNC_READ_STATUS, 7, 0, 0, 0, 0};
+	u8 w1_buf[6] = {W1_F12_FUNC_READ_STATUS, 7, 0, 0, 0, 0};
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
-	u16 crc=0;
+	u16 crc = 0;
 	int i;
-	ssize_t rtnval=1;
+	ssize_t rtnval = 1;
 
 	if (off != 0)
 		return 0;
@@ -53,12 +53,12 @@ static ssize_t w1_f12_read_state(
 
 	w1_write_block(sl->master, w1_buf, 3);
 	w1_read_block(sl->master, w1_buf+3, 3);
-	for (i=0; i<6; i++)
-		crc=crc16_byte(crc, w1_buf[i]);
-	if (crc=0xb001) /* good read? */
-		*buf=((w1_buf[3]>>5)&3)|0x30;
+	for (i = 0; i < 6; i++)
+		crc = crc16_byte(crc, w1_buf[i]);
+	if (crc = 0xb001) /* good read? */
+		*buf = ((w1_buf[3]>>5)&3)|0x30;
 	else
-		rtnval=-EIO;
+		rtnval = -EIO;
 
 	mutex_unlock(&sl->master->bus_mutex);
 
@@ -71,10 +71,10 @@ static ssize_t w1_f12_write_output(
 	char *buf, loff_t off, size_t count)
 {
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
-	u8 w1_buf[6]={W1_F12_FUNC_WRITE_STATUS, 7, 0, 0, 0, 0};
-	u16 crc=0;
+	u8 w1_buf[6] = {W1_F12_FUNC_WRITE_STATUS, 7, 0, 0, 0, 0};
+	u16 crc = 0;
 	int i;
-	ssize_t rtnval=1;
+	ssize_t rtnval = 1;
 
 	if (count != 1 || off != 0)
 		return -EFAULT;
@@ -89,12 +89,12 @@ static ssize_t w1_f12_write_output(
 	w1_buf[3] = (((*buf)&3)<<5)|0x1F;
 	w1_write_block(sl->master, w1_buf, 4);
 	w1_read_block(sl->master, w1_buf+4, 2);
-	for (i=0; i<6; i++)
-		crc=crc16_byte(crc, w1_buf[i]);
-	if (crc=0xb001) /* good read? */
+	for (i = 0; i < 6; i++)
+		crc = crc16_byte(crc, w1_buf[i]);
+	if (crc = 0xb001) /* good read? */
 		w1_write_8(sl->master, 0xFF);
 	else
-		rtnval=-EIO;
+		rtnval = -EIO;
 
 	mutex_unlock(&sl->master->bus_mutex);
 	return rtnval;
-- 
2.1.4

