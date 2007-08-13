From: Surya Prabhakar N <surya.prabhakar@wipro.com>
Date: Mon, 13 Aug 2007 10:04:44 +0000
Subject: [KJ] replacing kmalloc with kzalloc in drivers/mtd/chips/jedec_probe.c
Message-Id: <1186998764.29518.11.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi,
   Replacing kmalloc with kzalloc and cleaning up memset in
drivers/mtd/chips/jedec_probe.c.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 58e561e..ba5fc39 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1853,14 +1853,12 @@ static int cfi_jedec_setup(struct cfi_private *p_cfi, int index)
 
 	num_erase_regions = jedec_table[index].NumEraseRegions;
 
-	p_cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	p_cfi->cfiq = kzalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
 	if (!p_cfi->cfiq) {
 		//xx printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
 		return 0;
 	}
 
-	memset(p_cfi->cfiq,0,sizeof(struct cfi_ident));
-
 	p_cfi->cfiq->P_ID = jedec_table[index].CmdSet;
 	p_cfi->cfiq->NumEraseRegions = jedec_table[index].NumEraseRegions;
 	p_cfi->cfiq->DevSize = jedec_table[index].DevSize;

--
thanks
surya.
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
