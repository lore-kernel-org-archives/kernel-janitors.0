From: Greg KH <greg@kroah.com>
Date: Mon, 20 Sep 2004 15:37:24 +0000
Subject: Re: [Kernel-janitors] pci_find_* to pci_get_*
Message-Id: <20040920153724.GC10513@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29620548325739504=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============29620548325739504==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 12:39:44PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 20, 2004 at 01:20:20AM -0700, Scott Feldman wrote:
> > diff -Nru a/drivers/net/e1000/e1000_main.c b/drivers/net/e1000/e1000_main.c
> > --- a/drivers/net/e1000/e1000_main.c	2004-09-20 00:25:03 -07:00
> > +++ b/drivers/net/e1000/e1000_main.c	2004-09-20 00:25:03 -07:00
> > @@ -2789,9 +2789,10 @@
> >  	case SYS_DOWN:
> >  	case SYS_HALT:
> >  	case SYS_POWER_OFF:
> > -		while((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
> > +		while((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
> >  			if(pci_dev_driver(pdev) == &e1000_driver)
> >  				e1000_suspend(pdev, 3);
> > +			pci_dev_put(pdev);
> >  		}
> >  	}
> >  	return NOTIFY_DONE;
> 
> Ummm... there's still a race here.  Between the pci_dev_put() returning and
> the invocation of pci_get_device(), the pdev can go away.  I guess you have
> to do something like:

No you do not, please read the documentation for pci_get_device().
Actually this patch is incorrect for a different reason, that
pci_dev_put() is not needed at all, as pci_get_device() handles the put
on the device for you properly.

So, Scott, care to fix the patch?

Oh, and 1 patch per driver makes it easier for us to see these things :)

thanks,

greg k-h

--===============29620548325739504==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29620548325739504==--
