From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2018 09:09:10 +0000
Subject: [PATCH v2] mfd: tps65911-comparator: Fix an off by one bug
Message-Id: <20180420090910.GA26071@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180420083909.66a6t63s5q6vpwp7@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The COMP1 and COMP2 elements are in 0 and 1 respectively so this code is
accessing the wrong elements and one space beyond the end of the array.
We should be using "id - 1" instead.

The "id" variable is never COMP (0) so that code can be removed.

Fixes: 6851ad3ab346 ("TPS65911: Comparator: Add comparator driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: we can fix the bug and save memory.

diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index c0789f81a1c5..887409c3938d 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -22,7 +22,6 @@
 #include <linux/gpio.h>
 #include <linux/mfd/tps65910.h>
 
-#define COMP					0
 #define COMP1					1
 #define COMP2					2
 
@@ -58,14 +57,11 @@ static struct comparator tps_comparators[] = {
 
 static int comp_threshold_set(struct tps65910 *tps65910, int id, int voltage)
 {
-	struct comparator tps_comp = tps_comparators[id];
+	struct comparator tps_comp = tps_comparators[id - 1];
 	int curr_voltage = 0;
 	int ret;
 	u8 index = 0, val;
 
-	if (id = COMP)
-		return 0;
-
 	while (curr_voltage < tps_comp.uV_max) {
 		curr_voltage = tps_comp.vsel_table[index];
 		if (curr_voltage >= voltage)
@@ -85,13 +81,10 @@ static int comp_threshold_set(struct tps65910 *tps65910, int id, int voltage)
 
 static int comp_threshold_get(struct tps65910 *tps65910, int id)
 {
-	struct comparator tps_comp = tps_comparators[id];
+	struct comparator tps_comp = tps_comparators[id - 1];
 	int ret;
 	u8 val;
 
-	if (id = COMP)
-		return 0;
-
 	ret = tps65910->read(tps65910, tps_comp.reg, 1, &val);
 	if (ret < 0)
 		return ret;
