From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Jun 2018 08:38:38 +0000
Subject: [PATCH] soc: qcom: apr: fix spelling mistake: "paket" -> "packet"
Message-Id: <20180611083838.24365-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/qcom/apr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 57af8a537332..7f8c4c096ad2 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -87,7 +87,7 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 	}
 
 	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
-		dev_err(apr->dev, "APR: Wrong paket size\n");
+		dev_err(apr->dev, "APR: Wrong packet size\n");
 		return -EINVAL;
 	}
 
-- 
2.17.0

