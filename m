From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Jan 2021 11:36:51 +0000
Subject: [PATCH] soc: qcom: socinfo: Fix off-by-one array index bounds check
Message-Id: <20210118113651.71955-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an off-by-one array index bounds check on array
pmic_models. Fix this by checking using < rather than <= on
the array size.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: 734c78e7febf ("soc: qcom: socinfo: add info from PMIC models array")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index a985ed064669..f449df560d93 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -332,7 +332,7 @@ static int qcom_show_pmic_model_array(struct seq_file *seq, void *p)
 		unsigned int model = SOCINFO_MINOR(get_unaligned_le32(ptr + 2 * i * sizeof(u32)));
 		unsigned int die_rev = get_unaligned_le32(ptr + (2 * i + 1) * sizeof(u32));
 
-		if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
+		if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
 			seq_printf(seq, "%s %u.%u\n", pmic_models[model],
 				   SOCINFO_MAJOR(le32_to_cpu(die_rev)),
 				   SOCINFO_MINOR(le32_to_cpu(die_rev)));
-- 
2.29.2
