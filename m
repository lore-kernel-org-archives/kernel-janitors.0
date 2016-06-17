From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jun 2016 09:22:26 +0000
Subject: [patch -next] tipc: potential shift wrapping bug in map_set()
Message-Id: <20160617092226.GD25609@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Maloy <jon.maloy@ericsson.com>
Cc: Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

"up_map" is a u64 type but we're not using the high 32 bits.

Fixes: 35c55c9877f8 ('tipc: add neighbor monitoring framework')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c
index 87d4efe..0d489e8 100644
--- a/net/tipc/monitor.c
+++ b/net/tipc/monitor.c
@@ -122,8 +122,8 @@ static int dom_size(int peers)
 
 static void map_set(u64 *up_map, int i, unsigned int v)
 {
-	*up_map &= ~(1 << i);
-	*up_map |= (v << i);
+	*up_map &= ~(1ULL << i);
+	*up_map |= ((u64)v << i);
 }
 
 static int map_get(u64 up_map, int i)
