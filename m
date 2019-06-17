From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 17 Jun 2019 09:22:53 +0000
Subject: [PATCH -next v2] coresight: replicator: Add terminate entry for acpi_device_id tables
Message-Id: <20190617092253.167231-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190615104440.94149-1-weiyongjun1@huawei.com>
In-Reply-To: <20190615104440.94149-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Make sure acpi_device_id tables have terminate entry.

Fixes: fe446287ec9f ("coresight: acpi: Support for platform devices")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 542952759941..b7d6d59d56db 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -300,6 +300,7 @@ static const struct of_device_id static_replicator_match[] = {
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id static_replicator_acpi_ids[] = {
 	{"ARMHC985", 0}, /* ARM CoreSight Static Replicator */
+	{}
 };
 #endif
