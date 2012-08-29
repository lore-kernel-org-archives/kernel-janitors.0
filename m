From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 29 Aug 2012 16:49:16 +0000
Subject: [PATCH 7/7] net/netfilter/nf_conntrack_netlink.c: fix error return code
Message-Id: <1346258957-7649-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346258957-7649-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1346258957-7649-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: kernel-janitors@vger.kernel.org, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initialize return variable before exiting on an error path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 net/netfilter/nf_conntrack_netlink.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index da4fc37..9807f32 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -2790,7 +2790,8 @@ static int __init ctnetlink_init(void)
 		goto err_unreg_subsys;
 	}
 
-	if (register_pernet_subsys(&ctnetlink_net_ops)) {
+	ret = register_pernet_subsys(&ctnetlink_net_ops);
+	if (ret < 0) {
 		pr_err("ctnetlink_init: cannot register pernet operations\n");
 		goto err_unreg_exp_subsys;
 	}

