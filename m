From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:23:35 +0000
Subject: Re: [KJ] [PATCH 8/18] drivers/mtd/ remove pci_find_{device, subsys}
Message-Id: <20050214182334.GB7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69589826158748336=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141122.11786.amitg@calsoftinc.com>
In-Reply-To: <200502141122.11786.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============69589826158748336==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:22:06AM +0530, Amit Gud wrote:
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
> 
> diff -uprN orig/drivers/mtd/devices/pmc551.c linux-2.6.11-rc3/drivers/mtd/devices/pmc551.c
> --- orig/drivers/mtd/devices/pmc551.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/devices/pmc551.c	2005-02-14 02:34:15.000000000 +0530
> @@ -680,7 +680,7 @@ static int __init init_pmc551(void)
>           */
>          for( count = 0; count < MAX_MTD_DEVICES; count++ ) {
>  
> -                if ((PCI_Device = pci_find_device(PCI_VENDOR_ID_V3_SEMI,
> +                if ((PCI_Device = pci_get_device(PCI_VENDOR_ID_V3_SEMI,
>                                                    PCI_DEVICE_ID_V3_SEMI_V370PDC,
>  						  PCI_Device ) ) == NULL) {
>                          break;

Ick, NO!

You can't just always use pci_get_device() instead of pci_find_device().
You need to do other things to the code to get the reference counting
logic to work properly.

Please read the documentation of pci_get_device() before doing such a
search-and-replace work on the whole tree.  In short, almost all of
these patches in these series are wrong.

thanks,

greg k-h

--===============69589826158748336==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69589826158748336==--
