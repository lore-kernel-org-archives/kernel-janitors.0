From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Mar 2020 09:16:13 +0000
Subject: [PATCH][next] soc: qcom: ipa: fix spelling mistake "cahces" -> "caches"
Message-Id: <20200311091613.75613-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <elder@kernel.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ipa/ipa_modem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
index 039afc8c608e..55c9329a4b1d 100644
--- a/drivers/net/ipa/ipa_modem.c
+++ b/drivers/net/ipa/ipa_modem.c
@@ -293,7 +293,7 @@ static void ipa_modem_crashed(struct ipa *ipa)
 
 	ret = ipa_table_hash_flush(ipa);
 	if (ret)
-		dev_err(dev, "error %d flushing hash cahces\n", ret);
+		dev_err(dev, "error %d flushing hash caches\n", ret);
 
 	ret = ipa_endpoint_modem_exception_reset_all(ipa);
 	if (ret)
-- 
2.25.1
