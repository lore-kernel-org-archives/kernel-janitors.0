From: Julia Lawall <julia@diku.dk>
Date: Tue, 14 Oct 2008 16:00:19 +0000
Subject: [PATCH 2/2] drivers/scsi/sun3x_esp.c: Convert && to ||
Message-Id: <Pine.LNX.4.64.0810141759520.20451@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, sammy@sammy.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The pattern !E && !E->fld is nonsensical.  The patch below updates this
according to the assumption that && should be ||.  But perhaps another
solution was intended.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@disable and_comm@
expression E;
identifier fld;
@@

- !E && !E->fld
+ !E || !E->fld
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/sun3x_esp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/scsi/sun3x_esp.c b/drivers/scsi/sun3x_esp.c
--- a/drivers/scsi/sun3x_esp.c
+++ b/drivers/scsi/sun3x_esp.c
@@ -213,7 +213,7 @@ static int __devinit esp_sun3x_probe(str
 	esp->ops = &sun3x_esp_ops;
 
 	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!res && !res->start)
+	if (!res || !res->start)
 		goto fail_unlink;
 
 	esp->regs = ioremap_nocache(res->start, 0x20);
@@ -221,7 +221,7 @@ static int __devinit esp_sun3x_probe(str
 		goto fail_unmap_regs;
 
 	res = platform_get_resource(dev, IORESOURCE_MEM, 1);
-	if (!res && !res->start)
+	if (!res || !res->start)
 		goto fail_unmap_regs;
 
 	esp->dma_regs = ioremap_nocache(res->start, 0x10);
