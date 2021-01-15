From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Jan 2021 10:11:26 +0000
Subject: [PATCH][next] media: venus: Fix uninitialized variable count being checked for zero
Message-Id: <20210115101126.9668-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where plat->codecs is NULL the variable count is uninitialized
but is being checked to see if it is 0. Fix this by initializing
count to 0.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: e29929266be1 ("media: venus: Get codecs and capabilities from hfi platform")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 2c63988cb321..7263c0c32695 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -232,7 +232,7 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 {
 	const struct hfi_platform *plat;
 	const struct hfi_plat_caps *caps = NULL;
-	u32 enc_codecs, dec_codecs, count;
+	u32 enc_codecs, dec_codecs, count = 0;
 	unsigned int entries;
 
 	if (inst)
-- 
2.29.2
