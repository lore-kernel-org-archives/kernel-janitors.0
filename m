From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 05:26:56 +0000
Subject: [patch] mfd: 88pm80x: Double shifting bug in suspend/resume
Message-Id: <20160804052656.GG775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Qiao Zhou <zhouqiao@marvell.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

set_bit() and clear_bit() take the bit number so this code is really
doing "1 << (1 << irq)" which is a double shift bug.  It's done
consistently so it won't cause a problem unless "irq" is more than 4.

Fixes: 70c6cce04066 ('mfd: Support 88pm80x in 80x driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
index d409ceb..c118a7e 100644
--- a/include/linux/mfd/88pm80x.h
+++ b/include/linux/mfd/88pm80x.h
@@ -350,7 +350,7 @@ static inline int pm80x_dev_suspend(struct device *dev)
 	int irq = platform_get_irq(pdev, 0);
 
 	if (device_may_wakeup(dev))
-		set_bit((1 << irq), &chip->wu_flag);
+		set_bit(irq, &chip->wu_flag);
 
 	return 0;
 }
@@ -362,7 +362,7 @@ static inline int pm80x_dev_resume(struct device *dev)
 	int irq = platform_get_irq(pdev, 0);
 
 	if (device_may_wakeup(dev))
-		clear_bit((1 << irq), &chip->wu_flag);
+		clear_bit(irq, &chip->wu_flag);
 
 	return 0;
 }
