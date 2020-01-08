From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 08 Jan 2020 01:58:49 +0000
Subject: [PATCH -next] power: avs: qcom-cpr: remove duplicated include from qcom-cpr.c
Message-Id: <20200108015849.54289-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Niklas Cassel <nks@flawful.org>, Kevin Hilman <khilman@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Nishanth Menon <nm@ti.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/power/avs/qcom-cpr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
index 9247f53550b3..9b1d7d919ee9 100644
--- a/drivers/power/avs/qcom-cpr.c
+++ b/drivers/power/avs/qcom-cpr.c
@@ -25,7 +25,6 @@
 #include <linux/regulator/consumer.h>
 #include <linux/clk.h>
 #include <linux/nvmem-consumer.h>
-#include <linux/bitops.h>
 
 /* Register Offsets for RB-CPR and Bit Definitions */
