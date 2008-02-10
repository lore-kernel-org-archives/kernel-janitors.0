From: Julia Lawall <julia@diku.dk>
Date: Sun, 10 Feb 2008 20:14:27 +0000
Subject: [PATCH 6/8] drivers/net/igb: Use FIELD_SIZEOF
Message-Id: <Pine.LNX.4.64.0802102113480.23906@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: e1000-devel@lists.sourceforge.net
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

diff -u -p a/drivers/net/igb/igb_ethtool.c b/drivers/net/igb/igb_ethtool.c
--- a/drivers/net/igb/igb_ethtool.c 2008-02-02 15:28:20.000000000 +0100
+++ b/drivers/net/igb/igb_ethtool.c 2008-02-10 18:06:35.000000000 +0100
@@ -43,7 +43,7 @@ struct igb_stats {
 	int stat_offset;
 };
 
-#define IGB_STAT(m) sizeof(((struct igb_adapter *)0)->m), \
+#define IGB_STAT(m) FIELD_SIZEOF(struct igb_adapter, m), \
 		      offsetof(struct igb_adapter, m)
 static const struct igb_stats igb_gstrings_stats[] = {
 	{ "rx_packets", IGB_STAT(stats.gprc) },
