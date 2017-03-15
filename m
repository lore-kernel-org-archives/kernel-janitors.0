From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:21 +0000
Subject: [PATCH 13/14] ixgbe: Remove unneeded conversions to bool
Message-Id: <20170315162322.12096-13-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
index c38d50c1fcf7..5cffcbeab833 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
@@ -82,8 +82,7 @@ bool ixgbe_device_supports_autoneg_fc(struct ixgbe_hw *hw)
 		hw->mac.ops.check_link(hw, &speed, &link_up, false);
 		/* if link is down, assume supported */
 		if (link_up)
-			supported = speed = IXGBE_LINK_SPEED_1GB_FULL ?
-				true : false;
+			supported = speed = IXGBE_LINK_SPEED_1GB_FULL;
 		else
 			supported = true;
 		break;
-- 
2.11.0

