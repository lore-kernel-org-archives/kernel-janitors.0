From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 May 2017 16:46:15 +0000
Subject: [PATCH 1/4] drm/dp: Use seq_putc() in drm_dp_mst_dump_topology()
Message-Id: <da81ee94-9bbc-1754-b92f-40bcdbe923fa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
In-Reply-To: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 17:08:56 +0200

A few single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index d3fc7e4e85b7..89fc05fa6a74 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2840,17 +2840,17 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		seq_printf(m, "dpcd: ");
 		for (i = 0; i < DP_RECEIVER_CAP_SIZE; i++)
 			seq_printf(m, "%02x ", buf[i]);
-		seq_printf(m, "\n");
+		seq_putc(m, '\n');
 		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
 		seq_printf(m, "faux/mst: ");
 		for (i = 0; i < 2; i++)
 			seq_printf(m, "%02x ", buf[i]);
-		seq_printf(m, "\n");
+		seq_putc(m, '\n');
 		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
 		seq_printf(m, "mst ctrl: ");
 		for (i = 0; i < 1; i++)
 			seq_printf(m, "%02x ", buf[i]);
-		seq_printf(m, "\n");
+		seq_putc(m, '\n');
 
 		/* dump the standard OUI branch header */
 		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
@@ -2868,7 +2868,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 			seq_printf(m, "payload table: ");
 			for (i = 0; i < 63; i++)
 				seq_printf(m, "%02x ", buf[i]);
-			seq_printf(m, "\n");
+			seq_putc(m, '\n');
 		}
 
 	}
-- 
2.12.2

