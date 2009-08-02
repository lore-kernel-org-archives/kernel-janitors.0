From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:48:45 +0000
Subject: [PATCH 12/15] drivers/atm: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021048280.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chas@cmf.nrl.navy.mil, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
but is perhaps more readable.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression x,__divisor;
@@

- (((x) + ((__divisor) / 2)) / (__divisor))
+ DIV_ROUND_CLOSEST(x,__divisor)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/atm/horizon.c               |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/atm/horizon.c b/drivers/atm/horizon.c
index 6b969f8..01ce241 100644
--- a/drivers/atm/horizon.c
+++ b/drivers/atm/horizon.c
@@ -641,7 +641,7 @@ static int make_rate (const hrz_dev * dev, u32 c, rounding r,
 					pre = 1;
 				break;
 			case round_nearest:
-				pre = (br+(c<<div)/2)/(c<<div);
+				pre = DIV_ROUND_CLOSEST(br, c<<div);
 				// but p must be non-zero
 				if (!pre)
 					pre = 1;
@@ -671,7 +671,7 @@ static int make_rate (const hrz_dev * dev, u32 c, rounding r,
 					pre = DIV_ROUND_UP(br, c<<div);
 					break;
 				case round_nearest:
-					pre = (br+(c<<div)/2)/(c<<div);
+					pre = DIV_ROUND_CLOSEST(br, c<<div);
 					break;
 				default: /* round_up */
 					pre = br/(c<<div);
