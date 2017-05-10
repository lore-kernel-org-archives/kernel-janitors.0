From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 May 2017 15:15:33 +0000
Subject: [PATCH] tinydrm: mipi-dbi: Adjust buffer output in mipi_dbi_debugfs_command_show()
Message-Id: <f385d46e-cd60-ce57-d9c5-da23ad69e262@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2795b611-dfb9-eaf6-e04d-10e27ce96772@users.sourceforge.net>
 <7a6e57ed-7d71-78bc-706e-3a6a1eea3a23@tronnes.org>
 <1494354199.20782.5.camel@perches.com>
In-Reply-To: <1494354199.20782.5.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Fengguang Wu <fengguang.wu@intel.com>, Joe Perches <joe@perches.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Thierry Reding <treding@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 May 2017 17:03:20 +0200

* Use a special format string specification for the desired output of the
  array "val" into a sequence.

* Adjust two local variables accordingly.

This refactoring supersedes the update suggestion "tinydrm: mipi-dbi:
Use seq_putc() in mipi_dbi_debugfs_command_show()" from 2017-05-08.
https://patchwork.kernel.org/patch/9716119/

Fixes: 02dd95fe316936269a52d6ccb971bb956412b40a ("drm/tinydrm: Add MIPI DBI support")

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tinydrm/mipi-dbi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tinydrm/mipi-dbi.c
index f4eb412f3604..2670259d1798 100644
--- a/drivers/gpu/drm/tinydrm/mipi-dbi.c
+++ b/drivers/gpu/drm/tinydrm/mipi-dbi.c
@@ -914,8 +914,7 @@ static int mipi_dbi_debugfs_command_show(struct seq_file *m, void *unused)
 {
 	struct mipi_dbi *mipi = m->private;
 	u8 cmd, val[4];
-	size_t len, i;
-	int ret;
+	int len, ret;
 
 	for (cmd = 0; cmd < 255; cmd++) {
 		if (!mipi_dbi_command_is_read(mipi, cmd))
@@ -944,9 +943,7 @@ static int mipi_dbi_debugfs_command_show(struct seq_file *m, void *unused)
 			continue;
 		}
 
-		for (i = 0; i < len; i++)
-			seq_printf(m, "%02x", val[i]);
-		seq_puts(m, "\n");
+		seq_printf(m, "%*phN\n", len, val);
 	}
 
 	return 0;
-- 
2.12.3

