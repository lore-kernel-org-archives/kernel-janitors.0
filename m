From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:16:58 +0000
Subject: [PATCH 13/37] drivers/net/wireless/iwmc3200wifi: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152316400.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel.ortiz@intel.com>, Zhu Yi <yi.zhu@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wireless/iwmc3200wifi/rx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/net/wireless/iwmc3200wifi/rx.c b/drivers/net/wireless/iwmc3200wifi/rx.c
--- a/drivers/net/wireless/iwmc3200wifi/rx.c
+++ b/drivers/net/wireless/iwmc3200wifi/rx.c
@@ -321,14 +321,14 @@ iwm_rx_ticket_node_alloc(struct iwm_priv
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ticket_node->ticket = kzalloc(sizeof(struct iwm_rx_ticket), GFP_KERNEL);
+	ticket_node->ticket = kmemdup(ticket, sizeof(struct iwm_rx_ticket),
+				      GFP_KERNEL);
 	if (!ticket_node->ticket) {
 		IWM_ERR(iwm, "Couldn't allocate RX ticket\n");
 		kfree(ticket_node);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	memcpy(ticket_node->ticket, ticket, sizeof(struct iwm_rx_ticket));
 	INIT_LIST_HEAD(&ticket_node->node);
 
 	return ticket_node;
