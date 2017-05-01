From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 May 2017 16:47:21 +0000
Subject: [PATCH 2/4] drm/dp: Combine two seq_printf() calls into one call in drm_dp_mst_dump_topology()
Message-Id: <0632f7bd-e58c-0b7d-163d-7e1a6e97ff25@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
In-Reply-To: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 17:15:43 +0200

Some data were put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 89fc05fa6a74..2ddcb3d2f65a 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2861,8 +2861,8 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		for (i = 0x3; i < 0x8 && buf[i]; i++)
 			seq_printf(m, "%c", buf[i]);
 
-		seq_printf(m, " revision: hw: %x.%x sw: %x.%x", buf[0x9] >> 4, buf[0x9] & 0xf, buf[0xa], buf[0xb]);
-		seq_printf(m, "\n");
+		seq_printf(m, " revision: hw: %x.%x sw: %x.%x\n",
+			   buf[0x9] >> 4, buf[0x9] & 0xf, buf[0xa], buf[0xb]);
 		bret = dump_dp_payload_table(mgr, buf);
 		if (bret = true) {
 			seq_printf(m, "payload table: ");
-- 
2.12.2

