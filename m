From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:15:13 +0000
Subject: [KJ] [PATCH 5/21] polling loops: change exit condition to
Message-Id: <43923511.1040804@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

HARDWARE MONITORING
P:	Jean Delvare
M:	khali@linux-fr.org

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/hwmon/hdaps.c linux-2.6.15-rc4/drivers/hwmon/hdaps.c
--- linux-2.6.15-rc4-orig/drivers/hwmon/hdaps.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/hwmon/hdaps.c	2005-12-03 16:53:10.000000000 +0100
@@ -211,7 +211,8 @@ static int hdaps_read_pair(unsigned int 
  */
 static int hdaps_device_init(void)
 {
-	int total, ret = -ENXIO;
+	int ret = -ENXIO;
+	unsigned long end_time;
 
 	down(&hdaps_sem);
 
@@ -265,7 +266,8 @@ static int hdaps_device_init(void)
 		goto out;
 
 	/* we have done our dance, now let's wait for the applause */
-	for (total = INIT_TIMEOUT_MSECS; total > 0; total -= INIT_WAIT_MSECS) {
+	end_time = jiffies + msecs_to_jiffies(INIT_TIMEOUT_MSECS);
+	while (time_before(jiffies, end_time)) {
 		int x, y;
 
 		/* a read of the device helps push it into action */
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/hwmon/w83l785ts.c linux-2.6.15-rc4/drivers/hwmon/w83l785ts.c
--- linux-2.6.15-rc4-orig/drivers/hwmon/w83l785ts.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/hwmon/w83l785ts.c	2005-12-03 19:56:20.000000000 +0100
@@ -40,8 +40,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 
-/* How many retries on register read error */
-#define MAX_RETRIES	5
+#define MAX_TIMEOUT	15
 
 /*
  * Address to scan
@@ -273,12 +272,14 @@ static int w83l785ts_detach_client(struc
 
 static u8 w83l785ts_read_value(struct i2c_client *client, u8 reg, u8 defval)
 {
-	int value, i;
+	int value, i = 1;
+	unsigned long end_time;
 
 	/* Frequent read errors have been reported on Asus boards, so we
 	 * retry on read errors. If it still fails (unlikely), return the
 	 * default value requested by the caller. */
-	for (i = 1; i <= MAX_RETRIES; i++) {
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
+	while (time_before_eq(jiffies, end_time)) {
 		value = i2c_smbus_read_byte_data(client, reg);
 		if (value >= 0) {
 			dev_dbg(&client->dev, "Read 0x%02x from register "
@@ -287,6 +288,7 @@ static u8 w83l785ts_read_value(struct i2
 		}
 		dev_dbg(&client->dev, "Read failed, will retry in %d.\n", i);
 		msleep(i);
+		++i;
 	}
 
 	dev_err(&client->dev, "Couldn't read value from register 0x%02x. "
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
