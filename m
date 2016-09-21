From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:49:52 +0000
Subject: [PATCH 08/14] GPU-DRM-OMAP: Rename a jump label in dmm_txn_commit()
Message-Id: <7d47650b-b911-8225-c9ec-a08112073a31@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
In-Reply-To: <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 17:32:42 +0200

Adjust a jump target so that redundant checks can be avoided at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 5f6f21b..c8ced158 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -269,7 +269,7 @@ static int dmm_txn_commit(struct dmm_txn *txn, bool wait)
 	if (!txn->last_pat) {
 		dev_err(engine->dmm->dev, "need at least one txn\n");
 		ret = -EINVAL;
-		goto cleanup;
+		goto release_engine;
 	}
 
 	txn->last_pat->next_pa = 0;
@@ -281,7 +281,7 @@ static int dmm_txn_commit(struct dmm_txn *txn, bool wait)
 	ret = wait_status(engine, DMM_PATSTATUS_READY);
 	if (ret) {
 		ret = -EFAULT;
-		goto cleanup;
+		goto release_engine;
 	}
 
 	/* mark whether it is async to denote list management in IRQ handler */
@@ -301,9 +301,9 @@ static int dmm_txn_commit(struct dmm_txn *txn, bool wait)
 		}
 	}
 
-cleanup:
 	/* only place engine back on list if we are done with it */
 	if (ret || wait)
+ release_engine:
 		release_engine(engine);
 
 	return ret;
-- 
2.10.0

