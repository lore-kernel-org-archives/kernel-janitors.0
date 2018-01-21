From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Jan 2018 21:16:15 +0000
Subject: [PATCH 2/2] Input: auo-pixcir-ts: Delete an unnecessary return statement in auo_pixcir_input_close()
Message-Id: <285e8d30-2d7e-f035-f4a4-679b3d79f57b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <df18b548-f95e-e315-9e77-f379af7909e8@users.sourceforge.net>
In-Reply-To: <df18b548-f95e-e315-9e77-f379af7909e8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Jan 2018 22:06:28 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/touchscreen/auo-pixcir-ts.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
index 398e27c48a51..df8ca856393b 100644
--- a/drivers/input/touchscreen/auo-pixcir-ts.c
+++ b/drivers/input/touchscreen/auo-pixcir-ts.c
@@ -408,8 +408,6 @@ static void auo_pixcir_input_close(struct input_dev *dev)
 	struct auo_pixcir_ts *ts = input_get_drvdata(dev);
 
 	auo_pixcir_stop(ts);
-
-	return;
 }
 
 static int __maybe_unused auo_pixcir_suspend(struct device *dev)
-- 
2.16.0

