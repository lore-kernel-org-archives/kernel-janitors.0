From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jul 2019 09:46:11 +0000
Subject: [PATCH] net: neigh: remove redundant assignment to variable bucket
Message-Id: <20190726094611.3597-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable bucket is being initialized with a value that is never
read and it is being updated later with a new value in a following
for-loop. The initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/core/neighbour.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index f79e61c570ea..5480edff0c86 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -3033,7 +3033,7 @@ static struct neighbour *neigh_get_first(struct seq_file *seq)
 	struct net *net = seq_file_net(seq);
 	struct neigh_hash_table *nht = state->nht;
 	struct neighbour *n = NULL;
-	int bucket = state->bucket;
+	int bucket;
 
 	state->flags &= ~NEIGH_SEQ_IS_PNEIGH;
 	for (bucket = 0; bucket < (1 << nht->hash_shift); bucket++) {
-- 
2.20.1
