From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Nov 2017 21:35:31 +0000
Subject: [PATCH 2/2] tipc: Improve a size determination in two functions
Message-Id: <af489a34-178f-a020-0b09-89f32fa12204@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <25790616-164d-fe3e-bda4-3155299a8171@users.sourceforge.net>
In-Reply-To: <25790616-164d-fe3e-bda4-3155299a8171@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jon Maloy <jon.maloy@ericsson.com>, Ying Xue <ying.xue@windriver.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Nov 2017 22:23:07 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/tipc/server.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/tipc/server.c b/net/tipc/server.c
index 7359d37e39cd..5d001b6acbe5 100644
--- a/net/tipc/server.c
+++ b/net/tipc/server.c
@@ -219,7 +219,7 @@ static struct tipc_conn *tipc_alloc_conn(struct tipc_server *s)
 	struct tipc_conn *con;
 	int ret;
 
-	con = kzalloc(sizeof(struct tipc_conn), GFP_ATOMIC);
+	con = kzalloc(sizeof(*con), GFP_ATOMIC);
 	if (!con)
 		return ERR_PTR(-ENOMEM);
 
@@ -410,7 +410,7 @@ static struct outqueue_entry *tipc_alloc_entry(void *data, int len)
 	struct outqueue_entry *entry;
 	void *buf;
 
-	entry = kmalloc(sizeof(struct outqueue_entry), GFP_ATOMIC);
+	entry = kmalloc(sizeof(*entry), GFP_ATOMIC);
 	if (!entry)
 		return NULL;
 
-- 
2.15.0

