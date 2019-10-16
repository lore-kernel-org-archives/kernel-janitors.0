From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 16 Oct 2019 18:19:43 +0000
Subject: [PATCH 09/10] ixgbe: Remove unneeded conversions to bool
Message-Id: <20191016181944.25106-6-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191016181944.25106-1-afd@ti.com>
In-Reply-To: <20191016181944.25106-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
index 0bd1294ba517..2d896d663e3d 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
@@ -64,8 +64,7 @@ bool ixgbe_device_supports_autoneg_fc(struct ixgbe_hw *hw)
 			hw->mac.ops.check_link(hw, &speed, &link_up, false);
 			/* if link is down, assume supported */
 			if (link_up)
-				supported = speed = IXGBE_LINK_SPEED_1GB_FULL ?
-				true : false;
+				supported = speed = IXGBE_LINK_SPEED_1GB_FULL;
 			else
 				supported = true;
 		}
-- 
2.17.1
