From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 09:32:37 +0000
Subject: [PATCH] media: vicodec: Fix error codes in probe function
Message-Id: <20200407093237.GN68494@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dafna Hirschfeld <dafna3@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

If these functions fail then we return success, but we should instead
preserve negative error code and return that.

Fixes: fde649b418d1 ("media: vicodec: Register another node for stateless decoder")
Fixes: c022a4a95722 ("media: vicodec: add struct for encoder/decoder instance")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/vicodec/vicodec-core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 30ced1c21387..e879290727ef 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -2114,16 +2114,19 @@ static int vicodec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dev);
 
-	if (register_instance(dev, &dev->stateful_enc,
-			      "stateful-encoder", true))
+	ret = register_instance(dev, &dev->stateful_enc, "stateful-encoder",
+				true);
+	if (ret)
 		goto unreg_dev;
 
-	if (register_instance(dev, &dev->stateful_dec,
-			      "stateful-decoder", false))
+	ret = register_instance(dev, &dev->stateful_dec, "stateful-decoder",
+				false);
+	if (ret)
 		goto unreg_sf_enc;
 
-	if (register_instance(dev, &dev->stateless_dec,
-			      "stateless-decoder", false))
+	ret = register_instance(dev, &dev->stateless_dec, "stateless-decoder",
+				false);
+	if (ret)
 		goto unreg_sf_dec;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
-- 
2.25.1
