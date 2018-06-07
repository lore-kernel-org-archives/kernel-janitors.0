From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 07 Jun 2018 01:48:05 +0000
Subject: [PATCH -next] Input: synaptics-rmi4 - fix the error return code in rmi_probe_interrupts()
Message-Id: <1528336085-13983-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The error return code PTR_ERR(data->irqdomain) is always 0 since
data->irqdomain is equal to NULL in this error handling case.

Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/input/rmi4/rmi_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 2fb0ae0..cb6d983 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -1043,7 +1043,7 @@ int rmi_probe_interrupts(struct rmi_driver_data *data)
 						   data);
 	if (!data->irqdomain) {
 		dev_err(&rmi_dev->dev, "Failed to create IRQ domain\n");
-		return PTR_ERR(data->irqdomain);
+		return -ENOMEM;
 	}
 
 	data->irq_count = irq_count;

