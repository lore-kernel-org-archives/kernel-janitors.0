From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2020 17:26:15 +0000
Subject: [PATCH] media: pxa_camera: remove an impossible condition
Message-Id: <20200610172615.GD90634@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Chuhong Yuan <hslester96@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

It's not possible for "pcdev->mclk" to be zero because we check for
that earlier and set it to 20000000 in that situation.  If it were
possible, that would be a problem because it could have lead to an Oops
in the error handling when we call v4l2_clk_unregister(pcdev->mclk_clk);

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/pxa_camera.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 3c5fe737d36f7..8e5613c1fe067 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2504,17 +2504,14 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	if (err)
 		goto exit_notifier_cleanup;
 
-	if (pcdev->mclk) {
-		v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
-				  pcdev->asd.match.i2c.adapter_id,
-				  pcdev->asd.match.i2c.address);
-
-		pcdev->mclk_clk = v4l2_clk_register(&pxa_camera_mclk_ops,
-						    clk_name, NULL);
-		if (IS_ERR(pcdev->mclk_clk)) {
-			err = PTR_ERR(pcdev->mclk_clk);
-			goto exit_notifier_cleanup;
-		}
+	v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
+			  pcdev->asd.match.i2c.adapter_id,
+			  pcdev->asd.match.i2c.address);
+
+	pcdev->mclk_clk = v4l2_clk_register(&pxa_camera_mclk_ops, clk_name, NULL);
+	if (IS_ERR(pcdev->mclk_clk)) {
+		err = PTR_ERR(pcdev->mclk_clk);
+		goto exit_notifier_cleanup;
 	}
 
 	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev->notifier);
-- 
2.26.2
