From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jan 2015 08:41:27 +0000
Subject: [patch -mainline] fm10k: drop upper bits of VLAN ID
Message-Id: <20150130084127.GE21357@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Alexander Duyck <alexander.h.duyck@intel.com>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, Bruce Allan <bruce.w.allan@intel.com>, Carolyn Wyborny <carolyn.wyborny@intel.com>, Don Skidmore <donald.c.skidmore@intel.com>, Greg Rose <gregory.v.rose@intel.com>, Matthew Vick <matthew.vick@intel.com>, John Ronciak <john.ronciak@intel.com>, Mitch Williams <mitch.a.williams@intel.com>, Linux NICS <linux.nics@intel.com>, e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that the shifts in "(vid << 4) >> 4" perfectly
cancel each other out and the code is a no-op.  "vid" is a u16.  The
comment says that the intention here is to drop the upper bits so I have
added a cast to "u16" to do that.

Fixes: 401b5383c6c9 ('fm10k: Add support for configuring PF interface')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Not tested.

diff --git a/drivers/net/ethernet/intel/fm10k/fm10k_pf.c b/drivers/net/ethernet/intel/fm10k/fm10k_pf.c
index 275423d..ee30d06 100644
--- a/drivers/net/ethernet/intel/fm10k/fm10k_pf.c
+++ b/drivers/net/ethernet/intel/fm10k/fm10k_pf.c
@@ -335,7 +335,7 @@ static s32 fm10k_update_xc_addr_pf(struct fm10k_hw *hw, u16 glort,
 		return FM10K_ERR_PARAM;
 
 	/* drop upper 4 bits of VLAN ID */
-	vid = (vid << 4) >> 4;
+	vid = (u16)(vid << 4) >> 4;
 
 	/* record fields */
 	mac_update.mac_lower = cpu_to_le32(((u32)mac[2] << 24) |
