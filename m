From: Domen Puncer <domen@coderock.org>
Date: Mon, 31 Jul 2006 20:24:06 +0000
Subject: Re: [KJ] [PATCH]
Message-Id: <20060731202406.GI4969@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1154104265.2785.23.camel@localhost>
In-Reply-To: <1154104265.2785.23.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 31/07/06 21:51 +0200, Patrik Kullman wrote:
> > >  		return -ENODEV;
> > > +	} else {
> > > +		pci_dev_put(pdev);
> > > +	}
> > >  
> > >  	/* Check for the a 7101 PMU */
> > > -	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x7101, NULL);
> > > -	if(pdev = NULL)
> > > +	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, NULL);
> > 
> > What if the previous _and_ this one succeed?
> 
> Since the original developer chose to just search for the 1535 and then
> overwrite the variable with the 7101 (that will be used), I thought I'd
> clear the memory of the first device before assigning the new device to
> it.

Guess I misunderstood the meaning.
Still... you only pci_dev_put one device on exit.

btw. nice to know patch-tester still works :-)


	Domen
> 
> I guess I shouldn't have.
> 
> Will fix.
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
