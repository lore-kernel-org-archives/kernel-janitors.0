From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 09:05:46 +0000
Subject: [patch 1/2] leds: netxbig: off by one in netxbig_leds_get_of_pdata()
Message-Id: <20150409090546.GE17605@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

The mode_val[] array has NETXBIG_LED_MODE_NUM (5) elements so the ">"
here should be ">=".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 028686f2..d0b743c 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -512,7 +512,7 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 						   "mode-val", 2 * i, &mode);
 			of_property_read_u32_index(child,
 						   "mode-val", 2 * i + 1, &val);
-			if (mode > NETXBIG_LED_MODE_NUM)
+			if (mode >= NETXBIG_LED_MODE_NUM)
 				return -EINVAL;
 			mode_val[mode] = val;
 		}
