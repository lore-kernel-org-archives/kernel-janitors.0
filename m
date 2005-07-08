From: Greg KH <greg@kroah.com>
Date: Fri, 08 Jul 2005 17:19:59 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/advansys.c: Convert pci_find_device()
Message-Id: <20050708171959.GF29606@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46384867869829627=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <aa4c40ff0507071414328c64ad@mail.gmail.com>
In-Reply-To: <aa4c40ff0507071414328c64ad@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============46384867869829627==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2005 at 02:14:39PM -0700, James Lamanna wrote:
> So here's a conversion of another driver from pci_find_device() to
> pci_get_device().
> After reading Greg's earlier comments about this change, hopefully
> this is mostly correct.
> Oh and BTW, advansys.c needs a serious Lindent run and some warnings
> cleanup, but that will have to be for another day...
> This patch matches the current indentation of the file that's why
> there are spaces not tabs.
> Compile-tested but not runtime-tested.
> 
> Signed-off by: James Lamanna <jlamanna@gmail.com>
>  
> advansys.c |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/advansys.c b/drivers/scsi/advansys.c
> --- a/drivers/scsi/advansys.c
> +++ b/drivers/scsi/advansys.c
> @@ -4472,7 +4472,7 @@ advansys_detect(struct scsi_host_templat
> 
>                      /* Find all PCI cards. */
>                      while (pci_device_id_cnt < ASC_PCI_DEVICE_ID_CNT) {
> -                        if ((pci_devp = pci_find_device(ASC_PCI_VENDORID,
> +                        if ((pci_devp = pci_get_device(ASC_PCI_VENDORID,

This looks correct.


>                              pci_device_id[pci_device_id_cnt], pci_devp)) ==
>                              NULL) {
>                              pci_device_id_cnt++;
> @@ -5472,7 +5472,10 @@ advansys_release(struct Scsi_Host *shp)
>              boardp->adv_sgblkp = sgp->next_sgblkp;
>              kfree(sgp);
>          }
> -    }
> +        pci_dev_put(to_pci_dev(boardp->dvc_cfg.adv_dvc_cfg.dev));
> +    } else
> +        pci_dev_put(to_pci_dev(boardp->dvc_cfg.asc_dvc_cfg.dev));
> +

Why not just move this out of the if statement as you are doing it
either way?

Also, this driver doesn't even work, see the big #warning at the top of
it.  You might want to ask the linux-scsi list if it's obsolete.

thanks,

greg k-h

--===============46384867869829627==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46384867869829627==--
