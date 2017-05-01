From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 May 2017 16:49:36 +0000
Subject: [PATCH 4/4] drm/dp: Adjust four checks for null pointers
Message-Id: <311ce726-9941-9040-1368-cdd556f41e73@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
In-Reply-To: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 18:22:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index bcc76f15f1ce..f46bf5101d14 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1405,13 +1405,12 @@ static int set_hdr_from_dst_qlock(struct drm_dp_sideband_msg_hdr *hdr,
 			DRM_DEBUG_KMS("%s: failed to find slot\n", __func__);
 			return -EAGAIN;
 		}
-		if (mstb->tx_slots[0] = NULL && mstb->tx_slots[1] = NULL) {
+		if (!mstb->tx_slots[0] && !mstb->tx_slots[1]) {
 			txmsg->seqno = mstb->last_seqno;
 			mstb->last_seqno ^= 1;
-		} else if (mstb->tx_slots[0] = NULL)
-			txmsg->seqno = 0;
-		else
-			txmsg->seqno = 1;
+		} else {
+			txmsg->seqno = mstb->tx_slots[0] ? 1 : 0;
+		}
 		mstb->tx_slots[txmsg->seqno] = txmsg;
 	}
 
@@ -2044,7 +2043,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 
 		/* add initial branch device at LCT 1 */
 		mstb = drm_dp_add_mst_branch_device(1, NULL);
-		if (mstb = NULL) {
+		if (!mstb) {
 			ret = -ENOMEM;
 			goto out_unlock;
 		}
-- 
2.12.2

