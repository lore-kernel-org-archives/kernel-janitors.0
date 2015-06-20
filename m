From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 20 Jun 2015 12:38:29 +0000
Subject: re: mtip32xx: fix crash on surprise removal of the drive
Message-Id: <20150620123829.GA24933@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Asai Thambi SP,

The patch 2132a544727e: "mtip32xx: fix crash on surprise removal of
the drive" from May 11, 2015, leads to the following static checker
warning:

	drivers/block/mtip32xx/mtip32xx.c:4489 mtip_pci_remove()
	warn: 'dd' was already freed.

drivers/block/mtip32xx/mtip32xx.c
  4484          spin_lock_irqsave(&dev_lock, flags);
  4485          list_del_init(&dd->remove_list);
  4486          spin_unlock_irqrestore(&dev_lock, flags);
  4487  
  4488          kfree(dd);
                      ^^
  4489          set_bit(MTIP_DDF_REMOVE_DONE_BIT, &dd->dd_flag);
                                                   ^^^^^^^^^^^
  4490  
  4491          pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
  4492          pci_set_drvdata(pdev, NULL);
  4493  }

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
