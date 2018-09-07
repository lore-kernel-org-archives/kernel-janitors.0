From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Sep 2018 02:19:16 +0000
Subject: [PATCH -next] spi: pl022: Remove set but not used variable 'chip'
Message-Id: <1536286756-76628-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/spi/spi-pl022.c: In function 'do_polling_transfer':
drivers/spi/spi-pl022.c:1493:20: warning:
 variable 'chip' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/spi/spi-pl022.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index 5f5f197..6120e6a 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -1490,10 +1490,8 @@ static void do_polling_transfer(struct pl022 *pl022)
 	struct spi_message *message = NULL;
 	struct spi_transfer *transfer = NULL;
 	struct spi_transfer *previous = NULL;
-	struct chip_data *chip;
 	unsigned long time, timeout;
 
-	chip = pl022->cur_chip;
 	message = pl022->cur_msg;
 
 	while (message->state != STATE_DONE) {
