From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 11:54:36 +0000
Subject: [PATCH] tinydrm: mipi-dbi: Use seq_putc() in mipi_dbi_debugfs_command_show()
Message-Id: <2795b611-dfb9-eaf6-e04d-10e27ce96772@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Fengguang Wu <fengguang.wu@intel.com>, Thierry Reding <treding@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 13:42:03 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tinydrm/mipi-dbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tinydrm/mipi-dbi.c
index f4eb412f3604..54d66b732d55 100644
--- a/drivers/gpu/drm/tinydrm/mipi-dbi.c
+++ b/drivers/gpu/drm/tinydrm/mipi-dbi.c
@@ -946,7 +946,7 @@ static int mipi_dbi_debugfs_command_show(struct seq_file *m, void *unused)
 
 		for (i = 0; i < len; i++)
 			seq_printf(m, "%02x", val[i]);
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	}
 
 	return 0;
-- 
2.12.2

