From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Apr 2020 07:30:04 +0000
Subject: [PATCH] soc: qcom: ipa: Add a missing '\n' in a log message
Message-Id: <20200411073004.8404-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elder@kernel.org, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: a646d6ec9098 ("soc: qcom: ipa: modem and microcontroller")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ipa/ipa_modem.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
index 55c9329a4b1d..ed10818dd99f 100644
--- a/drivers/net/ipa/ipa_modem.c
+++ b/drivers/net/ipa/ipa_modem.c
@@ -297,14 +297,13 @@ static void ipa_modem_crashed(struct ipa *ipa)
 
 	ret = ipa_endpoint_modem_exception_reset_all(ipa);
 	if (ret)
-		dev_err(dev, "error %d resetting exception endpoint",
-			ret);
+		dev_err(dev, "error %d resetting exception endpoint\n", ret);
 
 	ipa_endpoint_modem_pause_all(ipa, false);
 
 	ret = ipa_modem_stop(ipa);
 	if (ret)
-		dev_err(dev, "error %d stopping modem", ret);
+		dev_err(dev, "error %d stopping modem\n", ret);
 
 	/* Now prepare for the next modem boot */
 	ret = ipa_mem_zero_modem(ipa);
-- 
2.20.1
