From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Jun 2020 10:34:01 +0000
Subject: [PATCH] drm/vc4: call ->post_disable() functions in vc4_dsi_encoder_disable()
Message-Id: <20200626103401.GA314359@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: David Airlie <airlied@linux.ie>, Andrzej Hajda <a.hajda@samsung.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The problem is that the iterator is already at the list head so the
list_for_each_entry_from() loop is a no-op and we don't call the
the iter->funcs->post_disable() functions.  This should be
list_for_each_entry() instead.

Fixes: 033bfe7538a1 ("drm/vc4: dsi: Fix bridge chain handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index eaf276978ee7..f92d0e92fa72 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -754,7 +754,7 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 
 	vc4_dsi_ulps(dsi, true);
 
-	list_for_each_entry_from(iter, &dsi->bridge_chain, chain_node) {
+	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->post_disable)
 			iter->funcs->post_disable(iter);
 	}
-- 
2.27.0
