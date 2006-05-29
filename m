From: Greg KH <greg@kroah.com>
Date: Mon, 29 May 2006 21:30:34 +0000
Subject: Re: [KJ] [PATCH] drivers/char/rocket.c : replace pci_find_device by
Message-Id: <20060529213034.GA10621@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4478C3A4.9000504@yahoo.fr>
In-Reply-To: <4478C3A4.9000504@yahoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 27, 2006 at 11:24:52PM +0200, trem wrote:
> From: trem <tremyfr@yahoo.fr>
> 
> This patch simply change pci_find_device by pci_get_device, because
> pci_find_device is deprecated. No pci_dev_put is needed because the
> loop isn't broken, and pci_get_device decrement the counter of the
> device given as from parameter.
> 
> Signed-Off-By: trem <tremyfr@yahoo.fr>

No, this driver should be switched to the proper pci_register_driver()
api instead.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
