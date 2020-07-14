From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 10:55:29 +0000
Subject: [PATCH] media: atomisp: Fix error code in ov5693_probe()
Message-Id: <20200714105529.GA294318@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org

If gmin_camera_platform_data() returns NULL then we should return a
negative error instead of success.

Fixes: 90ebe55ab886 ("media: staging: atomisp: Add driver prefix to Kconfig option and module names")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index 97ab10bc45ca..e698b63d6cb7 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -1899,7 +1899,7 @@ static int ov5693_probe(struct i2c_client *client)
 {
 	struct ov5693_device *dev;
 	int i2c;
-	int ret = 0;
+	int ret;
 	void *pdata;
 	unsigned int i;
 
@@ -1929,8 +1929,10 @@ static int ov5693_probe(struct i2c_client *client)
 	pdata = gmin_camera_platform_data(&dev->sd,
 					  ATOMISP_INPUT_FORMAT_RAW_10,
 					  atomisp_bayer_order_bggr);
-	if (!pdata)
+	if (!pdata) {
+		ret = -EINVAL;
 		goto out_free;
+	}
 
 	ret = ov5693_s_config(&dev->sd, client->irq, pdata);
 	if (ret)
-- 
2.27.0
