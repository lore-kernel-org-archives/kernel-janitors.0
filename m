From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Aug 2013 12:42:50 +0000
Subject: [patch] drm/omap: tiler: clear buffer properly
Message-Id: <20130822124250.GA2543@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@ti.com>, Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We're taking the sizeof() the wrong thing so it doesn't clear the whole
buffer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I can't compile this.

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 9b794c9..acf6678 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -871,7 +871,7 @@ int tiler_map_show(struct seq_file *s, void *arg)
 		goto error;
 
 	for (lut_idx = 0; lut_idx < omap_dmm->num_lut; lut_idx++) {
-		memset(map, 0, sizeof(h_adj * sizeof(*map)));
+		memset(map, 0, h_adj * sizeof(*map));
 		memset(global_map, ' ', (w_adj + 1) * h_adj);
 
 		for (i = 0; i < omap_dmm->container_height; i++) {
