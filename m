From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 15 Nov 2014 18:56:41 +0000
Subject: [patch] mmc: toshsd: move dereference below check for NULL
Message-Id: <20141115185641.GA6530@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Ball <chris@printf.net>, Ondrej Zary <linux@rainbow-software.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org

We check for NULL pointers after dereferencing so it's too late.  Oddly
enough, Smatch misses this code but complains about the caller passing
NULL pointers to this function:

	drivers/mmc/host/toshsd.c:389 toshsd_irq()
	error: we previously assumed 'host->cmd' could be null (see line 349)

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mmc/host/toshsd.c b/drivers/mmc/host/toshsd.c
index edb06d6..4666262 100644
--- a/drivers/mmc/host/toshsd.c
+++ b/drivers/mmc/host/toshsd.c
@@ -206,14 +206,14 @@ static irqreturn_t toshsd_thread_irq(int irq, void *dev_id)
 static void toshsd_cmd_irq(struct toshsd_host *host)
 {
 	struct mmc_command *cmd = host->cmd;
-	u8 *buf = (u8 *) cmd->resp;
+	u8 *buf;
 	u16 data;
 
 	if (!host->cmd) {
 		dev_warn(&host->pdev->dev, "Spurious CMD irq\n");
 		return;
 	}
-
+	buf = (u8 *)cmd->resp;
 	host->cmd = NULL;
 
 	if (cmd->flags & MMC_RSP_PRESENT && cmd->flags & MMC_RSP_136) {
