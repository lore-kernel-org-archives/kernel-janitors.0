From: Colin King <colin.king@canonical.com>
Date: Fri, 24 May 2019 21:56:58 +0000
Subject: [PATCH][next] ipv4: remove redundant assignment to n
Message-Id: <20190524215658.25432-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer n is being assigned a value however this value is
never read in the code block and the end of the code block
continues to the next loop iteration. Clean up the code by
removing the redundant assignment.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv4/fib_trie.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ipv4/fib_trie.c b/net/ipv4/fib_trie.c
index ea7df7ebf597..b53ecef89d59 100644
--- a/net/ipv4/fib_trie.c
+++ b/net/ipv4/fib_trie.c
@@ -1961,7 +1961,6 @@ static void __fib_info_notify_update(struct net *net, struct fib_table *tb,
 			if (IS_TRIE(pn))
 				break;
 
-			n = pn;
 			pn = node_parent(pn);
 			cindex = get_index(pkey, pn);
 			continue;
-- 
2.20.1
