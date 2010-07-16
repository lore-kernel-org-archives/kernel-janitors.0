From: Greg KH <gregkh@suse.de>
Date: Fri, 16 Jul 2010 04:28:45 +0000
Subject: Re: [PATCH 12/25] char: Convert pci_table entries to PCI_VDEVICE
Message-Id: <20100716042845.GA28607@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152052.38060.PeterHuewe@gmx.de> <20100715204540.GB24463@suse.de> <201007152307.35062.PeterHuewe@gmx.de>
In-Reply-To: <201007152307.35062.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter H?we <PeterHuewe@gmx.de>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, "Digi International, Inc" <Eng.Linux@digi.com>, Alexey Dobriyan <adobriyan@gmail.com>, Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org

On Thu, Jul 15, 2010 at 11:07:34PM +0200, Peter H?we wrote:
> Am Donnerstag 15 Juli 2010 22:45:40 schrieb Greg KH:
> > The main reason I hate this macro, is that it now makes it almost
> > impossible to grep for any users of the PCI_VENDOR_DIGI pci vendor id.
> > I much prefer the PCI_DEVICE() macro instead, and as such, I'm not
> > willing to take any of these patches, sorry.
> 
> No problem ;)
> Patches are just proposals - nothing else.
> 
> The only  question that remains is, do you see any point in converting the 
> patches to use PCI_DEVICE?
> Since you have to address/set the .driver_data explicitly I guess there's no 
> point in doing it.
> 
> It's
> { PCI_VENDOR_DIGI, PCI_DEVICE_XRJ, PCI_ANY_ID, PCI_ANY_ID, 0, 0, brd_xrj },
> vs.
>  { PCI_DEVICE(PCI_VENDOR_ID_DIGI, PCI_DEVICE_XR), .driver_data=brd_xrj },
> and I guess it isn't really an improvement.

It's a bit nicer, yes.  But only do it if you want to.

> Maybe there should be a version of PCI_DEVICE that addresses this issue? 
> But I have to admit, something like:
> { PCI_DEVICE_DD(PCI_VENDOR_ID_DIGI, PCI_DEVICE_XR), brd_xrj }, 
> doesn't look that much better.

You can do:
	{ PCI_DEVICE_TABLE(PCI_VENDOR_ID_DIGI, PCI_DEVICE_XR), brd_xrj },
just fine today, so do that if you want to.

thanks,

greg k-h
