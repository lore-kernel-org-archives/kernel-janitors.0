From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Jul 2012 07:46:28 +0000
Subject: [patch] openvswitch: potential NULL deref in sample()
Message-Id: <20120723074628.GA30892@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Gross <jesse-l0M0P4e3n4LQT0dZR+AlfA@public.gmane.org>
Cc: dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>

If there is no OVS_SAMPLE_ATTR_ACTIONS set then "acts_list" is NULL and
it leads to a NULL dereference when we call nla_len(acts_list).  This
is a static checker fix, not something I have seen in testing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This applies to Linus's tree.

diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
index 48badff..c2351d6 100644
--- a/net/openvswitch/actions.c
+++ b/net/openvswitch/actions.c
@@ -325,6 +325,9 @@ static int sample(struct datapath *dp, struct sk_buff *skb,
 		}
 	}
 
+	if (!acts_list)
+		return 0;
+
 	return do_execute_actions(dp, skb, nla_data(acts_list),
 						 nla_len(acts_list), true);
 }
