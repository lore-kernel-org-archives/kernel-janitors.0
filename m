From: Andrew McGregor <am@misk.net>
Date: Tue, 16 Nov 2004 14:35:48 +0000
Subject: Re: [KJ] [patch scsi/zalon 1] scsi/zalon: Added KERN macro to printk()
Message-Id: <1100615748.419a1044eb930@webmail.misk.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1100563336.41994388ca77d@webmail.misk.net>
In-Reply-To: <1100563336.41994388ca77d@webmail.misk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Quoting maximilian attems <janitor@sternwelten.at>:

> please follow SubmittingPatches,
> patches should apply with -p1.

Hi,

Thank you for your reply.  Please find below my second attempt at a kernel
patch.

I have added a KERN macro to a printk() function as requested in the Kernel
Janitor's TODO list.

Signed-off-by: Andrew McGregor <am@misk.net>

---

--- linux-2.6.9/drivers/scsi/zalon.c.orig       Tue Nov 16 14:29:22 2004
+++ linux-2.6.9/drivers/scsi/zalon.c    Tue Nov 16 14:29:44 2004
@@ -109,7 +109,7 @@ zalon_probe(struct parisc_device *dev)
        */
        irq = gsc_alloc_irq(&gsc_irq);

-       printk("%s: Zalon vers field is 0x%x, IRQ %d\n", __FUNCTION__,
+       printk(KERN_INFO "%s: Zalon vers field is 0x%x, IRQ %d\n", __FUNCTION__,
                zalon_vers, irq);

        __raw_writel(gsc_irq.txn_addr | gsc_irq.txn_data, dev->hpa +
IO_MODULE_EIM);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
