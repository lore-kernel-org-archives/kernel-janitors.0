From: Greg KH <greg@kroah.com>
Date: Tue, 16 Mar 2004 15:02:41 +0000
Subject: Re: [Kernel-janitors] [patch] fix sysfs leak drivers/net/dgrs.c
Message-Id: <20040316150240.GA8708@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040316094113.GA3260@mail.sternwelten.at>
In-Reply-To: <20040316094113.GA3260@mail.sternwelten.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 16, 2004 at 10:41:15AM +0100, maximilian attems wrote:
> if the driver fails to load, leaves a dgrs dir in sysfs.
> 
> belows patch is far from beautifull,
> but keeps logic of dgrs_init_module().
> 
> test compiled.
> 
> as follow up to:
> http://marc.theaimsgroup.com/?l=linux-kernel&m7938809308387&w=2
> 
> when chasing eisa_driver_register returns,
> i found a lot of unchecked pci_register_driver,
> should i add this one to kj TODO?

Yes, and all pci_module_init() calls need to be changed to
pci_register_driver() but that's a 2.7 thing...

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
