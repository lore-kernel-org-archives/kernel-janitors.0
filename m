From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 03 Jan 2019 06:56:06 +0000
Subject: [PATCH -next] hwspinlock: fix return value check in stm32_hwspinlock_probe()
Message-Id: <1546498950-105456-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: f24fcff1d267 ("hwspinlock: add STM32 hwspinlock device")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 34a8e00..4418392 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -57,8 +57,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	io_base = devm_ioremap_resource(&pdev->dev, res);
-	if (!io_base)
-		return -ENOMEM;
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
 
 	array_size = STM32_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw) + array_size, GFP_KERNEL);
