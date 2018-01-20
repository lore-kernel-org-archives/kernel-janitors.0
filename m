From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 20:59:16 +0000
Subject: [PATCH 1/2] Input: tps6507x-ts: Delete an error message for a failed memory allocation in tps6507x_t
Message-Id: <a0661b85-bdc8-baed-c3a6-adaa383ea30d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1ee278a0-a855-cfb3-fd04-24034ec42a65@users.sourceforge.net>
In-Reply-To: <1ee278a0-a855-cfb3-fd04-24034ec42a65@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Yegor Yefremov <yegorslists@googlemail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 21:43:54 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/touchscreen/tps6507x-ts.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/tps6507x-ts.c b/drivers/input/touchscreen/tps6507x-ts.c
index 75170a7439b1..5b2756ec1766 100644
--- a/drivers/input/touchscreen/tps6507x-ts.c
+++ b/drivers/input/touchscreen/tps6507x-ts.c
@@ -227,10 +227,8 @@ static int tps6507x_ts_probe(struct platform_device *pdev)
 	init_data = tps_board->tps6507x_ts_init_data;
 
 	tsc = devm_kzalloc(&pdev->dev, sizeof(struct tps6507x_ts), GFP_KERNEL);
-	if (!tsc) {
-		dev_err(tps6507x_dev->dev, "failed to allocate driver data\n");
+	if (!tsc)
 		return -ENOMEM;
-	}
 
 	tsc->mfd = tps6507x_dev;
 	tsc->dev = tps6507x_dev->dev;
-- 
2.15.1

