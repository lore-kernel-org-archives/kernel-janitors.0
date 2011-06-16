From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Thu, 16 Jun 2011 17:09:30 +0000
Subject: [PATCH] e1000: remove unnecessary code
Message-Id: <1308244170-30304-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeffrey.t.kirsher@intel.com, jesse.brandeburg@intel.com, bruce.w.allan@intel.com, carolyn.wyborny@intel.com, donald.c.skidmore@intel.com, gregory.v.rose@intel.com, peter.p.waskiewicz.
Cc: e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>

Compile tested.
remove unnecessary code that matches this coccinelle pattern
	if (...)
		return ret;
	return ret;

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 drivers/net/e1000/e1000_hw.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/net/e1000/e1000_hw.c b/drivers/net/e1000/e1000_hw.c
index 7501d97..1698622 100644
--- a/drivers/net/e1000/e1000_hw.c
+++ b/drivers/net/e1000/e1000_hw.c
@@ -3080,7 +3080,6 @@ s32 e1000_phy_hw_reset(struct e1000_hw *hw)
 {
 	u32 ctrl, ctrl_ext;
 	u32 led_ctrl;
-	s32 ret_val;
 
 	e_dbg("e1000_phy_hw_reset");
 
@@ -3126,11 +3125,7 @@ s32 e1000_phy_hw_reset(struct e1000_hw *hw)
 	}
 
 	/* Wait for FW to finish PHY configuration. */
-	ret_val = e1000_get_phy_cfg_done(hw);
-	if (ret_val != E1000_SUCCESS)
-		return ret_val;
-
-	return ret_val;
+	return e1000_get_phy_cfg_done(hw);
 }
 
 /**
-- 
1.7.2.5

