From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Nov 2019 17:35:09 +0000
Subject: [PATCH][next] drm/dp_mst: fix multiple frees of tx->bytes
Message-Id: <20191120173509.347490-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently tx->bytes is being freed r->num_transactions number of
times because tx is not being set correctly. Fix this by setting
tx to &r->transactions[i] so that the correct objects are being
freed on each loop iteration.

Addresses-Coverity: ("Double free")
Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing + selftests")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ae5809a1f19a..2754e7e075e7 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -517,8 +517,10 @@ drm_dp_decode_sideband_req(const struct drm_dp_sideband_msg_tx *raw,
 			}
 
 			if (failed) {
-				for (i = 0; i < r->num_transactions; i++)
+				for (i = 0; i < r->num_transactions; i++) {
+					tx = &r->transactions[i];
 					kfree(tx->bytes);
+				}
 				return -ENOMEM;
 			}
 
-- 
2.24.0
