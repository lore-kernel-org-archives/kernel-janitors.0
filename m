From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 14:17:16 +0000
Subject: [PATCH -next] drm/rcar-du: Fix return value check in rcar_du_cmm_init()
Message-Id: <20200428141716.87958-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org

In case of error, the function of_parse_phandle()/of_find_device_by_node()
returns NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test

Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 482329102f19..0da711d9b2f8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -650,10 +650,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 		int ret;
 
 		cmm = of_parse_phandle(np, "renesas,cmms", i);
-		if (IS_ERR(cmm)) {
+		if (!cmm) {
 			dev_err(rcdu->dev,
 				"Failed to parse 'renesas,cmms' property\n");
-			return PTR_ERR(cmm);
+			return -ENODEV;
 		}
 
 		if (!of_device_is_available(cmm)) {
@@ -663,10 +663,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 		}
 
 		pdev = of_find_device_by_node(cmm);
-		if (IS_ERR(pdev)) {
+		if (!pdev) {
 			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
 			of_node_put(cmm);
-			return PTR_ERR(pdev);
+			return -ENODEV;
 		}
 
 		of_node_put(cmm);
