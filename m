From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 28 Jan 2007 07:17:26 +0000
Subject: Re: [KJ] updating obsolete pci_find_* routines
Message-Id: <Pine.LNX.4.64.0701280216390.29381@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701271925420.3864@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701271925420.3864@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 27 Jan 2007, Nishanth Aravamudan wrote:

> On 27.01.2007 [19:27:56 -0500], Robert P. J. Day wrote:
> >
> >   From Documentation/pci.txt:
> >
> > 9. Obsolete functions
> > ~~~~~~~~~~~~~~~~~~~~~
> >
> > There are several functions which you might come across when trying to
> > port an old driver to the new PCI interface.  They are no longer
> > present in the kernel as they aren't compatible with hotplug or PCI
> > domains or having sane locking.
> >
> > pci_find_device()       Superseded by pci_get_device()
> > pci_find_subsys()       Superseded by pci_get_subsys()
> > pci_find_slot()         Superseded by pci_get_slot()
> >
> >   so these three changes would be simple text substitutions of the
> >   routine names, would they?  the args have the same semantics and
> >   everything?  just curious.
>
> No, see the kernel-janitor archives.
>
> Among other things, many drivers that still use pci_find_device()
> probably should be reworked to use struct pci_driver semantics.
>
> And pci_get_device() requires a pci_dev_put() when the driver is done
> with the struct pci_dev.

yes, i read more closely and noticed that shortly after posting.
thanks.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
