From: Colin King <colin.king@canonical.com>
Date: Wed, 30 May 2018 09:25:03 +0000
Subject: [PATCH] ath9k: debug: fix spelling mistake "WATHDOG" -> "WATCHDOG"
Message-Id: <20180530092503.10481-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in PR_IS message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath9k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/debug.c b/drivers/net/wireless/ath/ath9k/debug.c
index f685843a2ff3..0a6eb8a8c1ed 100644
--- a/drivers/net/wireless/ath/ath9k/debug.c
+++ b/drivers/net/wireless/ath/ath9k/debug.c
@@ -538,7 +538,7 @@ static int read_file_interrupt(struct seq_file *file, void *data)
 	if (sc->sc_ah->caps.hw_caps & ATH9K_HW_CAP_EDMA) {
 		PR_IS("RXLP", rxlp);
 		PR_IS("RXHP", rxhp);
-		PR_IS("WATHDOG", bb_watchdog);
+		PR_IS("WATCHDOG", bb_watchdog);
 	} else {
 		PR_IS("RX", rxok);
 	}
-- 
2.17.0

