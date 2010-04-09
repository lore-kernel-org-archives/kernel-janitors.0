From: Mark Asselstine <asselsm@gmail.com>
Date: Fri, 09 Apr 2010 03:15:15 +0000
Subject: [PATCH] mmc: sd: Cleanup redundant memset
Message-Id: <1270782915-25089-1-git-send-email-asselsm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1270687256-17061-1-git-send-email-asselsm@gmail.com>
In-Reply-To: <1270687256-17061-1-git-send-email-asselsm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-mmc@vger.kernel.org
Cc: asselsm@gmail.com

The clearing of mrq via a memset at the top of the for loop in
mmc_wait_for_app_cmd() is not required as mrq is not used and
there is another clearing of mrq just below. We remove the first
memset since if the initial tests in the for loop fail the memset
is not required.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
Resending to linux-mmc@vger.kernel.org and akpm@linux-foundation.org
since MMC/SD is an orphan so hopefully including these folks will allow
someone to pick this patch up.

 drivers/mmc/core/sd_ops.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/core/sd_ops.c b/drivers/mmc/core/sd_ops.c
index 0d96080..63772e7 100644
--- a/drivers/mmc/core/sd_ops.c
+++ b/drivers/mmc/core/sd_ops.c
@@ -79,8 +79,6 @@ int mmc_wait_for_app_cmd(struct mmc_host *host, struct mmc_card *card,
 	 * we cannot use the retries field in mmc_command.
 	 */
 	for (i = 0;i <= retries;i++) {
-		memset(&mrq, 0, sizeof(struct mmc_request));
-
 		err = mmc_app_cmd(host, card);
 		if (err) {
 			/* no point in retrying; no APP commands allowed */
-- 
1.7.0

