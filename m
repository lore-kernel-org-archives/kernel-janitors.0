From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 24 Feb 2012 16:58:41 +0000
Subject: [PATCH 2/2] enic: Silence Sparse Warning: "dubious: x | !y"
Message-Id: <1330102654-2474-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benve@cisco.com
Cc: roprabhu@cisco.com, neepatel@cisco.com, nistrive@cisco.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

Sparse is giving the following warning:
"warning: dubious: x | !y"

"enic_are_pp_different" is static and expected to return true or false.
Logical or is indended here. With logical or, in best case, execution will be
faster because if leftmost operand is true then no need to check other operands.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/net/ethernet/cisco/enic/enic_pp.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cisco/enic/enic_pp.c b/drivers/net/ethernet/cisco/enic/enic_pp.c
index dafea1e..3a6de22 100644
--- a/drivers/net/ethernet/cisco/enic/enic_pp.c
+++ b/drivers/net/ethernet/cisco/enic/enic_pp.c
@@ -159,10 +159,10 @@ static int enic_unset_port_profile(struct enic *enic, int vf)
 static int enic_are_pp_different(struct enic_port_profile *pp1,
 		struct enic_port_profile *pp2)
 {
-	return strcmp(pp1->name, pp2->name) | !!memcmp(pp1->instance_uuid,
-		pp2->instance_uuid, PORT_UUID_MAX) |
-		!!memcmp(pp1->host_uuid, pp2->host_uuid, PORT_UUID_MAX) |
-		!!memcmp(pp1->mac_addr, pp2->mac_addr, ETH_ALEN);
+	return strcmp(pp1->name, pp2->name) || !!memcmp(pp1->instance_uuid,
+		pp2->instance_uuid, PORT_UUID_MAX) ||
+		!!memcmp(pp1->host_uuid, pp2->host_uuid, PORT_UUID_MAX) ||
+		!!memcmp(pp1->mac_addr, pp2->mac_addr, ETH_ALEN);
 }
 
 static int enic_pp_preassociate(struct enic *enic, int vf,
-- 
1.7.4.4

