From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Sep 2018 08:38:18 +0000
Subject: [PATCH] vlynq: uninitialized return in vlynq_probe()
Message-Id: <20180910083817.l2xdfkxhrlml5q5q@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

"result" isn't initialized on this error path.

Fixes: 55e331cf7ebe ("drivers: add support for the TI VLYNQ bus")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
 
