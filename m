From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Feb 2020 14:51:53 +0000
Subject: [PATCH net-next] net: qrtr: Fix error pointer vs NULL bugs
Message-Id: <20200226145153.a7u2jzhseaipas54@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The callers only expect NULL pointers, so returning an error pointer
will lead to an Oops.

Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/qrtr/ns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 67a4e59cdf4d..20463cd26e39 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -76,7 +76,7 @@ static struct qrtr_node *node_get(unsigned int node_id)
 	/* If node didn't exist, allocate and insert it to the tree */
 	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	node->id = node_id;
 
@@ -224,7 +224,7 @@ static struct qrtr_server *server_add(unsigned int service,
 
 	srv = kzalloc(sizeof(*srv), GFP_KERNEL);
 	if (!srv)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	srv->service = service;
 	srv->instance = instance;
-- 
2.11.0
