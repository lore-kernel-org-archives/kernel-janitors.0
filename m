From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 16:01:21 +0000
Subject: [PATCH 1/2] drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
Message-Id: <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
In-Reply-To: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 17:16:09 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 566d1a948c8f..d2c80cc9f8ee 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -377,10 +377,8 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 		int ret;
 
 		ret = of_graph_parse_endpoint(ep_node, &ep);
-		if (ret < 0) {
-			of_node_put(ep_node);
-			return ret;
-		}
+		if (ret < 0)
+			goto put_node;
 
 		/* Find the output route corresponding to the port number. */
 		for (i = 0; i < RCAR_DU_OUTPUT_MAX; ++i) {
@@ -401,10 +399,8 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 		/* Process the output pipeline. */
 		ret = rcar_du_encoders_init_one(rcdu, output, &ep);
 		if (ret < 0) {
-			if (ret = -EPROBE_DEFER) {
-				of_node_put(ep_node);
-				return ret;
-			}
+			if (ret = -EPROBE_DEFER)
+				goto put_node;
 
 			continue;
 		}
@@ -413,6 +409,10 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 	}
 
 	return num_encoders;
+
+put_node:
+	of_node_put(ep_node);
+	return ret;
 }
 
 static int rcar_du_properties_init(struct rcar_du_device *rcdu)
-- 
2.14.3

