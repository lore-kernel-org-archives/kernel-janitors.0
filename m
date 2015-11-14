From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Nov 2015 17:05:20 +0000
Subject: [PATCH] mmc: pwrseq: constify mmc_pwrseq_ops structures
Message-Id: <1447520720-11564-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

The mmc_pwrseq_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mmc/core/pwrseq.h        |    2 +-
 drivers/mmc/core/pwrseq_emmc.c   |    2 +-
 drivers/mmc/core/pwrseq_simple.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/core/pwrseq.h b/drivers/mmc/core/pwrseq.h
index 096da48..133de04 100644
--- a/drivers/mmc/core/pwrseq.h
+++ b/drivers/mmc/core/pwrseq.h
@@ -16,7 +16,7 @@ struct mmc_pwrseq_ops {
 };
 
 struct mmc_pwrseq {
-	struct mmc_pwrseq_ops *ops;
+	const struct mmc_pwrseq_ops *ops;
 };
 
 #ifdef CONFIG_OF
diff --git a/drivers/mmc/core/pwrseq_emmc.c b/drivers/mmc/core/pwrseq_emmc.c
index ad4f94e..4a82bc7 100644
--- a/drivers/mmc/core/pwrseq_emmc.c
+++ b/drivers/mmc/core/pwrseq_emmc.c
@@ -51,7 +51,7 @@ static void mmc_pwrseq_emmc_free(struct mmc_host *host)
 	kfree(pwrseq);
 }
 
-static struct mmc_pwrseq_ops mmc_pwrseq_emmc_ops = {
+static const struct mmc_pwrseq_ops mmc_pwrseq_emmc_ops = {
 	.post_power_on = mmc_pwrseq_emmc_reset,
 	.free = mmc_pwrseq_emmc_free,
 };
diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
index d10538b..2b16263 100644
--- a/drivers/mmc/core/pwrseq_simple.c
+++ b/drivers/mmc/core/pwrseq_simple.c
@@ -87,7 +87,7 @@ static void mmc_pwrseq_simple_free(struct mmc_host *host)
 	kfree(pwrseq);
 }
 
-static struct mmc_pwrseq_ops mmc_pwrseq_simple_ops = {
+static const struct mmc_pwrseq_ops mmc_pwrseq_simple_ops = {
 	.pre_power_on = mmc_pwrseq_simple_pre_power_on,
 	.post_power_on = mmc_pwrseq_simple_post_power_on,
 	.power_off = mmc_pwrseq_simple_power_off,

