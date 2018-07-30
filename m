From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 30 Jul 2018 02:42:04 +0000
Subject: [PATCH -next] thermal: armada: fix return value check in armada_thermal_probe_legacy()
Message-Id: <1532918524-46054-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In case of error, the function platform_get_resource() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Fixes: 175637792d45 ("thermal: armada: convert driver to syscon register accesses")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/thermal/armada_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
index 8de4ba5..6782814 100644
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -526,8 +526,8 @@ static int armada_thermal_probe_legacy(struct platform_device *pdev,
 
 	/* First memory region points towards the status register */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (IS_ERR(res))
-		return PTR_ERR(res);
+	if (!res)
+		return -EINVAL;
 
 	/*
 	 * Edit the resource start address and length to map over all the

