From: Julia Lawall <julia@diku.dk>
Date: Sun, 10 Feb 2008 20:12:29 +0000
Subject: [PATCH 4/8] : Use FIELD_SIZEOF
Message-Id: <Pine.LNX.4.64.0802102111270.23906@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: e1000-devel@lists.sourceforge.net, john.ronciak@intel.com, jeffrey.t.kirsher@intel.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Robert P.J. Day proposed to use the macro FIELD_SIZEOF in replace of code
that matches its definition.

The modification was made using the following semantic patch
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
type t;
identifier f;
@@

- (sizeof(((t*)0)->f))
+ FIELD_SIZEOF(t, f)

@depends on haskernel@
type t;
identifier f;
@@

- sizeof(((t*)0)->f)
+ FIELD_SIZEOF(t, f)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/net/ixgb/ixgb_ethtool.c b/drivers/net/ixgb/ixgb_ethtool.c
--- a/drivers/net/ixgb/ixgb_ethtool.c 2007-11-08 18:33:36.000000000 +0100
+++ b/drivers/net/ixgb/ixgb_ethtool.c 2008-02-10 17:59:49.000000000 +0100
@@ -49,7 +49,7 @@ struct ixgb_stats {
 	int stat_offset;
 };
 
-#define IXGB_STAT(m) sizeof(((struct ixgb_adapter *)0)->m), \
+#define IXGB_STAT(m) FIELD_SIZEOF(struct ixgb_adapter, m), \
 		      offsetof(struct ixgb_adapter, m)
 static struct ixgb_stats ixgb_gstrings_stats[] = {
 	{"rx_packets", IXGB_STAT(net_stats.rx_packets)},
