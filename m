From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 07:56:44 +0000
Subject: [PATCH 1/3] block-aoe: Use seq_putc() in aoedisk_debugfs_show()
Message-Id: <58b532fc-14c5-6e87-75d0-d78703b289dc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <705a2cf5-90fe-ec8a-95f9-a27bccbc3f3f@users.sourceforge.net>
In-Reply-To: <705a2cf5-90fe-ec8a-95f9-a27bccbc3f3f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, "Ed L. Cashin" <ed.cashin@acm.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 08:51:28 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/aoe/aoeblk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index 027b876370bc..cfcf21ec123d 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -147,7 +147,7 @@ static int aoedisk_debugfs_show(struct seq_file *s, void *ignored)
 			seq_printf(s, "%c%s", c, ifp->nd->name);
 			c = ',';
 		}
-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 	}
 	spin_unlock_irqrestore(&d->lock, flags);
 
-- 
2.12.2

