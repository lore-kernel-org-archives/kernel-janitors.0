From: "Kevin Jackson" <foamdino@gmail.com>
Date: Wed, 06 Jun 2007 04:15:12 +0000
Subject: [KJ] [patch] use DMA_32BIT_MASK where appropriate in
Message-Id: <ab8e556c0706052115uf8e3e13g6a01207eb7b1166a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Kev Jackson <foamdino@gmail.com>

-Removes TW_DMA_MASK definition from header/code use DMA_32BIT_MASK
instead as per kernel janitors TODO list

Signed-off-by: Kev Jackson <foamdino@gmail.com>

---

Hopefully this conforms to the requirements in the SubmittingPatches
docs :), please point out glaring errors etc (including if this
meta-comment really is ignored by changelogs as described in the docs)

--- drivers/scsi/3w-xxxx.c.orig 2007-06-06 10:30:21.000000000 +0700
+++ drivers/scsi/3w-xxxx.c      2007-06-06 10:31:29.000000000 +0700
@@ -2338,7 +2338,7 @@ static int __devinit tw_probe(struct pci

        pci_set_master(pdev);

-       retval = pci_set_dma_mask(pdev, TW_DMA_MASK);
+       retval = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
        if (retval) {
                printk(KERN_WARNING "3w-xxxx: Failed to set dma mask.");
                goto out_disable_device;
--- drivers/scsi/3w-xxxx.h.orig 2007-06-06 10:30:29.000000000 +0700
+++ drivers/scsi/3w-xxxx.h      2007-06-06 10:32:01.000000000 +0700
@@ -234,7 +234,6 @@ static unsigned char tw_sense_table[][4]
 #define TW_IOCTL_TIMEOUT                      25 /* 25 seconds */
 #define TW_IOCTL_CHRDEV_TIMEOUT               60 /* 60 seconds */
 #define TW_IOCTL_CHRDEV_FREE                  -1
-#define TW_DMA_MASK                          DMA_32BIT_MASK
 #define TW_MAX_CDB_LEN                       16

 /* Bitmask macros to eliminate bitfields */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
