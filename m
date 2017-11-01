From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 01 Nov 2017 15:39:54 +0000
Subject: [PATCH v2 1/2] drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
Message-Id: <56554dfd-6990-e104-ea70-e457f250fe5d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201710262044.165nsaJp%fengguang.wu@intel.com>
 <26b811dd-9dfa-cfd3-7d4d-e7f1c852b8ed@users.sourceforge.net>
In-Reply-To: <26b811dd-9dfa-cfd3-7d4d-e7f1c852b8ed@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kbuild test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kbuild-all@01.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 15:57:31 +0100

* Add a jump target so that a bit of exception handling can be better
  reused at the end of this function.

* Increase the scope for the variable "ret".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
The declaration for the variable "ret" was moved out of a loop.

 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 566d1a948c8f..b6b341164aab 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -365,6 +365,7 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 	struct device_node *np = rcdu->dev->of_node;
 	struct device_node *ep_node;
 	unsigned int num_encoders = 0;
+	int ret;
 
 	/*
 	 * Iterate over the endpoints and create one encoder for each output
@@ -374,13 +375,10 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 		enum rcar_du_output output;
 		struct of_endpoint ep;
 		unsigned int i;
-		int ret;
 
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

