From: Matthew Wilcox <willy@debian.org>
Date: Tue, 21 Sep 2004 12:48:48 +0000
Subject: Re: [Kernel-janitors] [PATCH -mm 8/9] pci_find_device to
Message-Id: <20040921124848.GW642@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27132023894868373=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095749588.3790.97.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095749588.3790.97.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============27132023894868373==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 11:53:08PM -0700, Scott Feldman wrote:
> @@ -1279,14 +1280,16 @@ static int __devinit tulip_init_one (str
>  	   thankfully it's an old 486 chipset.
>  	*/
>  
> -	if (pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL)) {
> +	if ((dev_cs = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL))) {

You didn't actually switch to pci_get_device() here.  And it should be
better written as:

	dev_cs = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL);
	if (dev_cs) { ...

>  		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
>  		force_csr0 = 1;
> +		pci_dev_put(dev_cs);
>  	}
>  	/* The dreaded SiS496 486 chipset. Same workaround as above. */
> -	if (pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496, NULL)) {
> +	if ((dev_cs = pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496, NULL))) {
>  		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
>  		force_csr0 = 1;
> +		pci_dev_put(dev_cs);
>  	}

Oh.  Even better, then.  Replace the above two stanzas with:

	dev_cs = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL;
	if (!dev_cs)
		dev_cs = pci_get_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496, NULL);
	if (dev_cs) {
		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
		force_csr0 = 1;
		pci_dev_put(dev_cs);
	}


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============27132023894868373==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27132023894868373==--
