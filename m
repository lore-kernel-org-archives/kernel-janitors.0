From: Patrik Kullman <patrik@yes.nu>
Date: Mon, 31 Jul 2006 19:51:11 +0000
Subject: Re: [KJ]
Message-Id: <1154375471.2813.10.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106245529.15916.12.camel@base.torri.org>
In-Reply-To: <1106245529.15916.12.camel@base.torri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> >  		return -ENODEV;
> > +	} else {
> > +		pci_dev_put(pdev);
> > +	}
> >  
> >  	/* Check for the a 7101 PMU */
> > -	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x7101, NULL);
> > -	if(pdev = NULL)
> > +	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, NULL);
> 
> What if the previous _and_ this one succeed?

Since the original developer chose to just search for the 1535 and then
overwrite the variable with the 7101 (that will be used), I thought I'd
clear the memory of the first device before assigning the new device to
it.

I guess I shouldn't have.

Will fix.


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
