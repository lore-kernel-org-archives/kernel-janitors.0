From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 19:45:50 +0000
Subject: [patch] e1000e: change logical negate to bitwise
Message-Id: <20100522194550.GG22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, Bruce Allan <bruce.w.allan@intel.com>, Alex Duyck <alexander.h.duyck@intel.com>, PJ Waskiewicz <peter.p.waskiewicz.jr@intel.com>, John Ronciak <john.ronciak@intel.com>, "David S. Miller" <davem@davemloft.net>, e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The bitwise negate is intended here.  With the logical negate the 
condition is always false.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/e1000e/netdev.c b/drivers/net/e1000e/netdev.c
index 24507f3..57a7e41 100644
--- a/drivers/net/e1000e/netdev.c
+++ b/drivers/net/e1000e/netdev.c
@@ -2554,7 +2554,7 @@ static void e1000_init_manageability_pt(struct e1000_adapter *adapter)
 			mdef = er32(MDEF(i));
 
 			/* Ignore filters with anything other than IPMI ports */
-			if (mdef & !(E1000_MDEF_PORT_623 | E1000_MDEF_PORT_664))
+			if (mdef & ~(E1000_MDEF_PORT_623 | E1000_MDEF_PORT_664))
 				continue;
 
 			/* Enable this decision filter in MANC2H */
