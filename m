From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Apr 2016 14:30:56 +0000
Subject: [patch -next] geneve: testing the wrong variable in geneve6_build_skb()
Message-Id: <20160419143056.GD4876@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Alexander Duyck <aduyck@mirantis.com>
Cc: Jesse Gross <jesse@kernel.org>, "John W. Linville" <linville@tuxdriver.com>, Pravin B Shelar <pshelar@nicira.com>, Jiri Benc <jbenc@redhat.com>, Daniel Borkmann <daniel@iogearbox.net>, Tom Herbert <tom@herbertland.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We intended to test "err" and not "skb".

Fixes: aed069df099c ('ip_tunnel_core: iptunnel_handle_offloads returns int and doesn't free skb')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
index efbc7ce..512dbe0 100644
--- a/drivers/net/geneve.c
+++ b/drivers/net/geneve.c
@@ -733,7 +733,7 @@ static int geneve6_build_skb(struct dst_entry *dst, struct sk_buff *skb,
 		goto free_dst;
 
 	err = udp_tunnel_handle_offloads(skb, udp_sum);
-	if (IS_ERR(skb))
+	if (err)
 		goto free_dst;
 
 	gnvh = (struct genevehdr *)__skb_push(skb, sizeof(*gnvh) + opt_len);
