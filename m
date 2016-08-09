From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 09 Aug 2016 15:42:31 +0000
Subject: [PATCH] fmc: constify fmc_operations structure
Message-Id: <1470757351-4960-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Rubini <rubini@gnudd.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The fmc_operations structure is never modified, so declare is as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/fmc/fmc-fakedev.c |    2 +-
 include/linux/fmc.h       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fmc/fmc-fakedev.c b/drivers/fmc/fmc-fakedev.c
index 941d093..3781d0d 100644
--- a/drivers/fmc/fmc-fakedev.c
+++ b/drivers/fmc/fmc-fakedev.c
@@ -231,7 +231,7 @@ static int ff_validate(struct fmc_device *fmc, struct fmc_driver *drv)
 
 
 
-static struct fmc_operations ff_fmc_operations = {
+static const struct fmc_operations ff_fmc_operations = {
 	.read32 =		ff_readl,
 	.write32 =		ff_writel,
 	.reprogram =		ff_reprogram,
diff --git a/include/linux/fmc.h b/include/linux/fmc.h
index a5f0aa5..fc3a684 100644
--- a/include/linux/fmc.h
+++ b/include/linux/fmc.h
@@ -160,7 +160,7 @@ struct fmc_device {
 	unsigned long flags;
 	struct module *owner;		/* char device must pin it */
 	struct fmc_fru_id id;		/* for EEPROM-based match */
-	struct fmc_operations *op;	/* carrier-provided */
+	const struct fmc_operations *op;/* carrier-provided */
 	int irq;			/* according to host bus. 0 = none */
 	int eeprom_len;			/* Usually 8kB, may be less */
 	int eeprom_addr;		/* 0x50, 0x52 etc */

