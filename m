From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 16:15:36 +0000
Subject: [PATCH 2/2] batman-adv: Combine two seq_puts() calls into one call in batadv_nc_nodes_seq_print_text
Message-Id: <0813673a-a824-5fd7-7388-65d3af475002@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <512d2e7c-0967-9303-2b68-6c9ef53d6ed2@users.sourceforge.net>
In-Reply-To: <512d2e7c-0967-9303-2b68-6c9ef53d6ed2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: b.a.t.m.a.n@lists.open-mesh.org, netdev@vger.kernel.org, Antonio Quartulli <a@unstable.cc>, "David S. Miller" <davem@davemloft.net>, Marek Lindner <mareklindner@neomailbox.ch>, Simon Wunderlich <sw@simonwunderlich.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 17:57:36 +0200

A bit of text was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/batman-adv/network-coding.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/batman-adv/network-coding.c b/net/batman-adv/network-coding.c
index e1f6fc72fe3e..3604d7899e2c 100644
--- a/net/batman-adv/network-coding.c
+++ b/net/batman-adv/network-coding.c
@@ -1935,9 +1935,7 @@ int batadv_nc_nodes_seq_print_text(struct seq_file *seq, void *offset)
 						list)
 				seq_printf(seq, "%pM ",
 					   nc_node->addr);
-			seq_puts(seq, "\n");
-
-			seq_puts(seq, " Outgoing: ");
+			seq_puts(seq, "\n Outgoing: ");
 			/* For out_nc_node to this orig_node */
 			list_for_each_entry_rcu(nc_node,
 						&orig_node->out_coding_list,
-- 
2.12.2

