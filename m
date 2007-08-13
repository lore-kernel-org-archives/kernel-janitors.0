From: Surya Prabhakar N <surya.prabhakar@wipro.com>
Date: Mon, 13 Aug 2007 10:08:32 +0000
Subject: [KJ] replacing kmalloc with kzalloc in drivers/mtd/devices/docprobe.c
Message-Id: <1186998992.29518.15.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1186998764.29518.11.camel@bluegenie>
In-Reply-To: <1186998764.29518.11.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi,
   Replacing kmalloc with kzalloc and cleaning up memset in
drivers/mtd/devices/docprobe.c.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index 54aa759..53be397 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -254,7 +254,7 @@ static void __init DoC_Probe(unsigned long physadr)
 			return;
 		}
 		docfound = 1;
-		mtd = kmalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP_KERNEL);
+		mtd = kzalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP_KERNEL);
 
 		if (!mtd) {
 			printk(KERN_WARNING "Cannot allocate memory for data structures. Dropping.\n");
@@ -264,9 +264,6 @@ static void __init DoC_Probe(unsigned long physadr)
 
 		this = (struct DiskOnChip *)(&mtd[1]);
 
-		memset((char *)mtd,0, sizeof(struct mtd_info));
-		memset((char *)this, 0, sizeof(struct DiskOnChip));
-
 		mtd->priv = this;
 		this->virtadr = docptr;
 		this->physadr = physadr;

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
