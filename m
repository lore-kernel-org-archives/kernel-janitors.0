From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Sep 2017 19:56:20 +0000
Subject: [PATCH v2] openvswitch: Fix an error handling path in 'ovs_nla_init_match_and_action()'
Message-Id: <20170911195620.17931-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pshelar@nicira.com, davem@davemloft.net, xiangxia.m.yue@gmail.com
Cc: netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

All other error handling paths in this function go through the 'error'
label. This one should do the same.

Fixes: 9cc9a5cb176c ("datapath: Avoid using stack larger than 1024.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I think that the comment above the function could be improved. It looks
like the commit log which has introduced this function.

I'm also not sure that commit 9cc9a5cb176c is of any help. It is
supposed to remove a warning, and I guess it does. But 'ovs_nla_init_match_and_action()'
is called unconditionnaly from 'ovs_flow_cmd_set()'. So even if the stack
used by each function is reduced, the overall stack should be the same, if
not larger.

So this commit sounds like adding a bug where the code was fine and states
to fix an issue but, at the best, only hides it.

Instead of fixing the code with the proposed patch, reverting the initial
commit could also be considered.

V2: update Subject line
---
 net/openvswitch/datapath.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 76cf273a56c7..c3aec6227c91 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -1112,7 +1112,8 @@ static int ovs_nla_init_match_and_action(struct net *net,
 		if (!a[OVS_FLOW_ATTR_KEY]) {
 			OVS_NLERR(log,
 				  "Flow key attribute not present in set flow.");
-			return -EINVAL;
+			error = -EINVAL;
+			goto error;
 		}
 
 		*acts = get_flow_actions(net, a[OVS_FLOW_ATTR_ACTIONS], key,
-- 
2.11.0

