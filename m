From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Feb 2019 09:01:06 +0000
Subject: [PATCH] Input: msm: Tweak an error message
Message-Id: <20190209090106.GB4865@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The PTR_ERR(NULL) value is zero and it's not useful to print that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/misc/msm-vibrator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/misc/msm-vibrator.c b/drivers/input/misc/msm-vibrator.c
index c06941021447..69f2579c4ec2 100644
--- a/drivers/input/misc/msm-vibrator.c
+++ b/drivers/input/misc/msm-vibrator.c
@@ -199,8 +199,7 @@ static int msm_vibrator_probe(struct platform_device *pdev)
 	vibrator->base = devm_ioremap(&pdev->dev, res->start,
 				     resource_size(res));
 	if (!vibrator->base) {
-		dev_err(&pdev->dev, "Failed to iomap resource: %ld\n",
-			PTR_ERR(vibrator->base));
+		dev_err(&pdev->dev, "Failed to iomap resource.\n");
 		return -ENOMEM;
 	}
 
-- 
2.17.1
