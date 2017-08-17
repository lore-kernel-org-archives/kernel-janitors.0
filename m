From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Aug 2017 10:37:52 +0000
Subject: [PATCH] drm/nouveau: remove redundant null check on array mstm->msto
Message-Id: <20170817103752.16440-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check to see if mstm->msto is null is redundant because it is
an array and hence can never be null.  Remove the redundant check.

Detected by CoverityScan, CID#1375915 ("Array compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nv50_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index f7b4326a4641..51e9081b95a0 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -3141,7 +3141,7 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
 	mstc->connector.funcs->reset(&mstc->connector);
 	nouveau_conn_attach_properties(&mstc->connector);
 
-	for (i = 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto; i++)
+	for (i = 0; i < ARRAY_SIZE(mstm->msto); i++)
 		drm_mode_connector_attach_encoder(&mstc->connector, &mstm->msto[i]->encoder);
 
 	drm_object_attach_property(&mstc->connector.base, dev->mode_config.path_property, 0);
-- 
2.11.0

