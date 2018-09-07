From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Sep 2018 01:50:37 +0000
Subject: [PATCH -next] interconnect: Remove set but not used variable 'p'
Message-Id: <1536285037-171513-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/interconnect/core.c: In function 'icc_set':
drivers/interconnect/core.c:350:23: warning:
 variable 'p' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/interconnect/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 2740f1a..8b1ba1a 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -347,7 +347,6 @@ struct icc_path *of_icc_get(struct device *dev, const char *name)
 int icc_set(struct icc_path *path, u32 avg_bw, u32 peak_bw)
 {
 	struct icc_node *node;
-	struct icc_provider *p;
 	size_t i;
 	int ret;
 
@@ -358,7 +357,6 @@ int icc_set(struct icc_path *path, u32 avg_bw, u32 peak_bw)
 
 	for (i = 0; i < path->num_nodes; i++) {
 		node = path->reqs[i].node;
-		p = node->provider;
 
 		/* update the consumer request for this path */
 		path->reqs[i].avg_bw = avg_bw;
