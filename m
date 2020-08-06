From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 12:19:58 +0000
Subject: [PATCH] ath6kl: fix spelling mistake "initilisation" -> "initialization"
Message-Id: <20200806121958.60700-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an ath6kl_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath6kl/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath6kl/init.c b/drivers/net/wireless/ath/ath6kl/init.c
index 811fad6d60c0..39bf19686175 100644
--- a/drivers/net/wireless/ath/ath6kl/init.c
+++ b/drivers/net/wireless/ath/ath6kl/init.c
@@ -1752,7 +1752,7 @@ static int __ath6kl_init_hw_start(struct ath6kl *ar)
 
 	ret = ath6kl_init_service_ep(ar);
 	if (ret) {
-		ath6kl_err("Endpoint service initilisation failed: %d\n", ret);
+		ath6kl_err("Endpoint service initialization failed: %d\n", ret);
 		goto err_cleanup_scatter;
 	}
 
-- 
2.27.0
