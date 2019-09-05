From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 16:20:49 +0000
Subject: [PATCH] bcma: make arrays pwr_info_offset and sprom_sizes static const, shrinks object size
Message-Id: <20190905162049.14333-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Arrays pwr_info_offset and sprom_sizes can be make static const rather
than populating them on the stack. Shrinks object size by 236 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  11300	   1320	     64	  12684	   318c	drivers/bcma/sprom.o

After:
   text	   data	    bss	    dec	    hex	filename
  10904	   1480	     64	  12448	   30a0	drivers/bcma/sprom.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/bcma/sprom.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bcma/sprom.c b/drivers/bcma/sprom.c
index 206edd3ba668..bd2c923a6586 100644
--- a/drivers/bcma/sprom.c
+++ b/drivers/bcma/sprom.c
@@ -222,7 +222,7 @@ static void bcma_sprom_extract_r8(struct bcma_bus *bus, const u16 *sprom)
 {
 	u16 v, o;
 	int i;
-	u16 pwr_info_offset[] = {
+	static const u16 pwr_info_offset[] = {
 		SSB_SROM8_PWR_INFO_CORE0, SSB_SROM8_PWR_INFO_CORE1,
 		SSB_SROM8_PWR_INFO_CORE2, SSB_SROM8_PWR_INFO_CORE3
 	};
@@ -578,9 +578,11 @@ int bcma_sprom_get(struct bcma_bus *bus)
 {
 	u16 offset = BCMA_CC_SPROM;
 	u16 *sprom;
-	size_t sprom_sizes[] = { SSB_SPROMSIZE_WORDS_R4,
-				 SSB_SPROMSIZE_WORDS_R10,
-				 SSB_SPROMSIZE_WORDS_R11, };
+	static const size_t sprom_sizes[] = {
+		SSB_SPROMSIZE_WORDS_R4,
+		SSB_SPROMSIZE_WORDS_R10,
+		SSB_SPROMSIZE_WORDS_R11,
+	};
 	int i, err = 0;
 
 	if (!bus->drv_cc.core)
-- 
2.20.1
