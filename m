From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 14:51:10 +0000
Subject: [PATCH 13/34] [media] DaVinci-VPFE-Capture: Use kmalloc_array() in vpfe_probe()
Message-Id: <19376d4d-c7a9-1387-d054-bd1f5ae541e0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 10:20:02 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpfe_capture.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 6efb2f1..5c1b8cf 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -1940,8 +1940,9 @@ static int vpfe_probe(struct platform_device *pdev)
 	video_set_drvdata(&vpfe_dev->video_dev, vpfe_dev);
 	i2c_adap = i2c_get_adapter(vpfe_cfg->i2c_adapter_id);
 	num_subdevs = vpfe_cfg->num_subdevs;
-	vpfe_dev->sd = kmalloc(sizeof(struct v4l2_subdev *) * num_subdevs,
-				GFP_KERNEL);
+	vpfe_dev->sd = kmalloc_array(num_subdevs,
+				     sizeof(*vpfe_dev->sd),
+				     GFP_KERNEL);
 	if (NULL = vpfe_dev->sd) {
 		v4l2_err(&vpfe_dev->v4l2_dev,
 			"unable to allocate memory for subdevice pointers\n");
-- 
2.10.1

