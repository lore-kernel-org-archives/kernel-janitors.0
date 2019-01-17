From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Jan 2019 14:36:23 +0000
Subject: [PATCH] cw1200: fix indentation issues
Message-Id: <20190117143623.29363-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solomon Peachy <pizza@shaftnet.org>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two lines that have indentation issues, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/st/cw1200/fwio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless/st/cw1200/fwio.c
index 30e7646d04af..b7881232499c 100644
--- a/drivers/net/wireless/st/cw1200/fwio.c
+++ b/drivers/net/wireless/st/cw1200/fwio.c
@@ -465,8 +465,8 @@ int cw1200_load_firmware(struct cw1200_common *priv)
 
 	if (!(val32 & ST90TDS_CONFIG_ACCESS_MODE_BIT)) {
 		pr_err("Device is already in QUEUE mode!\n");
-			ret = -EINVAL;
-			goto out;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	switch (priv->hw_type)  {
-- 
2.19.1
