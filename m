From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 20:43:41 +0000
Subject: [PATCH 08/18] mtd-cfi_cmdset_0001: Rename a jump label in cfi_intelext_setup()
Message-Id: <6550d4b3-b024-247f-9954-c2bb67e3352a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 17:49:05 +0100

Adjust a jump label according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7f6ed7293e40..97329484555d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -620,7 +620,7 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 			mtd->eraseregions[x].numblocks = ernum;
 			mtd->eraseregions[x].lockmap = kmalloc(ernum / 8 + 1, GFP_KERNEL);
 			if (!mtd->eraseregions[x].lockmap)
-				goto setup_err;
+				goto free_regions;
 		}
 		offset += (ersize * ernum);
 	}
@@ -628,7 +628,7 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	if (offset != devsize) {
 		/* Argh */
 		printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
-		goto setup_err;
+		goto free_regions;
 	}
 
 	for (i = 0; i < mtd->numeraseregions; i++) {
@@ -650,13 +650,12 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	/* This function has the potential to distort the reality
 	   a bit and therefore should be called last. */
 	if (cfi_intelext_partition_fixup(mtd, &cfi) != 0)
-		goto setup_err;
+		goto free_regions;
 
 	__module_get(THIS_MODULE);
 	register_reboot_notifier(&mtd->reboot_notifier);
 	return mtd;
-
- setup_err:
+free_regions:
 	for (i = 0; i < cfi->cfiq->NumEraseRegions; i++)
 		for (j = 0; j < cfi->numchips; j++)
 			kfree(mtd->eraseregions[j * cfi->cfiq->NumEraseRegions
-- 
2.11.0

