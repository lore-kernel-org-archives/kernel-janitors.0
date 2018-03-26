From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Mar 2018 14:33:13 +0000
Subject: [PATCH net-next] tipc: tipc_node_create() can be static
Message-Id: <1522074793-22753-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Maloy <jon.maloy@ericsson.com>, Ying Xue <ying.xue@windriver.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

net/tipc/node.c:336:18: warning:
 symbol 'tipc_node_create' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/tipc/node.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/tipc/node.c b/net/tipc/node.c
index 4a95c8c..4fb4327 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -333,8 +333,8 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 	}
 }
 
-struct tipc_node *tipc_node_create(struct net *net, u32 addr,
-				   u8 *peer_id, u16 capabilities)
+static struct tipc_node *tipc_node_create(struct net *net, u32 addr,
+					  u8 *peer_id, u16 capabilities)
 {
 	struct tipc_net *tn = net_generic(net, tipc_net_id);
 	struct tipc_node *n, *temp_node;

