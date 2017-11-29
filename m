From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Nov 2017 19:17:50 +0000
Subject: [PATCH] of: overlay: fix memory leak of ovcs on error exit path
Message-Id: <20171129191750.25254-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the call to of_resolve_phandles fails then then ovcs
is not kfree'd on the error exit path.  Rather than try and make
the clean up exit path more convoluted, fix this by just kfree'ing
ovcs at the point of error detection and exit via the same exit
path.

Detected by CoverityScan, CID#1462296 ("Resource Leak")

Fixes: f948d6d8b792 ("of: overlay: avoid race condition between applying multiple overlays")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/of/overlay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 53bc9e3f0b98..6c8efe7d8cbb 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -708,8 +708,10 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 	of_overlay_mutex_lock();
 
 	ret = of_resolve_phandles(tree);
-	if (ret)
+	if (ret) {
+		kfree(ovcs);
 		goto err_overlay_unlock;
+	}
 
 	mutex_lock(&of_mutex);
 
-- 
2.14.1

