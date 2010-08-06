From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:53:23 +0000
Subject: [PATCH 17/18] staging: sm7xx: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124405-13971-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Wu Zhangjin <wuzhangjin@gmail.com>, Patrick Rooney <candyguitar@googlemail.com>, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/sm7xx/smtcfb.c |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm7xx/smtcfb.c b/drivers/staging/sm7xx/smtcfb.c
index f6b401c..24f47d6 100644
--- a/drivers/staging/sm7xx/smtcfb.c
+++ b/drivers/staging/sm7xx/smtcfb.c
@@ -848,7 +848,6 @@ static int __devinit smtcfb_pci_probe(struct pci_dev *pdev,
 		"Silicon Motion display driver " SMTC_LINUX_FB_VERSION "\n");
 
 	err = pci_enable_device(pdev);	/* enable SMTC chip */
-
 	if (err)
 		return err;
 	err = -ENOMEM;
@@ -859,7 +858,7 @@ static int __devinit smtcfb_pci_probe(struct pci_dev *pdev,
 	sfb = smtc_alloc_fb_info(pdev, name);
 
 	if (!sfb)
-		goto failed;
+		goto failed_free;
 	/* Jason (08/13/2009)
 	 * Store fb_info to be further used when suspending and resuming
 	 */
@@ -917,7 +916,8 @@ static int __devinit smtcfb_pci_probe(struct pci_dev *pdev,
 			printk(KERN_INFO
 				"%s: unable to map memory mapped IO\n",
 				sfb->fb.fix.id);
-			return -ENOMEM;
+			err = -ENOMEM;
+			goto failed_fb;
 		}
 
 		/* set MCLK = 14.31818 * (0x16 / 0x2) */
@@ -951,8 +951,7 @@ static int __devinit smtcfb_pci_probe(struct pci_dev *pdev,
 		printk(KERN_INFO
 		"No valid Silicon Motion display chip was detected!\n");
 
-		smtc_free_fb_info(sfb);
-		return err;
+		goto failed_fb;
 	}
 
 	/* can support 32 bpp */
@@ -986,8 +985,12 @@ static int __devinit smtcfb_pci_probe(struct pci_dev *pdev,
 
 	smtc_unmap_smem(sfb);
 	smtc_unmap_mmio(sfb);
+failed_fb:
 	smtc_free_fb_info(sfb);
 
+failed_free:
+	pci_disable_device(pdev);
+
 	return err;
 }
 
-- 
1.7.0.4

