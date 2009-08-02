From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:49:54 +0000
Subject: [PATCH 15/15] drivers/ide/ide-cd.c: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021049350.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: petkovbb@gmail.com, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/ide/ide-cd.c                |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ide/ide-cd.c b/drivers/ide/ide-cd.c
index 6a9a769..1483a8d 100644
--- a/drivers/ide/ide-cd.c
+++ b/drivers/ide/ide-cd.c
@@ -1146,8 +1146,8 @@ void ide_cdrom_update_speed(ide_drive_t *drive, u8 *buf)
 	ide_debug_log(IDE_DBG_PROBE, "curspeed: %u, maxspeed: %u",
 				     curspeed, maxspeed);
 
-	cd->current_speed = (curspeed + (176/2)) / 176;
-	cd->max_speed = (maxspeed + (176/2)) / 176;
+	cd->current_speed = DIV_ROUND_CLOSEST(curspeed, 176);
+	cd->max_speed = DIV_ROUND_CLOSEST(maxspeed, 176);
 }
 
 #define IDE_CD_CAPABILITIES \
