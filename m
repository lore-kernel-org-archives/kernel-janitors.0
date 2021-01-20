From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jan 2021 09:57:55 +0000
Subject: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
Message-Id: <YAf+o85Z9lgkq3Nw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20210118113651.71955-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
accessing one element beyond the end of the array.

Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index a985ed064669..5b4ad24a022b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -309,7 +309,7 @@ static int qcom_show_pmic_model(struct seq_file *seq, void *p)
 	if (model < 0)
 		return -EINVAL;
 
-	if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
+	if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
 		seq_printf(seq, "%s\n", pmic_models[model]);
 	else
 		seq_printf(seq, "unknown (%d)\n", model);
-- 
2.29.2
