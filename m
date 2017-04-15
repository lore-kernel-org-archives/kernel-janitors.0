From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 15 Apr 2017 19:21:42 +0000
Subject: [PATCH] drm: atmel-hlcdc: Uninitialized return in atmel_hlcdc_create_outputs()
Message-Id: <20170415192142.GA6416@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

It's not possible for endpoint to be zero so the test doesn't work.  If
we break on the first iteration through the loop then endpoint is 1 and
"ret" is uninitialized.

Fixes: ebc944613567 ("drm: convert drivers to use drm_of_find_panel_or_bridge")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index f987b4572d4a..65a3bd7a0c00 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -221,7 +221,8 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
 int atmel_hlcdc_create_outputs(struct drm_device *dev)
 {
 	struct device_node *remote;
-	int ret, endpoint = 0;
+	int ret = -ENODEV;
+	int endpoint = 0;
 
 	while (true) {
 		/* Loop thru possible multiple connections to the output */
@@ -236,7 +237,5 @@ int atmel_hlcdc_create_outputs(struct drm_device *dev)
 			return ret;
 	}
 
-	if (!endpoint)
-		return -ENODEV;
 	return ret;
 }
