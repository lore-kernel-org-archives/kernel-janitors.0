From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2014 08:41:47 +0000
Subject: [patch -resend] vlynq: fix another resource size off by 1 error
Message-Id: <20140113084147.GA7499@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <2337301.FMvHPCUCYL@lenovo>
References: <20130823081949.GD31293@elgon.mountain>
In-Reply-To: <20130823081949.GD31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <florian@openwrt.org>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>

We fixed the call to request_mem_region() patch
3354f73 ('drivers/vlynq/vlynq.c: fix resource size off by 1 error').
But we need to fix the call the release_mem_region() as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Resending (again) with Andrew's email corrected.

Hi, Andrew, Florian says this has to go through your tree.  I assume
that means he has Acked it.  :)

diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
index 7b07135..c0227f9 100644
--- a/drivers/vlynq/vlynq.c
+++ b/drivers/vlynq/vlynq.c
@@ -762,7 +762,8 @@ static int vlynq_remove(struct platform_device *pdev)
 
 	device_unregister(&dev->dev);
 	iounmap(dev->local);
-	release_mem_region(dev->regs_start, dev->regs_end - dev->regs_start);
+	release_mem_region(dev->regs_start,
+			   dev->regs_end - dev->regs_start + 1);
 
 	kfree(dev);
 
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
