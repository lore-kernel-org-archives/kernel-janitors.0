From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 21 Sep 2004 07:40:49 +0000
Subject: Re: [Kernel-janitors] [PATCH -mm 6/9] pci_find_device to
Message-Id: <20040921084049.D20511@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============09539519384937134=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095749582.3790.93.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095749582.3790.93.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============09539519384937134==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 11:53:03PM -0700, Scott Feldman wrote:
> Use pci_get_device instead of pci_find_device as pci device returned
> from pci_find_device can disappear at any momemt in time.

Should be converted to the pci_driver infrastructure instead.

> 
> Signed-off-by: Scott Feldman <sfeldma@pobox.com>
> 
> diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/sunhme.c linux-2.6.9-rc2-mm1-dsf/drivers/net/sunhme.c
> --- linux-2.6.9-rc2-mm1/drivers/net/sunhme.c	2004-08-14 03:55:10.000000000 -0700
> +++ linux-2.6.9-rc2-mm1-dsf/drivers/net/sunhme.c	2004-09-20 22:51:59.709768488 -0700
> @@ -3311,7 +3311,7 @@ static int __init happy_meal_pci_probe(v
>  	struct pci_dev *pdev = NULL;
>  	int cards = 0;
>  
> -	while ((pdev = pci_find_device(PCI_VENDOR_ID_SUN,
> +	while ((pdev = pci_get_device(PCI_VENDOR_ID_SUN,
>  				       PCI_DEVICE_ID_SUN_HAPPYMEAL, pdev)) != NULL) {
>  		if (pci_enable_device(pdev))
>  			continue;
> 
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

---end quoted text---

--===============09539519384937134==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============09539519384937134==--
