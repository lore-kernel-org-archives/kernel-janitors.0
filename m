From: Julia Lawall <julia@diku.dk>
Date: Wed, 24 Dec 2008 15:23:10 +0000
Subject: [PATCH 1/3] drivers/staging/comedi: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0812241622320.5475@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: g.gebhardt@meilhaus.com, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

0x20 has 0 as its rightmost bit and thus !inl(info->plx_regbase +
PLX_INTCSR) & 0x20 is always 0.  I assume that !(!inl(info->plx_regbase +
PLX_INTCSR) & 0x20) was intended.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E; constant C; @@
(
  !E & !C
|
- !E & C
+ !(E & C)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/comedi/drivers/me4000.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/staging/comedi/drivers/me4000.c b/drivers/staging/comedi/drivers/me4000.c
--- a/drivers/staging/comedi/drivers/me4000.c
+++ b/drivers/staging/comedi/drivers/me4000.c
@@ -782,7 +782,7 @@ static int xilinx_download(comedi_device
 
 	/* Wait until /INIT pin is set */
 	udelay(20);
-	if (!inl(info->plx_regbase + PLX_INTCSR) & 0x20) {
+	if (!(inl(info->plx_regbase + PLX_INTCSR) & 0x20)) {
 		printk(KERN_ERR
 			"comedi%d: me4000: xilinx_download(): Can't init Xilinx\n",
 			dev->minor);
