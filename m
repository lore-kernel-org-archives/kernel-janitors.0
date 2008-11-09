From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Nov 2008 16:56:57 +0000
Subject: [PATCH 8/8] net/tipc/bcast.h: use ARRAY_SIZE
Message-Id: <Pine.LNX.4.64.0811091756350.32509@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: per.liden@ericsson.com, jon.maloy@ericsson.com, allan.stephens@windriver.com, tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

ARRAY_SIZE is more concise to use when the size of an array is divided by
the size of its type or the size of its first element.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@i@
@@

#include <linux/kernel.h>

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(T))
+ ARRAY_SIZE(E)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/tipc/bcast.h              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/tipc/bcast.h b/net/tipc/bcast.h
index 5aa024b..2f2d731 100644
--- a/net/tipc/bcast.h
+++ b/net/tipc/bcast.h
@@ -124,7 +124,7 @@ static inline int tipc_nmap_equal(struct tipc_node_map *nm_a, struct tipc_node_m
 static inline void tipc_nmap_diff(struct tipc_node_map *nm_a, struct tipc_node_map *nm_b,
 				  struct tipc_node_map *nm_diff)
 {
-	int stop = sizeof(nm_a->map) / sizeof(u32);
+	int stop = ARRAY_SIZE(nm_a->map);
 	int w;
 	int b;
 	u32 map;
