From: Francisco Alecrim <francisco.alecrim@indt.org.br>
Date: Fri, 14 Dec 2007 18:56:45 +0000
Subject: [PATCH 1/6] SPI: clean up remove duplicated headers
Message-Id: <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: "Francisco Alecrim <francisco.alecrim@indt.org.br>"
 <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br>
In-Reply-To: <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, kyle@parisc-linux.org, dmitry.torokhov@gmail.com, hcegtvedt@atmel.com, Francisco Alecrim <francisco.alecrim@indt.org.br>

Remove duplicated headers in SPI subsystem:
drivers/spi/spi_butterfly.c: linux/spi/spi_bitbang.h is included more than once.
drivers/spi/spi_lm70llp.c: linux/spi/spi_bitbang.h is included more than once.
drivers/spi/spi_s3c24xx_gpio.c: linux/spi/spi_bitbang.h is included more than once.

Signed-off-by: Francisco Alecrim <francisco.alecrim@indt.org.br>
---
 drivers/spi/spi_butterfly.c    |    1 -
 drivers/spi/spi_lm70llp.c      |    1 -
 drivers/spi/spi_s3c24xx_gpio.c |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi_butterfly.c b/drivers/spi/spi_butterfly.c
index 0ee2b20..54eed48 100644
--- a/drivers/spi/spi_butterfly.c
+++ b/drivers/spi/spi_butterfly.c
@@ -150,7 +150,6 @@ static void butterfly_chipselect(struct spi_device *spi, int value)
 //#define	spidelay	ndelay
 
 #define	EXPAND_BITBANG_TXRX
-#include <linux/spi/spi_bitbang.h>
 
 static u32
 butterfly_txrx_word_mode0(struct spi_device *spi,
diff --git a/drivers/spi/spi_lm70llp.c b/drivers/spi/spi_lm70llp.c
index 39d8d8a..9128ed5 100644
--- a/drivers/spi/spi_lm70llp.c
+++ b/drivers/spi/spi_lm70llp.c
@@ -167,7 +167,6 @@ static inline int getmiso(struct spi_device *s)
 /*--------------------------------------------------------------------*/
 
 #define EXPAND_BITBANG_TXRX 1
-#include <linux/spi/spi_bitbang.h>
 
 static void lm70_chipselect(struct spi_device *spi, int value)
 {
diff --git a/drivers/spi/spi_s3c24xx_gpio.c b/drivers/spi/spi_s3c24xx_gpio.c
index 109d82c..fe6aff7 100644
--- a/drivers/spi/spi_s3c24xx_gpio.c
+++ b/drivers/spi/spi_s3c24xx_gpio.c
@@ -58,7 +58,6 @@ static inline u32 getmiso(struct spi_device *dev)
 #define spidelay(x) ndelay(x)
 
 #define	EXPAND_BITBANG_TXRX
-#include <linux/spi/spi_bitbang.h>
 
 
 static u32 s3c2410_spigpio_txrx_mode0(struct spi_device *spi,
-- 
1.5.3.7

