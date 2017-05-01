From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 May 2017 16:48:32 +0000
Subject: [PATCH 3/4] drm/dp: Replace six seq_printf() calls by seq_puts() in drm_dp_mst_dump_topology()
Message-Id: <73f05228-be92-c2dd-b121-52bc211f236d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
In-Reply-To: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 17:23:24 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 2ddcb3d2f65a..bcc76f15f1ce 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2837,27 +2837,27 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		bool bret;
 		int ret;
 		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
-		seq_printf(m, "dpcd: ");
+		seq_puts(m, "dpcd: ");
 		for (i = 0; i < DP_RECEIVER_CAP_SIZE; i++)
 			seq_printf(m, "%02x ", buf[i]);
 		seq_putc(m, '\n');
 		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
-		seq_printf(m, "faux/mst: ");
+		seq_puts(m, "faux/mst: ");
 		for (i = 0; i < 2; i++)
 			seq_printf(m, "%02x ", buf[i]);
 		seq_putc(m, '\n');
 		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
-		seq_printf(m, "mst ctrl: ");
+		seq_puts(m, "mst ctrl: ");
 		for (i = 0; i < 1; i++)
 			seq_printf(m, "%02x ", buf[i]);
 		seq_putc(m, '\n');
 
 		/* dump the standard OUI branch header */
 		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
-		seq_printf(m, "branch oui: ");
+		seq_puts(m, "branch oui: ");
 		for (i = 0; i < 0x3; i++)
 			seq_printf(m, "%02x", buf[i]);
-		seq_printf(m, " devid: ");
+		seq_puts(m, " devid: ");
 		for (i = 0x3; i < 0x8 && buf[i]; i++)
 			seq_printf(m, "%c", buf[i]);
 
@@ -2865,7 +2865,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 			   buf[0x9] >> 4, buf[0x9] & 0xf, buf[0xa], buf[0xb]);
 		bret = dump_dp_payload_table(mgr, buf);
 		if (bret = true) {
-			seq_printf(m, "payload table: ");
+			seq_puts(m, "payload table: ");
 			for (i = 0; i < 63; i++)
 				seq_printf(m, "%02x ", buf[i]);
 			seq_putc(m, '\n');
-- 
2.12.2

