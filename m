From: Dan Carpenter <error27@gmail.com>
Date: Mon, 08 Mar 2010 12:55:22 +0000
Subject: mfd: dereferencing first then checking
Message-Id: <20100308125522.GA11530@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

drivers/mfd/t7l66xb.c +371 t7l66xb_probe(58) warn: variable dereferenced before check 'pdata'
   338          t7l66xb->irq_base = pdata->irq_base;

   [snip]

   371          if (pdata && pdata->enable)
   372                  pdata->enable(dev);

Can pdata be null here?  We dereferenced on line 338 without checking.

regards,
dan carpenter
