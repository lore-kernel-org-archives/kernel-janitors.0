From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 07:04:12 +0000
Subject: [patch] [media] am437x-vpfe: fix an uninitialized variable bug
Message-Id: <20160315070412.GA13560@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Benoit Parrot <bparrot@ti.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

If we are doing V4L2_FIELD_NONE then "ret" is used uninitialized.

Fixes: 417d2e507edc ('[media] media: platform: add VPFE capture driver support for AM437X')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index de32e3a..7d14732 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1047,7 +1047,7 @@ static int vpfe_get_ccdc_image_format(struct vpfe_device *vpfe,
 static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 {
 	enum ccdc_frmfmt frm_fmt = CCDC_FRMFMT_INTERLACED;
-	int ret;
+	int ret = 0;
 
 	vpfe_dbg(2, vpfe, "vpfe_config_ccdc_image_format\n");
 
