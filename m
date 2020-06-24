From: Colin King <colin.king@canonical.com>
Date: Wed, 24 Jun 2020 14:05:16 +0000
Subject: [PATCH][next] soc: qcom: fix off-by-one array index bounds check
Message-Id: <20200624140516.5929-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The bounds check on model is off-by-one, leading to an array out
of bounds read when model is 26. Fix this.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index e19102f46302..4d29ea244e71 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -275,7 +275,7 @@ static int qcom_show_pmic_model(struct seq_file *seq, void *p)
 	if (model < 0)
 		return -EINVAL;
 
-	if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
+	if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
 		seq_printf(seq, "%s\n", pmic_models[model]);
 	else
 		seq_printf(seq, "unknown (%d)\n", model);
-- 
2.27.0
