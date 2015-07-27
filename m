From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2015 22:42:28 +0000
Subject: [patch -master] netfilter: xt_CT: checking for IS_ERR() instead of NULL
Message-Id: <20150727224228.GA10367@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently changed this from nf_conntrack_alloc() to nf_ct_tmpl_alloc()
so the error handling needs to changed to check for NULL instead of
IS_ERR().

Fixes: 0838aa7fcfcd ('netfilter: fix netns dependencies with conntrack templates')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/netfilter/xt_CT.c b/net/netfilter/xt_CT.c
index c663003..43ddeee 100644
--- a/net/netfilter/xt_CT.c
+++ b/net/netfilter/xt_CT.c
@@ -202,9 +202,10 @@ static int xt_ct_tg_check(const struct xt_tgchk_param *par,
 		goto err1;
 
 	ct = nf_ct_tmpl_alloc(par->net, info->zone, GFP_KERNEL);
-	ret = PTR_ERR(ct);
-	if (IS_ERR(ct))
+	if (!ct) {
+		ret = -ENOMEM;
 		goto err2;
+	}
 
 	ret = 0;
 	if ((info->ct_events || info->exp_events) &&
