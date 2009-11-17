From: Michael Spradling <mike@mspradling.com>
Date: Tue, 17 Nov 2009 05:38:47 +0000
Subject: [PATCH 1/1] Removed Dead Code
Message-Id: <20091117053847.GA19184@MSServer>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Michael Spradling <mike@mspradling.com>

---
 drivers/video/s1d13xxxfb.c |   50 --------------------------------------------
 1 files changed, 0 insertions(+), 50 deletions(-)

diff --git a/drivers/video/s1d13xxxfb.c b/drivers/video/s1d13xxxfb.c
index 0deb0a8..d3059cd 100644
--- a/drivers/video/s1d13xxxfb.c
+++ b/drivers/video/s1d13xxxfb.c
@@ -409,28 +409,6 @@ s1d13xxxfb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
  ************************************************************/
 
 /**
- *	bltbit_wait_bitset - waits for change in register value
- *	@info : framebuffer structure
- *	@bit  : value expected in register
- *	@timeout : ...
- *
- *	waits until value changes INTO bit
- */
-static u8
-bltbit_wait_bitset(struct fb_info *info, u8 bit, int timeout)
-{
-	while (!(s1d13xxxfb_readreg(info->par, S1DREG_BBLT_CTL0) & bit)) {
-		udelay(10);
-		if (!--timeout) {
-			dbg_blit("wait_bitset timeout\n");
-			break;
-		}
-	}
-
-	return timeout;
-}
-
-/**
  *	bltbit_wait_bitclear - waits for change in register value
  *	@info : frambuffer structure
  *	@bit  : value currently in register
@@ -453,34 +431,6 @@ bltbit_wait_bitclear(struct fb_info *info, u8 bit, int timeout)
 	return timeout;
 }
 
-/**
- *	bltbit_fifo_status - checks the current status of the fifo
- *	@info : framebuffer structure
- *
- *	returns number of free words in buffer
- */
-static u8
-bltbit_fifo_status(struct fb_info *info)
-{
-	u8 status;
-
-	status = s1d13xxxfb_readreg(info->par, S1DREG_BBLT_CTL0);
-
-	/* its empty so room for 16 words */
-	if (status & BBLT_FIFO_EMPTY)
-		return 16;
-
-	/* its full so we dont want to add */
-	if (status & BBLT_FIFO_FULL)
-		return 0;
-
-	/* its atleast half full but we can add one atleast */
-	if (status & BBLT_FIFO_NOT_FULL)
-		return 1;
-
-	return 0;
-}
-
 /*
  *	s1d13xxxfb_bitblt_copyarea - accelerated copyarea function
  *	@info : framebuffer structure
-- 
1.6.5.2


