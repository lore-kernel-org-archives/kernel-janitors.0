From: Julia Lawall <julia@diku.dk>
Date: Fri, 28 Oct 2011 23:58:17 +0000
Subject: [PATCH 5/5] drivers/media/video/davinci/vpbe_display.c: eliminate a null pointer dereference
Message-Id: <1319846297-2985-5-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In the original code, probe_out could be reached when res was null and then
when the irq had not yet been requested.  In those cases, the call to
free_irq is not needed, so move probe_out down and introduce a new label
for the case where calling free_irq is useful.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression E, E1;
identifier f;
statement S1,S2,S3;
@@

if (E = NULL)
{
  ... when != if (E = NULL || ...) S1 else S2
      when != E = E1
*E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/davinci/vpbe_display.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/video/davinci/vpbe_display.c b/drivers/media/video/davinci/vpbe_display.c
index 8588a86..d98da4b 100644
--- a/drivers/media/video/davinci/vpbe_display.c
+++ b/drivers/media/video/davinci/vpbe_display.c
@@ -1746,15 +1746,16 @@ static __devinit int vpbe_display_probe(struct platform_device *pdev)
 	for (i = 0; i < VPBE_DISPLAY_MAX_DEVICES; i++) {
 		if (register_device(disp_dev->dev[i], disp_dev, pdev)) {
 			err = -ENODEV;
-			goto probe_out;
+			goto probe_out_irq;
 		}
 	}
 
 	printk(KERN_DEBUG "Successfully completed the probing of vpbe v4l2 device\n");
 	return 0;
 
-probe_out:
+probe_out_irq:
 	free_irq(res->start, disp_dev);
+probe_out:
 	for (k = 0; k < VPBE_DISPLAY_MAX_DEVICES; k++) {
 		/* Get the pointer to the layer object */
 		vpbe_display_layer = disp_dev->dev[k];
