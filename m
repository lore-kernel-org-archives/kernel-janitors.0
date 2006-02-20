From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 21:23:35 +0000
Subject: Re: [KJ] [PATCH] Adding pci_set_drvdata() to pci_eisa.c
Message-Id: <20060220212335.GC29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============009711203304231919=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139250553.9445.6.camel@localhost.localdomain>
In-Reply-To: <1139250553.9445.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============009711203304231919==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 06, 2006 at 12:29:12PM -0600, Matthew Martin wrote:
> --- original-linux-2.6.15/drivers/eisa/pci_eisa.c
> +++ linux-2.6.15/drivers/eisa/pci_eisa.c
> @@ -31,7 +31,7 @@ static int __devinit pci_eisa_init (stru

>  	pci_eisa_root.dev              = &pdev->dev;
> -	pci_eisa_root.dev->driver_data = &pci_eisa_root;
> +	pci_set_drvdata(pdev, &pci_eisa_root);
>  	pci_eisa_root.res	       = pdev->bus->resource[0];
>  	pci_eisa_root.bus_base_addr    = pdev->bus->resource[0]->start;
>  	pci_eisa_root.slots	       = EISA_MAX_SLOTS;

This is little bit confusing. Everything on left side starts with
"pci_eisa_root".


--===============009711203304231919==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============009711203304231919==--
