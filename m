From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Mar 2019 14:17:42 +0000
Subject: [PATCH] vlynq: Fix uninitialized error code in probe()
Message-Id: <20190328141742.GM32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "result" variable isn't initialized on this error path.

Fixes: 55e331cf7ebe ("drivers: add support for the TI VLYNQ bus")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/vlynq/vlynq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
index c0227f9418eb..44d3485d1108 100644
--- a/drivers/vlynq/vlynq.c
+++ b/drivers/vlynq/vlynq.c
@@ -727,7 +727,8 @@ static int vlynq_probe(struct platform_device *pdev)
 	dev->local_irq = dev->irq_end - dev->irq_start;
 	dev->remote_irq = dev->local_irq - 1;
 
-	if (device_register(&dev->dev))
+	result = device_register(&dev->dev);
+	if (result)
 		goto fail_register;
 	platform_set_drvdata(pdev, dev);
 
-- 
2.17.1
