From: Nicolas Kaiser <nikai@nikai.net>
Date: Tue, 22 Nov 2005 12:13:52 +0000
Subject: [KJ] [PATCH] i2c: remove duplicate of BCD macros
Message-Id: <20051122131352.501fbabe@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77294322943088778=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77294322943088778==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Remove duplicate of BCD macros

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>

---

--- a/drivers/i2c/chips/rtc8564.c	2005-11-04 17:36:24.000000000 +0100
+++ b/drivers/i2c/chips/rtc8564.c	2005-11-22 13:08:08.000000000 +0100
@@ -14,6 +14,7 @@
  */
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/bcd.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -52,9 +53,6 @@ static inline u8 _rtc8564_ctrl2(struct i
 #define CTRL1(c) _rtc8564_ctrl1(c)
 #define CTRL2(c) _rtc8564_ctrl2(c)
 
-#define BCD_TO_BIN(val) (((val)&15) + ((val)>>4)*10)
-#define BIN_TO_BCD(val) ((((val)/10)<<4) + (val)%10)
-
 static int debug;;
 module_param(debug, int, S_IRUGO | S_IWUSR);
 
@@ -224,16 +222,16 @@ static int rtc8564_get_datetime(struct i
 		return ret;
 
 	/* century stored in minute alarm reg */
-	dt->year = BCD_TO_BIN(buf[RTC8564_REG_YEAR]);
-	dt->year += 100 * BCD_TO_BIN(buf[RTC8564_REG_AL_MIN] & 0x3f);
-	dt->mday = BCD_TO_BIN(buf[RTC8564_REG_DAY] & 0x3f);
-	dt->wday = BCD_TO_BIN(buf[RTC8564_REG_WDAY] & 7);
-	dt->mon = BCD_TO_BIN(buf[RTC8564_REG_MON_CENT] & 0x1f);
+	dt->year = BCD2BIN(buf[RTC8564_REG_YEAR]);
+	dt->year += 100 * BCD2BIN(buf[RTC8564_REG_AL_MIN] & 0x3f);
+	dt->mday = BCD2BIN(buf[RTC8564_REG_DAY] & 0x3f);
+	dt->wday = BCD2BIN(buf[RTC8564_REG_WDAY] & 7);
+	dt->mon = BCD2BIN(buf[RTC8564_REG_MON_CENT] & 0x1f);
 
-	dt->secs = BCD_TO_BIN(buf[RTC8564_REG_SEC] & 0x7f);
+	dt->secs = BCD2BIN(buf[RTC8564_REG_SEC] & 0x7f);
 	dt->vl = (buf[RTC8564_REG_SEC] & 0x80) == 0x80;
-	dt->mins = BCD_TO_BIN(buf[RTC8564_REG_MIN] & 0x7f);
-	dt->hours = BCD_TO_BIN(buf[RTC8564_REG_HR] & 0x3f);
+	dt->mins = BCD2BIN(buf[RTC8564_REG_MIN] & 0x7f);
+	dt->hours = BCD2BIN(buf[RTC8564_REG_HR] & 0x3f);
 
 	_DBGRTCTM(2, *dt);
 
@@ -255,18 +253,18 @@ rtc8564_set_datetime(struct i2c_client *
 
 	buf[RTC8564_REG_CTRL1] = CTRL1(client) | RTC8564_CTRL1_STOP;
 	buf[RTC8564_REG_CTRL2] = CTRL2(client);
-	buf[RTC8564_REG_SEC] = BIN_TO_BCD(dt->secs);
-	buf[RTC8564_REG_MIN] = BIN_TO_BCD(dt->mins);
-	buf[RTC8564_REG_HR] = BIN_TO_BCD(dt->hours);
+	buf[RTC8564_REG_SEC] = BIN2BCD(dt->secs);
+	buf[RTC8564_REG_MIN] = BIN2BCD(dt->mins);
+	buf[RTC8564_REG_HR] = BIN2BCD(dt->hours);
 
 	if (datetoo) {
 		len += 5;
-		buf[RTC8564_REG_DAY] = BIN_TO_BCD(dt->mday);
-		buf[RTC8564_REG_WDAY] = BIN_TO_BCD(dt->wday);
-		buf[RTC8564_REG_MON_CENT] = BIN_TO_BCD(dt->mon) & 0x1f;
+		buf[RTC8564_REG_DAY] = BIN2BCD(dt->mday);
+		buf[RTC8564_REG_WDAY] = BIN2BCD(dt->wday);
+		buf[RTC8564_REG_MON_CENT] = BIN2BCD(dt->mon) & 0x1f;
 		/* century stored in minute alarm reg */
-		buf[RTC8564_REG_YEAR] = BIN_TO_BCD(dt->year % 100);
-		buf[RTC8564_REG_AL_MIN] = BIN_TO_BCD(dt->year / 100);
+		buf[RTC8564_REG_YEAR] = BIN2BCD(dt->year % 100);
+		buf[RTC8564_REG_AL_MIN] = BIN2BCD(dt->year / 100);
 	}
 
 	ret = rtc8564_write(client, 0, buf, len);

--===============77294322943088778==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77294322943088778==--
