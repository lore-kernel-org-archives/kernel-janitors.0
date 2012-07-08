From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 08 Jul 2012 11:37:39 +0000
Subject: [PATCH 2/7] net/rxrpc/ar-peer.c: remove invalid reference to list iterator variable
Message-Id: <1341747464-1772-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

If list_for_each_entry, etc complete a traversal of the list, the iterator
variable ends up pointing to an address at an offset from the list head,
and not a meaningful structure.  Thus this value should not be used after
the end of the iterator.  This seems to be a copy-paste bug from a previous
debugging message, and so the meaningless value is just deleted.

This problem was found using Coccinelle (http://coccinelle.lip6.fr/).

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 net/rxrpc/ar-peer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/ar-peer.c b/net/rxrpc/ar-peer.c
index 2754f09..bebaa43 100644
--- a/net/rxrpc/ar-peer.c
+++ b/net/rxrpc/ar-peer.c
@@ -229,7 +229,7 @@ found_UDP_peer:
 	return peer;
 
 new_UDP_peer:
-	_net("Rx UDP DGRAM from NEW peer %d", peer->debug_id);
+	_net("Rx UDP DGRAM from NEW peer");
 	read_unlock_bh(&rxrpc_peer_lock);
 	_leave(" = -EBUSY [new]");
 	return ERR_PTR(-EBUSY);

