From: Julia Lawall <julia@diku.dk>
Date: Mon, 03 Aug 2009 09:22:09 +0000
Subject: Re: [PATCH 3/5] drivers/scsi: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908031121360.8435@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908012149050.25693@ask.diku.dk>
 <Pine.LNX.4.64.0908022235310.12625@axis700.grange>
In-Reply-To: <Pine.LNX.4.64.0908022235310.12625@axis700.grange>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Kurt Garloff <garloff@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/scsi/tmscsim.c              |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/tmscsim.c b/drivers/scsi/tmscsim.c
index 9a42734..e580db5 100644
--- a/drivers/scsi/tmscsim.c
+++ b/drivers/scsi/tmscsim.c
@@ -1125,7 +1125,8 @@ dc390_MsgIn_set_sync (struct dc390_acb* pACB, struct dc390_srb* pSRB)
     {
       if (! (bval & FAST_SCSI)) wval1++;
       printk (KERN_INFO "DC390: Target %i: Sync transfer %i.%1i MHz, Offset %i\n", pDCB->TargetID, 
-	      40/wval1, ((40%wval1)*10+wval1/2)/wval1, pDCB->SyncOffset & 0x0f);
+	      40/wval1, DIV_ROUND_CLOSEST((40%wval1)*10, wval1),
+	      pDCB->SyncOffset & 0x0f);
     }
   
   dc390_reprog (pACB, pDCB);
