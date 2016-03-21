From: Jarno Rajahalme <jarno@ovn.org>
Date: Mon, 21 Mar 2016 18:15:19 +0000
Subject: [PATCH] openvswitch: Fix checking for new expected connections.
Message-Id: <1458584119-2693-1-git-send-email-jarno@ovn.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dev@openvswitch.org, jarno@ovn.org

OVS should call into CT NAT for packets of new expected connections only
when the conntrack state is persisted with the 'commit' option to the
OVS CT action.  The test for this condition is doubly wrong, as the CT
status field is ANDed with the bit number (IPS_EXPECTED_BIT) rather
than the mask (IPS_EXPECTED), and due to the wrong assumption that the
expected bit would apply only for the first (i.e., 'new') packet of a
connection, while in fact the expected bit remains on for the lifetime of
an expected connection.  The 'ctinfo' value IP_CT_RELATED derived from
the ct status can be used instead, as it is only ever applicable to
the 'new' packets of the expected connection.

Fixes: 05752523e565 ('openvswitch: Interface with NAT.')
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jarno Rajahalme <jarno@ovn.org>
---
 net/openvswitch/conntrack.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index dc5eb29..47f7c62 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -664,11 +664,12 @@ static int ovs_ct_nat(struct net *net, struct sw_flow_key *key,
 
 	/* Determine NAT type.
 	 * Check if the NAT type can be deduced from the tracked connection.
-	 * Make sure expected traffic is NATted only when committing.
+	 * Make sure new expected connections (IP_CT_RELATED) are NATted only
+	 * when committing.
 	 */
 	if (info->nat & OVS_CT_NAT && ctinfo != IP_CT_NEW &&
 	    ct->status & IPS_NAT_MASK &&
-	    (!(ct->status & IPS_EXPECTED_BIT) || info->commit)) {
+	    (ctinfo != IP_CT_RELATED || info->commit)) {
 		/* NAT an established or related connection like before. */
 		if (CTINFO2DIR(ctinfo) = IP_CT_DIR_REPLY)
 			/* This is the REPLY direction for a connection
-- 
2.1.4

