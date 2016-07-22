From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Fri, 22 Jul 2016 04:33:35 +0000
Subject: [PATCH 3/3] drivers: w1: style corrections-pointers-blanklines-comparisons
Message-Id: <1469162015-10497-4-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct pointer notations to include whitespace between
variable type and "*" character. Inserted blank line
after variable declatations at two locations.
Rearranged comparison within an if statment to have the
constant on the right-hand side.

Signed-off-by: Ben Werbowyj <ben.werbowyj@gmail.com>
---
 drivers/w1/slaves/w1_therm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 83a5036..82611f1 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -66,7 +66,7 @@ struct w1_therm_family_data {
 
 /* return the address of the refcnt in the family data */
 #define THERM_REFCNT(family_data) \
-	(&((struct w1_therm_family_data*)family_data)->refcnt)
+	(&((struct w1_therm_family_data *)family_data)->refcnt)
 
 static int w1_therm_add_slave(struct w1_slave *sl)
 {
@@ -81,6 +81,7 @@ static int w1_therm_add_slave(struct w1_slave *sl)
 static void w1_therm_remove_slave(struct w1_slave *sl)
 {
 	int refcnt = atomic_sub_return(1, THERM_REFCNT(sl->family_data));
+
 	while (refcnt) {
 		msleep(1000);
 		refcnt = atomic_read(THERM_REFCNT(sl->family_data));
@@ -366,6 +367,7 @@ post_unlock:
 static inline int w1_DS18B20_convert_temp(u8 rom[9])
 {
 	s16 t = le16_to_cpup((__le16 *)rom);
+
 	return t*1000/16;
 }
 
@@ -415,7 +417,7 @@ static ssize_t w1_slave_store(struct device *device,
 	for (i = 0; i < ARRAY_SIZE(w1_therm_families); ++i) {
 		if (w1_therm_families[i].f->fid = sl->family->fid) {
 			/* zero value indicates to write current configuration to eeprom */
-			if (0 = val)
+			if (val = 0)
 				ret = w1_therm_families[i].eeprom(device);
 			else
 				ret = w1_therm_families[i].precision(device, val);
-- 
2.1.4

