From: Christoph Hellwig <hch@infradead.org>
Date: Mon, 20 Sep 2004 17:12:13 +0000
Subject: Re: [Kernel-janitors] pci_find_* to pci_get_*
Message-Id: <20040920181213.A13178@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32603411316129405=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============32603411316129405==
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

Umm, no.  Just implement the ->shutdown method and kill all this junk ;-)

--===============32603411316129405==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32603411316129405==--
