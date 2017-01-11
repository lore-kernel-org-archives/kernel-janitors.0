From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 20:51:25 +0000
Subject: [PATCH 16/18] mtd-cfi_cmdset_0020: Use kmalloc_array() in cfi_staa_setup()
Message-Id: <927b2449-3de4-83aa-8d23-ef0a6461ecfe@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 19:33:48 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0020.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 94d3eb42c4d5..9cd7b1c6faba 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -184,8 +184,9 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	mtd->size = devsize * cfi->numchips;
 
 	mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
-	mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info)
-			* mtd->numeraseregions, GFP_KERNEL);
+	mtd->eraseregions = kmalloc_array(mtd->numeraseregions,
+					  sizeof(*mtd->eraseregions),
+					  GFP_KERNEL);
 	if (!mtd->eraseregions) {
 		kfree(cfi->cmdset_priv);
 		kfree(mtd);
-- 
2.11.0

