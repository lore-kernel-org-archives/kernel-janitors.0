From: Mark Brown <broonie@kernel.org>
Date: Tue, 14 Apr 2020 17:36:57 +0000
Subject: Applied "spi: remove redundant assignment to variable ms" to the spi tree
Message-Id: <applied-20200410122315.17523-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200410122315.17523-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>

The patch

   spi: remove redundant assignment to variable ms

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 49686df5b874e5ed6249bc622b73ad9a9e71cd99 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 13:23:15 +0100
Subject: [PATCH] spi: remove redundant assignment to variable ms

The variable ms is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Addresses-Coverity: ("Unused value")
Link: https://lore.kernel.org/r/20200410122315.17523-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c92c89467e7e..5446b07dcd3a 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1075,7 +1075,7 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 {
 	struct spi_statistics *statm = &ctlr->statistics;
 	struct spi_statistics *stats = &msg->spi->statistics;
-	unsigned long long ms = 1;
+	unsigned long long ms;
 
 	if (spi_controller_is_slave(ctlr)) {
 		if (wait_for_completion_interruptible(&ctlr->xfer_completion)) {
-- 
2.20.1
