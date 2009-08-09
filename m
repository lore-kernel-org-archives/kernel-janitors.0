From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Aug 2009 09:42:32 +0000
Subject: Re: [Linux-fbdev-devel] [PATCH 3/3] drivers/video: Correct use of
Message-Id: <Pine.LNX.4.64.0908091141150.13271@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908090943560.13271@ask.diku.dk>
 <10f740e80908090224p13d2119do9e4f4d7730ed001e@mail.gmail.com>
In-Reply-To: <10f740e80908090224p13d2119do9e4f4d7730ed001e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Cc: linux-fbdev-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org

From: Julia Lawall <julia@diku.dk>

request_region should be used with release_region, not request_mem_region.

Geert Uytterhoeven pointed out that in the case of drivers/video/gbefb.c,
the problem is actually the other way around; request_mem_region should be
used instead of request_region.

The semantic patch that finds/fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r1@
expression start;
@@

request_region(start,...)

@b1@
expression r1.start;
@@

request_mem_region(start,...)

@depends on !b1@
expression r1.start;
expression E;
@@

- release_mem_region
+ release_region
  (start,E)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/video/gbefb.c  |    2 +-
 drivers/video/tdfxfb.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff -u -p a/drivers/video/gbefb.c b/drivers/video/gbefb.c
--- a/drivers/video/gbefb.c
+++ b/drivers/video/gbefb.c
@@ -1147,7 +1147,7 @@ static int __init gbefb_probe(struct pla
 	gbefb_setup(options);
 #endif
 
-	if (!request_region(GBE_BASE, sizeof(struct sgi_gbe), "GBE")) {
+	if (!request_mem_region(GBE_BASE, sizeof(struct sgi_gbe), "GBE")) {
 		printk(KERN_ERR "gbefb: couldn't reserve mmio region\n");
 		ret = -EBUSY;
 		goto out_release_framebuffer;
diff -u -p a/drivers/video/tdfxfb.c b/drivers/video/tdfxfb.c
--- a/drivers/video/tdfxfb.c
+++ b/drivers/video/tdfxfb.c
@@ -1571,8 +1571,8 @@ out_err_iobase:
 	if (default_par->mtrr_handle >= 0)
 		mtrr_del(default_par->mtrr_handle, info->fix.smem_start,
 			 info->fix.smem_len);
-	release_mem_region(pci_resource_start(pdev, 2),
-			   pci_resource_len(pdev, 2));
+	release_region(pci_resource_start(pdev, 2),
+		       pci_resource_len(pdev, 2));
 out_err_screenbase:
 	if (info->screen_base)
 		iounmap(info->screen_base);
