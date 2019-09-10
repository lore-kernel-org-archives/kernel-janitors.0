From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 10 Sep 2019 11:29:59 +0000
Subject: [PATCH] ipv6: Fix the link time qualifier of 'ping_v6_proc_exit_net()'
Message-Id: <20190910112959.9222-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The '.exit' functions from 'pernet_operations' structure should be marked
as __net_exit, not __net_init.

Fixes: d862e5461423 ("net: ipv6: Implement /proc/net/icmp6.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Untested, but using __net_exit looks consistent with other
pernet_operations.exit use case.
---
 net/ipv6/ping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/ping.c b/net/ipv6/ping.c
index 87d2d8c1db7c..98ac32b49d8c 100644
--- a/net/ipv6/ping.c
+++ b/net/ipv6/ping.c
@@ -223,7 +223,7 @@ static int __net_init ping_v6_proc_init_net(struct net *net)
 	return 0;
 }
 
-static void __net_init ping_v6_proc_exit_net(struct net *net)
+static void __net_exit ping_v6_proc_exit_net(struct net *net)
 {
 	remove_proc_entry("icmp6", net->proc_net);
 }
-- 
2.20.1
