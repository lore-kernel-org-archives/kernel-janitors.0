From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Fri, 16 Jul 2010 23:54:52 +0000
Subject: Re: [PATCH 12/25] char: Convert pci_table entries to PCI_VDEVICE (if PCI_ANY_ID is used)
Message-Id: <201007170154.52461.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152052.38060.PeterHuewe@gmx.de> <201007152307.35062.PeterHuewe@gmx.de> <20100716042845.GA28607@suse.de>
In-Reply-To: <20100716042845.GA28607@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, "Digi International, Inc" <Eng.Linux@digi.com>, Alexey Dobriyan <adobriyan@gmail.com>, Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org

Am Freitag 16 Juli 2010 06:28:45 schrieb Greg KH:
> > Maybe there should be a version of PCI_DEVICE that addresses this issue?
> > But I have to admit, something like:
> > { PCI_DEVICE_DD(PCI_VENDOR_ID_DIGI, PCI_DEVICE_XR), brd_xrj },
> > doesn't look that much better.
> 
> You can do:
> 	{ PCI_DEVICE_TABLE(PCI_VENDOR_ID_DIGI, PCI_DEVICE_XR), brd_xrj },
> just fine today, so do that if you want to.


Hi Greg,

unfortunately I can't find the definition of this macro - can you perhaps 
pinpoint me to it? And maybe an example in the kernel?

Thanks,
Peter
