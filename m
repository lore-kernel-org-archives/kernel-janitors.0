From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Sep 2018 12:42:34 +0000
Subject: [PATCH] mtd: Kconfig: fix spelling mistake "partions" -> "partition"
Message-Id: <20180911124234.32744-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in the Kconfig text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index c77f537323ec..28b079f20b4b 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -144,7 +144,7 @@ config MTD_BCM63XX_PARTS
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
 	select CRC32
 	help
-	  This provides partions parsing for BCM63xx devices with CFE
+	  This provides partition parsing for BCM63xx devices with CFE
 	  bootloaders.
 
 config MTD_BCM47XX_PARTS
-- 
2.17.1
