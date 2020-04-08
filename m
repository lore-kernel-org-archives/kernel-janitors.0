From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 08 Apr 2020 07:05:04 +0000
Subject: [PATCH -next] pinctrl: qcom: Remove duplicated include from pinctrl-msm.c
Message-Id: <20200408070504.134847-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Ajay Kishore <akisho@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9a398a211d30..898fc041e197 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -23,7 +23,6 @@
 #include <linux/pm.h>
 #include <linux/log2.h>
 #include <linux/qcom_scm.h>
-#include <linux/io.h>
 
 #include <linux/soc/qcom/irq.h>
