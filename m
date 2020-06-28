From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sun, 28 Jun 2020 02:30:55 +0000
Subject: [PATCH -next] clk: qcom: Fix return value check in apss_ipq6018_probe()
Message-Id: <20200628023055.50608-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

In case of error, the function dev_get_regmap() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 5e77b4ef1b19 ("clk: qcom: Add ipq6018 apss clock controller")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/qcom/apss-ipq6018.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
index 004f7e1ecdc2..d78ff2f310bf 100644
--- a/drivers/clk/qcom/apss-ipq6018.c
+++ b/drivers/clk/qcom/apss-ipq6018.c
@@ -87,8 +87,8 @@ static int apss_ipq6018_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 
 	regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+	if (!regmap)
+		return -ENODEV;
 
 	return qcom_cc_really_probe(pdev, &apss_ipq6018_desc, regmap);
 }
