From: Scott Feldman <sfeldma@pobox.com>
Date: Sat, 09 Oct 2004 17:13:28 +0000
Subject: Re: [KJ] [RFT 2.6] ebus.c replace pci_find_device with pci_get_device
Message-Id: <1097342008.3903.12.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85567652735839284=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <83130000.1097274406@w-hlinder.beaverton.ibm.com>
In-Reply-To: <83130000.1097274406@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, wli@holomorphy.com

--===============85567652735839284==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2004-10-08 at 15:26, Hanna Linder wrote:
> @@ -275,7 +275,7 @@ void __init ebus_init(void)
>  		}
>  	}
>  
> -	pdev = pci_find_device(PCI_VENDOR_ID_SUN, PCI_DEVICE_ID_SUN_EBUS, 0);
> +	pdev = pci_get_device(PCI_VENDOR_ID_SUN, PCI_DEVICE_ID_SUN_EBUS, 0);
>  	if (!pdev) {
>  		return;
>  	}
> @@ -342,7 +342,7 @@ void __init ebus_init(void)
>  		}
>  
>  	next_ebus:
> -		pdev = pci_find_device(PCI_VENDOR_ID_SUN,
> +		pdev = pci_get_device(PCI_VENDOR_ID_SUN,
>  				       PCI_DEVICE_ID_SUN_EBUS, pdev);
>  		if (!pdev)
>  			break;

If we can get out of the while() with pdev != NULL, then a
pci_dev_put(pdev) cleanup is required.  

-scott


--===============85567652735839284==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85567652735839284==--
