From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Fri, 22 Jul 2016 04:33:33 +0000
Subject: [PATCH 1/3] drivers: w1: style corrections for parenthesis and braces
Message-Id: <1469162015-10497-2-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Inserted whitespace between command and open parenthesis
at two locations. Removed new line between open brace and
command/declaration at two locations.

Signed-off-by: Ben Werbowyj <ben.werbowyj@gmail.com>
---
 drivers/w1/slaves/w1_therm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 581a300..efe9d215 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -81,7 +81,7 @@ static int w1_therm_add_slave(struct w1_slave *sl)
 static void w1_therm_remove_slave(struct w1_slave *sl)
 {
 	int refcnt = atomic_sub_return(1, THERM_REFCNT(sl->family_data));
-	while(refcnt) {
+	while (refcnt) {
 		msleep(1000);
 		refcnt = atomic_read(THERM_REFCNT(sl->family_data));
 	}
@@ -151,8 +151,7 @@ static struct w1_family w1_therm_family_DS1825 = {
 	.fops = &w1_therm_fops,
 };
 
-struct w1_therm_family_converter
-{
+struct w1_therm_family_converter {
 	u8			broken;
 	u16			reserved;
 	struct w1_family	*f;
@@ -293,7 +292,7 @@ static inline int w1_DS18B20_precision(struct device *device, int val)
 	uint8_t precision_bits;
 	uint8_t mask = 0x60;
 
-	if(val > 12 || val < 9) {
+	if (val > 12 || val < 9) {
 		pr_warn("Unsupported precision\n");
 		return -1;
 	}
@@ -439,8 +438,7 @@ static ssize_t w1_slave_show(struct device *device,
 	if (ret != 0)
 		goto post_unlock;
 
-	if(!sl->family_data)
-	{
+	if (!sl->family_data) {
 		ret = -ENODEV;
 		goto pre_unlock;
 	}
-- 
2.1.4

