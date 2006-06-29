From: Greg KH <greg@kroah.com>
Date: Thu, 29 Jun 2006 23:18:31 +0000
Subject: Re: [KJ] [PATCH] pci_module_init() -> pci_register_driver() in
Message-Id: <20060629231831.GA7071@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44A454A4.5010802@nachtwindheim.de>
In-Reply-To: <44A454A4.5010802@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jun 30, 2006 at 01:14:13AM +0200, Henne wrote:
> Greg KH schrieb:
> > On Fri, Jun 30, 2006 at 12:31:00AM +0200, Henne wrote:
> >> From: Henrik Kretzschmar <henne@nachtwindheim.de>
> >>
> >> Conversion from pci_module_init() to pci_register_driver() in the net-drivers.
> > 
> > Careful, I don't think the network driver maintainer will take this.
> > Please search the lkml archives for further details (having to do with
> > backwards compatibility stuff...)
> > 
> I think the step to be careful has already been done since
> 
> #define pci_module_init pci_register_driver
> 
> in <linux/pci.h>, but I'll search in lkml for that.

Hm, no, I added that #define so as to not break everything all at once
:)

good luck,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
