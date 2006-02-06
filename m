From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 06 Feb 2006 16:22:41 +0000
Subject: Re: [KJ] pci_set_drvdata()
Message-Id: <20060206162241.GA7629@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============061688923535283102=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139234943.7477.7.camel@localhost.localdomain>
In-Reply-To: <1139234943.7477.7.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============061688923535283102==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2006-02-06 at 15:09:03 +0100, Matthew Martin <lihnucks@gmail.com> wrote:
> --- original-linux-2.6.15/drivers/eisa/pci_eisa.c	2006-01-02
> 21:21:10.000000000 -0600
> +++ linux-2.6.15/drivers/eisa/pci_eisa.c	2006-02-05 22:22:58.000000000
> -0600
> @@ -31,7 +31,7 @@ static int __devinit pci_eisa_init (stru
>  	}
>  
>  	pci_eisa_root.dev              = &pdev->dev;
> -	pci_eisa_root.dev->driver_data = &pci_eisa_root;
> +        pci_set_drvdata(pdev,&pci_eisa_root);
>  	pci_eisa_root.res	       = pdev->bus->resource[0];
>  	pci_eisa_root.bus_base_addr    = pdev->bus->resource[0]->start;
>  	pci_eisa_root.slots	       = EISA_MAX_SLOTS;

You replace a tab with spaces here which is against CodingStyle.

Cheers, Tobias

--===============061688923535283102==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============061688923535283102==--
