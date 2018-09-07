From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Sep 2018 01:45:27 +0000
Subject: [PATCH -next] interconnect: qcom: fix return value of qnoc_probe
Message-Id: <1536284727-170651-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/interconnect/qcom/msm8916.c: In function 'qnoc_probe':
drivers/interconnect/qcom/msm8916.c:439:7: warning:
 variable 'ret' set but not used [-Wunused-but-set-variable]

if icc_node_create failed, err code 'ret' will be returned,
so it cannot be a local variable in for-loop.

Fixes: 8d9300299a40 ("interconnect: qcom: Add msm8916 interconnect provider driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/interconnect/qcom/msm8916.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/interconnect/qcom/msm8916.c b/drivers/interconnect/qcom/msm8916.c
index 74145f4..0e33fdf 100644
--- a/drivers/interconnect/qcom/msm8916.c
+++ b/drivers/interconnect/qcom/msm8916.c
@@ -436,7 +436,6 @@ static int qnoc_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < num_nodes; i++) {
-		int ret;
 		size_t j;
 
 		node = icc_node_create(qnodes[i]->id);
