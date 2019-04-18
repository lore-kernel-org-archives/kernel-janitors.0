From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Apr 2019 17:00:56 +0000
Subject: [PATCH] netfilter: connlabels: fix spelling mistake "trackling" -> "tracking"
Message-Id: <20190418170056.22486-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/netfilter/xt_connlabel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/xt_connlabel.c b/net/netfilter/xt_connlabel.c
index 4fa4efd24353..893374ac3758 100644
--- a/net/netfilter/xt_connlabel.c
+++ b/net/netfilter/xt_connlabel.c
@@ -15,7 +15,7 @@
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Florian Westphal <fw@strlen.de>");
-MODULE_DESCRIPTION("Xtables: add/match connection trackling labels");
+MODULE_DESCRIPTION("Xtables: add/match connection tracking labels");
 MODULE_ALIAS("ipt_connlabel");
 MODULE_ALIAS("ip6t_connlabel");
 
-- 
2.20.1
