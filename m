From: Matthew Wilcox <willy@debian.org>
Date: Tue, 21 Sep 2004 12:53:25 +0000
Subject: Re: [Kernel-janitors] [PATCH -mm 5/9] pci_find_device to
Message-Id: <20040921125325.GX642@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92095165989436456=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095749574.3790.91.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095749574.3790.91.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============92095165989436456==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 11:52:54PM -0700, Scott Feldman wrote:
> diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/sis900.c linux-2.6.9-rc2-mm1-dsf/drivers/net/sis900.c
> --- linux-2.6.9-rc2-mm1/drivers/net/sis900.c	2004-09-20 22:35:32.000000000 -0700
> +++ linux-2.6.9-rc2-mm1-dsf/drivers/net/sis900.c	2004-09-20 22:39:02.339946664 -0700
> @@ -262,9 +262,9 @@ static int __devinit sis630e_get_mac_add
>  	u8 reg;
>  	int i;
>  
> -	isa_bridge = pci_find_device(PCI_VENDOR_ID_SI, 0x0008, isa_bridge);
> +	isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0008, isa_bridge);
>  	if (!isa_bridge) {
> -		isa_bridge = pci_find_device(PCI_VENDOR_ID_SI, 0x0018, isa_bridge);
> +		isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0018, isa_bridge);

The original driver isn't coded terribly well.  I'd do it as:

	struct pci_dev *isa_bridge;

	isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0008, NULL);
	if (!isa_bridge)
		isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0018, NULL);
	if (!isa_bridge) {
		printk("%s: Can not find ISA bridge\n", net_dev->name);
		return 0;
	}

>  		if (!isa_bridge) {
>  			printk("%s: Can not find ISA bridge\n", net_dev->name);
>  			return 0;
> @@ -279,6 +279,7 @@ static int __devinit sis630e_get_mac_add
>  	}
>  	pci_write_config_byte(isa_bridge, 0x48, reg & ~0x40);
>  
> +	pci_dev_put(isa_bridge);
>  	return 1;
>  }
>  
> @@ -485,9 +486,11 @@ static int __devinit sis900_probe (struc
>  	}
>  
>  	/* save our host bridge revision */
> -	dev = pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_630, NULL);
> -	if (dev)
> +	dev = pci_get_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_630, NULL);
> +	if (dev) {
>  		pci_read_config_byte(dev, PCI_CLASS_REVISION, &sis_priv->host_bridge_rev);
> +		pci_dev_put(dev);
> +	}

This one's fine.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============92095165989436456==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92095165989436456==--
