From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Apr 2019 06:53:14 +0000
Subject: [PATCH net-next] openvswitch: use after free in __ovs_ct_free_action()
Message-Id: <20190402065314.GA14444@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pravin B Shelar <pshelar@ovn.org>, Yi-Hung Wei <yihung.wei@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, dev@openvswitch.org, kernel-janitors@vger.kernel.org

We free "ct_info->ct" and then use it on the next line when we pass it
to nf_ct_destroy_timeout().  This patch swaps the order to avoid the use
after free.

Fixes: 06bd2bdf19d2 ("openvswitch: Add timeout support to ct action")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/openvswitch/conntrack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index 121b01d4a3c0..0be3ab5bde26 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -1804,9 +1804,9 @@ static void __ovs_ct_free_action(struct ovs_conntrack_info *ct_info)
 	if (ct_info->helper)
 		nf_conntrack_helper_put(ct_info->helper);
 	if (ct_info->ct) {
-		nf_ct_tmpl_free(ct_info->ct);
 		if (ct_info->timeout[0])
 			nf_ct_destroy_timeout(ct_info->ct);
+		nf_ct_tmpl_free(ct_info->ct);
 	}
 }
 
-- 
2.17.1
