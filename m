From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Jul 2017 21:44:45 +0000
Subject: [PATCH] spi: pic32: fix spelling mistakes on macro names
Message-Id: <20170724214445.15383-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistakes macros; fix EMPTY spellings:
RX_FIFO_EMTPY -> RX_FIFO_EMPTY
TX_FIFO_EMTPY -> TX_FIFO_EMPTY

Note that there are no other occurrances of these macros in the
source.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/spi/spi-pic32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index fefb688a3432..f8a45af1fa9f 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -52,14 +52,14 @@ struct pic32_spi_regs {
 
 /* Bit fields of SPI Control Register */
 #define CTRL_RX_INT_SHIFT	0  /* Rx interrupt generation */
-#define  RX_FIFO_EMTPY		0
+#define  RX_FIFO_EMPTY		0
 #define  RX_FIFO_NOT_EMPTY	1 /* not empty */
 #define  RX_FIFO_HALF_FULL	2 /* full by half or more */
 #define  RX_FIFO_FULL		3 /* completely full */
 
 #define CTRL_TX_INT_SHIFT	2  /* TX interrupt generation */
 #define  TX_FIFO_ALL_EMPTY	0 /* completely empty */
-#define  TX_FIFO_EMTPY		1 /* empty */
+#define  TX_FIFO_EMPTY		1 /* empty */
 #define  TX_FIFO_HALF_EMPTY	2 /* empty by half or more */
 #define  TX_FIFO_NOT_FULL	3 /* atleast one empty */
 
-- 
2.11.0

