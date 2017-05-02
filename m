From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 May 2017 18:52:55 +0000
Subject: [PATCH] bonding: Use seq_putc() in bond_info_show_master()
Message-Id: <9395231f-2ebb-dae9-4ef0-514d933fa387@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Andy Gospodarek <andy@greyhouse.net>, Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 20:48:36 +0200

A few single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/bonding/bond_procfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/bonding/bond_procfs.c b/drivers/net/bonding/bond_procfs.c
index d8d4ada034b7..bdc4db184d94 100644
--- a/drivers/net/bonding/bond_procfs.c
+++ b/drivers/net/bonding/bond_procfs.c
@@ -72,7 +72,7 @@ static void bond_info_show_master(struct seq_file *seq)
 		seq_printf(seq, " (fail_over_mac %s)", optval->string);
 	}
 
-	seq_printf(seq, "\n");
+	seq_putc(seq, '\n');
 
 	if (bond_mode_uses_xmit_hash(bond)) {
 		optval = bond_opt_get_val(BOND_OPT_XMIT_HASH,
@@ -117,11 +117,11 @@ static void bond_info_show_master(struct seq_file *seq)
 			if (!bond->params.arp_targets[i])
 				break;
 			if (printed)
-				seq_printf(seq, ",");
+				seq_putc(seq, ',');
 			seq_printf(seq, " %pI4", &bond->params.arp_targets[i]);
 			printed = 1;
 		}
-		seq_printf(seq, "\n");
+		seq_putc(seq, '\n');
 	}
 
 	if (BOND_MODE(bond) = BOND_MODE_8023AD) {
-- 
2.12.2

