From: Greg KH <greg@kroah.com>
Date: Fri, 28 May 2004 16:18:25 +0000
Subject: Re: [Kernel-janitors] [PATCH] replacing driver_data access by
Message-Id: <20040528161825.GA7332@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40366246510209969=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40B731A4.8040109@web.de>
In-Reply-To: <40B731A4.8040109@web.de>
To: kernel-janitors@vger.kernel.org

--===============40366246510209969==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 28, 2004 at 02:33:40PM +0200, Yoon Soo wrote:
> 
> diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/eisa/pci_eisa.c
> linux-2.6.6-new/drivers/eisa/pci_eisa.c
> --- linux-2.6.6-orig/drivers/eisa/pci_eisa.c    2004-05-10
> 04:32:01.000000000 +0200
> +++ linux-2.6.6-new/drivers/eisa/pci_eisa.c    2004-05-26
> 17:11:36.000000000 +0200
> @@ -33,3 +33,3 @@ static int __devinit pci_eisa_init (stru
>     pci_eisa_root.dev              = &pdev->dev;
> -    pci_eisa_root.dev->driver_data = &pci_eisa_root;
> +    dev_set_drvdata(pci_eisa_root.dev,&pci_eisa_root);
>     pci_eisa_root.res           = pdev->bus->resource[0];

Your patch is line-wrapped and the tabs are gone.  Please try it again.

thanks,

greg k-h

--===============40366246510209969==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40366246510209969==--
