From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 21 Sep 2004 23:48:21 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH -mm 7/9] pci_find_device to
Message-Id: <20040921234821.GC16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68616151606632458=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040921225243.GC16690@kroah.com>
In-Reply-To: <20040921225243.GC16690@kroah.com>
To: kernel-janitors@vger.kernel.org

--===============68616151606632458==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 21, 2004 at 03:52:43PM -0700, Greg KH wrote:
> > @@ -7338,17 +7339,19 @@ static int __devinit tg3_get_invariants(
> >  	 * every mailbox register write to force the writes to be
> >  	 * posted to the chip in order.
> >  	 */
> > -	if (pci_find_device(PCI_VENDOR_ID_INTEL,
> > -			    PCI_DEVICE_ID_INTEL_82801AA_8, NULL) ||
> > -	    pci_find_device(PCI_VENDOR_ID_INTEL,
> > -			    PCI_DEVICE_ID_INTEL_82801AB_8, NULL) ||
> > -	    pci_find_device(PCI_VENDOR_ID_INTEL,
> > -			    PCI_DEVICE_ID_INTEL_82801BA_11, NULL) ||
> > -	    pci_find_device(PCI_VENDOR_ID_INTEL,
> > -			    PCI_DEVICE_ID_INTEL_82801BA_6, NULL) ||
> > -	    pci_find_device(PCI_VENDOR_ID_AMD,
> > -			    PCI_DEVICE_ID_AMD_FE_GATE_700C, NULL))
> > +	if ((pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
> > +			    PCI_DEVICE_ID_INTEL_82801AA_8, NULL)) ||
> > +	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
> > +			    PCI_DEVICE_ID_INTEL_82801AB_8, NULL)) ||
> > +	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
> > +			    PCI_DEVICE_ID_INTEL_82801BA_11, NULL)) ||
> > +	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
> > +			    PCI_DEVICE_ID_INTEL_82801BA_6, NULL)) ||
> > +	    (pdev = pci_get_device(PCI_VENDOR_ID_AMD,
> > +			    PCI_DEVICE_ID_AMD_FE_GATE_700C, NULL))) {
> >  		tp->tg3_flags |= TG3_FLAG_MBOX_WRITE_REORDER;
> > +		pci_dev_put(pdev);
> > +	}
> 
> If you have more than one device that matches these different tests, you
> will have grabbed a reference and lost it, without freeing it.

The || short-circuits.  As soon as one of these returns a non-null pdev,
the others won't be called.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============68616151606632458==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68616151606632458==--
