From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Mar 2016 17:28:01 +0000
Subject: [patch v2] openvswitch: using a bit shift as a mask
Message-Id: <20160318172801.GA16519@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original condition is never true.  We want to test if BIT(0) is set
but the code is ANDing with zero.

Fixes: 05752523e565 ('openvswitch: Interface with NAT.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: use test_bit() instead

diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index dc5eb29..9c9cac0 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -668,7 +668,7 @@ static int ovs_ct_nat(struct net *net, struct sw_flow_key *key,
 	 */
 	if (info->nat & OVS_CT_NAT && ctinfo != IP_CT_NEW &&
 	    ct->status & IPS_NAT_MASK &&
-	    (!(ct->status & IPS_EXPECTED_BIT) || info->commit)) {
+	    (!test_bit(IPS_EXPECTED_BIT, &ct->status) || info->commit)) {
 		/* NAT an established or related connection like before. */
 		if (CTINFO2DIR(ctinfo) = IP_CT_DIR_REPLY)
 			/* This is the REPLY direction for a connection
