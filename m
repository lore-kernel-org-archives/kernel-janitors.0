From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2011 20:26:00 +0000
Subject: [patch 2/2] NFC: use kfree_skb() for sk_buffs
Message-Id: <20111216202600.GB18570@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a struct sk_buff pointer and it should be freed with kfree_skb()
instead of kfree().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/nfc/llcp/llcp.c b/net/nfc/llcp/llcp.c
index f99d6b4..1d32680 100644
--- a/net/nfc/llcp/llcp.c
+++ b/net/nfc/llcp/llcp.c
@@ -954,7 +954,7 @@ void nfc_llcp_unregister_device(struct nfc_dev *dev)
 	skb_queue_purge(&local->tx_queue);
 	destroy_workqueue(local->tx_wq);
 	destroy_workqueue(local->rx_wq);
-	kfree(local->rx_pending);
+	kfree_skb(local->rx_pending);
 	kfree(local);
 }
 
