From: Asai Thambi SP <asamymuthupa@micron.com>
Date: Mon, 22 Jun 2015 17:24:51 +0000
Subject: Re: mtip32xx: fix crash on surprise removal of the drive
Message-Id: <558844E3.9090106@micron.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150620123829.GA24933@mwanda>
In-Reply-To: <20150620123829.GA24933@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 6/20/2015 5:38 AM, Dan Carpenter wrote:
> Hello Asai Thambi SP,
>
> The patch 2132a544727e: "mtip32xx: fix crash on surprise removal of
> the drive" from May 11, 2015, leads to the following static checker
> warning:
>
> 	drivers/block/mtip32xx/mtip32xx.c:4489 mtip_pci_remove()
> 	warn: 'dd' was already freed.
Thanks Dan.
We got this report as soon as patch was merged. We are testing the fix and if everything ok, will send out a patch today.
> drivers/block/mtip32xx/mtip32xx.c
>   4484          spin_lock_irqsave(&dev_lock, flags);
>   4485          list_del_init(&dd->remove_list);
>   4486          spin_unlock_irqrestore(&dev_lock, flags);
>   4487  
>   4488          kfree(dd);
>                       ^^
>   4489          set_bit(MTIP_DDF_REMOVE_DONE_BIT, &dd->dd_flag);
>                                                    ^^^^^^^^^^^
>   4490  
>   4491          pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
>   4492          pci_set_drvdata(pdev, NULL);
>   4493  }
>
> regards,
> dan carpenter
--
Regards,
Asai
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
