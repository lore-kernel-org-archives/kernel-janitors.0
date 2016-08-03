From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Aug 2016 10:58:11 +0000
Subject: re: mailbox: Add Broadcom PDC mailbox driver
Message-Id: <20160803105811.GA25875@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rob Rice,

This is a semi-automatic email about new static checker warnings.

The patch a24532f8d17b: "mailbox: Add Broadcom PDC mailbox driver" 
from Jun 30, 2016, leads to the following Smatch complaint:

drivers/mailbox/bcm-pdc-mailbox.c:929 pdc_irq_handler()
	 warn: variable dereferenced before check 'pdcs' (see line 918)

drivers/mailbox/bcm-pdc-mailbox.c
   917		struct pdc_state *pdcs = cookie;
   918		u32 intstatus = ioread32(pdcs->pdc_reg_vbase + PDC_INTSTATUS_OFFSET);
                                         ^^^^^^^^^^^^^^^^^^^
Dereference.

   919	
   920		if (intstatus & PDC_XMTINTEN_0)
   921			set_bit(PDC_XMTINT_0, &pdcs->intstatus);
   922		if (intstatus & PDC_RCVINTEN_0)
   923			set_bit(PDC_RCVINT_0, &pdcs->intstatus);
   924	
   925		/* Clear interrupt flags in device */
   926		iowrite32(intstatus, pdcs->pdc_reg_vbase + PDC_INTSTATUS_OFFSET);
   927	
   928		/* Wakeup IRQ thread */
   929		if (pdcs && (irq = pdcs->pdc_irq) && (intstatus & PDC_INTMASK))
                    ^^^^
Check too late to do any good.  Delete?

   930			return IRQ_WAKE_THREAD;
   931	

regards,
dan carpenter
