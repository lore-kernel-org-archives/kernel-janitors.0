From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Apr 2019 13:47:23 +0000
Subject: [PATCH] ath6kl: remove redundant check of status != 0
Message-Id: <20190404134723.24667-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check on status not being zero is redundant as previous code
paths that set status to an error value break out of the while
loop and hence status is never non-zero at the check. Remove
this redundant code.

Addresses-Coverity: ("Logically dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath6kl/htc_pipe.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath6kl/htc_pipe.c b/drivers/net/wireless/ath/ath6kl/htc_pipe.c
index 434b66829646..c68848819a52 100644
--- a/drivers/net/wireless/ath/ath6kl/htc_pipe.c
+++ b/drivers/net/wireless/ath/ath6kl/htc_pipe.c
@@ -898,9 +898,6 @@ static int htc_process_trailer(struct htc_target *target, u8 *buffer,
 			break;
 		}
 
-		if (status != 0)
-			break;
-
 		/* advance buffer past this record for next time around */
 		buffer += record->len;
 		len -= record->len;
-- 
2.20.1
