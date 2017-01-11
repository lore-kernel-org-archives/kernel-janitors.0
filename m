From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 20:42:35 +0000
Subject: [PATCH 07/18] mtd-cfi_cmdset_0001: One function call and an unnecessary check less in cfi_intelext_s
Message-Id: <7d729ead-b608-f298-d68c-f5f7e37605d6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 17:27:53 +0100

The kfree() function was called in one case by the cfi_intelext_setup()
function during error handling even if the passed data structure member
contained a null pointer.

* Adjust a jump target according to the Linux coding style convention
  so that memory will be also released for members of a data structure
  before the container "mtd" in the error handling case.

* Delete a check which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index d7d3d398e4d4..7f6ed7293e40 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -601,7 +601,7 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 				    sizeof(*mtd->eraseregions),
 				    GFP_KERNEL);
 	if (!mtd->eraseregions)
-		goto setup_err;
+		goto free_priv;
 
 	for (i = 0; i < cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
@@ -657,16 +657,14 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	return mtd;
 
  setup_err:
-	if (mtd->eraseregions)
-		for (i = 0; i < cfi->cfiq->NumEraseRegions; i++)
-			for (j = 0; j < cfi->numchips; j++)
-				kfree(mtd->eraseregions[j
-							* cfi->cfiq
-							  ->NumEraseRegions
-							+ i].lockmap);
+	for (i = 0; i < cfi->cfiq->NumEraseRegions; i++)
+		for (j = 0; j < cfi->numchips; j++)
+			kfree(mtd->eraseregions[j * cfi->cfiq->NumEraseRegions
+						+ i].lockmap);
 	kfree(mtd->eraseregions);
-	kfree(mtd);
+free_priv:
 	kfree(cfi->cmdset_priv);
+	kfree(mtd);
 	return NULL;
 }
 
-- 
2.11.0

