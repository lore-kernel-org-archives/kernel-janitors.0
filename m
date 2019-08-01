From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 01 Aug 2019 01:38:25 +0000
Subject: [PATCH -next] intel_th: msu: Fix possible memory leak in mode_store()
Message-Id: <20190801013825.182543-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

'mode' is malloced in mode_store() and should be freed before leaving
from the error handling cases, otherwise it will cause memory leak.

Fixes: 615c164da0eb ("intel_th: msu: Introduce buffer interface")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwtracing/intel_th/msu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index fc9f15f36ad4..2e7a04f566d4 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -1849,8 +1849,10 @@ mode_store(struct device *dev, struct device_attribute *attr, const char *buf,
 
 	mode = kstrndup(buf, len, GFP_KERNEL);
 	i = match_string(msc_mode, ARRAY_SIZE(msc_mode), mode);
-	if (i >= 0)
+	if (i >= 0) {
+		kfree(mode);
 		goto found;
+	}
 
 	/* Buffer sinks only work with a usable IRQ */
 	if (!msc->do_irq) {
