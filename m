From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Aug 2014 11:20:31 +0000
Subject: [PATCH 9/9] rtc: use c99 initializers in structures
Message-Id: <1408792831-25615-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408792831-25615-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1408792831-25615-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: josh@joshtriplett.org, kernel-janitors@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use c99 initializers for structures.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@decl@
identifier i1,fld;
type T;
field list[n] fs;
@@

struct i1 {
 fs
 T fld;
 ...};

@bad@
identifier decl.i1,i2;
expression e;
initializer list[decl.n] is;
@@

struct i1 i2 = { is,
+ .fld = e
- e
 ,...};
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series do not depend on each other.

 drivers/rtc/rtc-pcf8583.c |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c
index c263984..5911a6d 100644
--- a/drivers/rtc/rtc-pcf8583.c
+++ b/drivers/rtc/rtc-pcf8583.c
@@ -176,7 +176,11 @@ static int pcf8583_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	unsigned char ctrl, year[2];
-	struct rtc_mem mem = { CMOS_YEAR, sizeof(year), year };
+	struct rtc_mem mem = {
+		.loc = CMOS_YEAR,
+		.nr = sizeof(year),
+		.data = year
+	};
 	int real_year, year_offset, err;
 
 	/*
@@ -222,8 +226,16 @@ static int pcf8583_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	unsigned char year[2], chk;
-	struct rtc_mem cmos_year  = { CMOS_YEAR, sizeof(year), year };
-	struct rtc_mem cmos_check = { CMOS_CHECKSUM, 1, &chk };
+	struct rtc_mem cmos_year  = {
+		.loc = CMOS_YEAR,
+		.nr = sizeof(year),
+		.data = year
+	};
+	struct rtc_mem cmos_check = {
+		.loc = CMOS_CHECKSUM,
+		.nr = 1,
+		.data = &chk
+	};
 	unsigned int proper_year = tm->tm_year + 1900;
 	int ret;
 

