From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 19:51:36 +0000
Subject: [PATCH] Input: da9055_onkey: Delete an error message for a failed memory allocation in da9055_onkey_
Message-Id: <5bf10e75-db2a-086b-a1b2-8fcbd7aabbdd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, support.opensource@diasemi.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 20:47:03 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/misc/da9055_onkey.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/misc/da9055_onkey.c b/drivers/input/misc/da9055_onkey.c
index 3251a9693f45..eabddb226998 100644
--- a/drivers/input/misc/da9055_onkey.c
+++ b/drivers/input/misc/da9055_onkey.c
@@ -87,10 +87,8 @@ static int da9055_onkey_probe(struct platform_device *pdev)
 	}
 
 	onkey = devm_kzalloc(&pdev->dev, sizeof(*onkey), GFP_KERNEL);
-	if (!onkey) {
-		dev_err(&pdev->dev, "Failed to allocate memory\n");
+	if (!onkey)
 		return -ENOMEM;
-	}
 
 	input_dev = input_allocate_device();
 	if (!input_dev) {
-- 
2.16.1

