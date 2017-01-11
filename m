From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 20:35:55 +0000
Subject: [PATCH 01/18] mtd-cfi_cmdset_0001: Use kmalloc_array() in cfi_intelext_partition_fixup()
Message-Id: <f74ef6ca-7159-ba15-b7a3-0a45e522729f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 10 Jan 2017 18:48:34 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 5e1b68cbcd0a..68227aa74d22 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -746,7 +746,9 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
 		newcfi = kmalloc(sizeof(struct cfi_private) + numvirtchips * sizeof(struct flchip), GFP_KERNEL);
 		if (!newcfi)
 			return -ENOMEM;
-		shared = kmalloc(sizeof(struct flchip_shared) * cfi->numchips, GFP_KERNEL);
+		shared = kmalloc_array(cfi->numchips,
+				       sizeof(*shared),
+				       GFP_KERNEL);
 		if (!shared) {
 			kfree(newcfi);
 			return -ENOMEM;
-- 
2.11.0

