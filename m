From: Julia Lawall <julia@diku.dk>
Date: Sun, 10 Feb 2008 20:11:24 +0000
Subject: [PATCH 3/8] drivers/net/e1000: Use FIELD_SIZEOF
Message-Id: <Pine.LNX.4.64.0802102110110.23906@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: e1000-devel@lists.sourceforge.net, cramerj@intel.com, john.ronciak@intel.com, jeffrey.t.kirsher@intel.com
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

diff -u -p a/drivers/net/e1000/e1000_ethtool.c b/drivers/net/e1000/e1000_ethtool.c
--- a/drivers/net/e1000/e1000_ethtool.c 2008-02-02 15:28:19.000000000 +0100
+++ b/drivers/net/e1000/e1000_ethtool.c 2008-02-10 17:58:20.000000000 +0100
@@ -50,7 +50,7 @@ struct e1000_stats {
 	int stat_offset;
 };
 
-#define E1000_STAT(m) sizeof(((struct e1000_adapter *)0)->m), \
+#define E1000_STAT(m) FIELD_SIZEOF(struct e1000_adapter, m), \
 		      offsetof(struct e1000_adapter, m)
 static const struct e1000_stats e1000_gstrings_stats[] = {
 	{ "rx_packets", E1000_STAT(stats.gprc) },
