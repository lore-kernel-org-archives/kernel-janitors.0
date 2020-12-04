From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 19:30:58 +0000
Subject: [PATCH] mtd: rawnand: Clean up some spelling mistakes and grammar in Kconfig text
Message-Id: <20201204193058.1151768-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some spelling mistakes in the Kconfig help text, fix
these. Also clean up the grammar.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index b93e6cd23259..83b65fb1b93b 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -460,9 +460,9 @@ config MTD_NAND_RICOH
 	select MTD_SM_COMMON
 	help
 	  Enable support for Ricoh R5C852 xD card reader
-	  You also need to enable ether
-	  NAND SSFDC (SmartMedia) read only translation layer' or new
-	  expermental, readwrite
+	  You also need to enable either
+	  'NAND SSFDC (SmartMedia) read only translation layer' or the
+         new experimental, readwrite
 	  'SmartMedia/xD new translation layer'
 
 config MTD_NAND_DISKONCHIP
-- 
2.29.2
