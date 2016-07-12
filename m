From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jul 2016 14:14:05 +0000
Subject: [patch] rxrpc: checking for IS_ERR() instead of NULL
Message-Id: <20160712141405.GA21045@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The rxrpc_lookup_peer() function returns NULL on error, it never returns
error pointers.

Fixes: 8496af50eb38 ('rxrpc: Use RCU to access a peer's service connection tree')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't think this has been merged with net-next so I didn't CC David or
netdev.  Feel free to fold this into the original commit.

diff --git a/net/rxrpc/conn_service.c b/net/rxrpc/conn_service.c
index 7cbd612..fd9027c 100644
--- a/net/rxrpc/conn_service.c
+++ b/net/rxrpc/conn_service.c
@@ -163,7 +163,7 @@ struct rxrpc_connection *rxrpc_incoming_connection(struct rxrpc_local *local,
 
 	if (!peer) {
 		peer = rxrpc_lookup_peer(local, srx, GFP_NOIO);
-		if (IS_ERR(peer))
+		if (!peer)
 			goto enomem;
 	}
 
