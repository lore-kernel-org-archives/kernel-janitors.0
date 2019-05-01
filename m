From: Colin King <colin.king@canonical.com>
Date: Wed, 01 May 2019 13:41:58 +0000
Subject: [PATCH][next] openvswitch: check for null pointer return from nla_nest_start_noflag
Message-Id: <20190501134158.15307-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pravin B Shelar <pshelar@ovn.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, dev@openvswitch.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to nla_nest_start_noflag can return null in the unlikely
event that nla_put returns -EMSGSIZE.  Check for this condition to
avoid a null pointer dereference on pointer nla_reply.

Addresses-Coverity: ("Dereference null return value")
Fixes: 11efd5cb04a1 ("openvswitch: Support conntrack zone limit")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/openvswitch/conntrack.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index c4128082f88b..333ec5f298fe 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -2175,6 +2175,10 @@ static int ovs_ct_limit_cmd_get(struct sk_buff *skb, struct genl_info *info)
 		return PTR_ERR(reply);
 
 	nla_reply = nla_nest_start_noflag(reply, OVS_CT_LIMIT_ATTR_ZONE_LIMIT);
+	if (!nla_reply) {
+		err = -EMSGSIZE;
+		goto exit_err;
+	}
 
 	if (a[OVS_CT_LIMIT_ATTR_ZONE_LIMIT]) {
 		err = ovs_ct_limit_get_zone_limit(
-- 
2.20.1
