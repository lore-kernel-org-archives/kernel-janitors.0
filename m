From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:48:14 +0000
Subject: Re: [KJ] [PATCH 6/18] drivers/macintosh/ remove pci_find_{device,
Message-Id: <20050214184814.GS7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30392694118816177=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141116.12787.amitg@calsoftinc.com>
In-Reply-To: <200502141116.12787.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============30392694118816177==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:16:10AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> 
> AG
> --
> May the source be with you
> 
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/drivers/macintosh/via-pmu68k.c linux-2.6.11-rc3/drivers/macintosh/via-pmu68k.c
> --- orig/drivers/macintosh/via-pmu68k.c	2004-10-19 03:23:21.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/macintosh/via-pmu68k.c	2005-02-14 05:20:34.000000000 +0530
> @@ -843,7 +843,7 @@ pbook_pci_save(void)
>  	struct pci_save *ps;
>  
>  	npci = 0;
> -	while ((pd = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL)
> +	while ((pd = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL)
>  		++npci;
>  	n_pbook_pci_saves = npci;
>  	if (npci == 0)

No, this is not correct.  Please do not apply.

thanks,

greg k-h

--===============30392694118816177==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30392694118816177==--
