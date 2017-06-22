From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Jun 2017 17:27:21 +0000
Subject: [PATCH][media-next] media: venus: fix loop wrap in cleanup of clks
Message-Id: <20170622172721.25844-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current pre-decrement is incorrect and should be replaced
with a post-decrement. Consider the case where the very first
clk_prepare_enable fails when i is 0; in this case the error
clean up will decrement the unsigned int which wraps to the
largest unsigned int value causing an array out of bounds read
on core->clks[i].

Detected by CoverityScan, CID#1446590 ("Out-of-bounds read")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 776d2bae6979..d8cbe8549d97 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -137,7 +137,7 @@ static int venus_clks_enable(struct venus_core *core)
 
 	return 0;
 err:
-	while (--i)
+	while (i--)
 		clk_disable_unprepare(core->clks[i]);
 
 	return ret;
-- 
2.11.0

