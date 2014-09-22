From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Sep 2014 08:00:08 +0000
Subject: [patch] [media] davinci: remove an unneeded check
Message-Id: <20140922080008.GB12362@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, kernel-janitors@vger.kernel.org

We don't need to check "ret", we know it's zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index c557eb5..3eb6e4b 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -442,11 +442,10 @@ static int vpfe_config_image_format(struct vpfe_device *vpfe_dev,
 		return ret;
 
 	/* Update the values of sizeimage and bytesperline */
-	if (!ret) {
-		pix->bytesperline = ccdc_dev->hw_ops.get_line_length();
-		pix->sizeimage = pix->bytesperline * pix->height;
-	}
-	return ret;
+	pix->bytesperline = ccdc_dev->hw_ops.get_line_length();
+	pix->sizeimage = pix->bytesperline * pix->height;
+
+	return 0;
 }
 
 static int vpfe_initialize_device(struct vpfe_device *vpfe_dev)
