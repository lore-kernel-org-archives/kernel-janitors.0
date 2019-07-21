From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 10:38:11 +0000
Subject: [PATCH] tipc: Fix a typo
Message-Id: <20190721103811.29724-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jon.maloy@ericsson.com, ying.xue@windriver.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/tipc_toprsv_listener_data_ready/tipc_topsrv_listener_data_ready/
(r and s switched in topsrv)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The function name could also be removed from the comment. It does not
bring any useful information IMHO.
---
 net/tipc/topsrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tipc/topsrv.c b/net/tipc/topsrv.c
index f345662890a6..ca8ac96d22a9 100644
--- a/net/tipc/topsrv.c
+++ b/net/tipc/topsrv.c
@@ -476,7 +476,7 @@ static void tipc_topsrv_accept(struct work_struct *work)
 	}
 }
 
-/* tipc_toprsv_listener_data_ready - interrupt callback with connection request
+/* tipc_topsrv_listener_data_ready - interrupt callback with connection request
  * The queued job is launched into tipc_topsrv_accept()
  */
 static void tipc_topsrv_listener_data_ready(struct sock *sk)
-- 
2.20.1
