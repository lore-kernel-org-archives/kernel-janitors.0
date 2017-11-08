From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Nov 2017 21:34:16 +0000
Subject: [PATCH 1/2] tipc: Use common error handling code in tipc_server_start()
Message-Id: <30323180-d194-1af1-892f-58fef0a7b6db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <25790616-164d-fe3e-bda4-3155299a8171@users.sourceforge.net>
In-Reply-To: <25790616-164d-fe3e-bda4-3155299a8171@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jon Maloy <jon.maloy@ericsson.com>, Ying Xue <ying.xue@windriver.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Nov 2017 22:18:35 +0100

* Improve jump targets so that a bit of exception handling can be better
  reused at the end of this function.

* Adjust two condition checks.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/tipc/server.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/net/tipc/server.c b/net/tipc/server.c
index acaef80fb88c..7359d37e39cd 100644
--- a/net/tipc/server.c
+++ b/net/tipc/server.c
@@ -670,16 +670,19 @@ int tipc_server_start(struct tipc_server *s)
 		return -ENOMEM;
 
 	ret = tipc_work_start(s);
-	if (ret < 0) {
-		kmem_cache_destroy(s->rcvbuf_cache);
-		return ret;
-	}
+	if (ret)
+		goto destroy_cache;
+
 	ret = tipc_open_listening_sock(s);
-	if (ret < 0) {
-		tipc_work_stop(s);
-		kmem_cache_destroy(s->rcvbuf_cache);
-		return ret;
-	}
+	if (ret)
+		goto stop_work;
+
+	return 0;
+
+stop_work:
+	tipc_work_stop(s);
+destroy_cache:
+	kmem_cache_destroy(s->rcvbuf_cache);
 	return ret;
 }
 
-- 
2.15.0

