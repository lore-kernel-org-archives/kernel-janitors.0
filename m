From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Aug 2014 13:21:30 +0000
Subject: re: irqchip: keystone: Add irq controller ip driver
Message-Id: <20140828132130.GC24477@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Grygorii Strashko,

The patch 89323f8c504a: "irqchip: keystone: Add irq controller ip
driver" from Jul 23, 2014, leads to the following static checker
warning:

	drivers/irqchip/irq-keystone.c:166 keystone_irq_probe()
	warn: unsigned 'kirq->irq' is never less than zero.

drivers/irqchip/irq-keystone.c
   164  
   165          kirq->irq = platform_get_irq(pdev, 0);
   166          if (kirq->irq < 0) {
                    ^^^^^^^^^^^^^
   167                  dev_err(dev, "no irq resource %d\n", kirq->irq);
   168                  return kirq->irq;
   169          }
   170  

regards,
dan carpenter
