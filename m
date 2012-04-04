From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Apr 2012 11:22:40 +0000
Subject: [patch] leds: lm3556: fix fallout from checkpatch fixes
Message-Id: <20120404112240.GC23719@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Purdie <rpurdie@rpsys.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Patch 476b78f277 "leds-add-led-driver-for-lm3556-chip-checkpatch-fixes"
introduces a bug where we use "after" without initializing it.

In the original code, "count" and "after" were used to tell if
simple_strtoul() found a valid number.  Now that we've changed it to
kstrtoul(), we can just get rid of both variables.  It makes the whole
function simpler.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/leds/leds-lm3556.c b/drivers/leds/leds-lm3556.c
index 64e751c..886a5d3 100644
--- a/drivers/leds/leds-lm3556.c
+++ b/drivers/leds/leds-lm3556.c
@@ -316,31 +316,23 @@ static ssize_t lm3556_indicator_pattern_store(struct device *dev,
 					      struct device_attribute *devAttr,
 					      const char *buf, size_t size)
 {
-	char *after;
-	ssize_t ret;
 	struct i2c_client *client = container_of(dev->parent,
 						 struct i2c_client, dev);
 	unsigned long state;
-	size_t count = after - buf;
+	int ret;
 
 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
 		goto out;
-	if (isspace(*after))
-		count++;
-
-	if (count = size) {
-		ret = count;
-
-		if (state > INDIC_PATTERN_SIZE - 1)
-			state = INDIC_PATTERN_SIZE - 1;
-		lm3556_write_reg(client, REG_INDIC_BLINK,
-				 indicator_pattern[state].blinking);
-		lm3556_write_reg(client, REG_INDIC_PERIOD,
-				 indicator_pattern[state].period_cnt);
-	}
+
+	if (state > INDIC_PATTERN_SIZE - 1)
+		state = INDIC_PATTERN_SIZE - 1;
+	lm3556_write_reg(client, REG_INDIC_BLINK,
+			 indicator_pattern[state].blinking);
+	lm3556_write_reg(client, REG_INDIC_PERIOD,
+			 indicator_pattern[state].period_cnt);
 out:
-	return ret;
+	return size;
 }
 
 static DEVICE_ATTR(pattern, 0644, NULL, lm3556_indicator_pattern_store);
