From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Dec 2018 08:39:45 +0000
Subject: [PATCH -next] coresight: stm: remove set but not used variable 'res_size'
Message-Id: <1543653585-108277-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/hwtracing/coresight/coresight-stm.c: In function 'stm_probe':
drivers/hwtracing/coresight/coresight-stm.c:796:9: warning:
 variable 'res_size' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit
237483aa5cf4 ("coresight: stm: adding driver for CoreSight STM component")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/hwtracing/coresight/coresight-stm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index ef339ff..f07825d 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -793,7 +793,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	struct stm_drvdata *drvdata;
 	struct resource *res = &adev->res;
 	struct resource ch_res;
-	size_t res_size, bitmap_size;
+	size_t bitmap_size;
 	struct coresight_desc desc = { 0 };
 	struct device_node *np = adev->dev.of_node;
 
@@ -833,15 +833,11 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->write_bytes = stm_fundamental_data_size(drvdata);
 
-	if (boot_nr_channel) {
+	if (boot_nr_channel)
 		drvdata->numsp = boot_nr_channel;
-		res_size = min((resource_size_t)(boot_nr_channel *
-				  BYTES_PER_CHANNEL), resource_size(res));
-	} else {
+	else
 		drvdata->numsp = stm_num_stimulus_port(drvdata);
-		res_size = min((resource_size_t)(drvdata->numsp *
-				 BYTES_PER_CHANNEL), resource_size(res));
-	}
+
 	bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
 
 	guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
