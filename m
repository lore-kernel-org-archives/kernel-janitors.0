From: Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>
Date: Wed, 19 Jan 2005 10:58:21 +0000
Subject: [KJ] Re: [PATCH] drivers/ide/pci/generic.c fix return code value
Message-Id: <200501191158.21324.bzolnier@elka.pw.edu.pl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8575293332361742=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8575293332361742==
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 19 January 2005 07:10, Amit Gud wrote:
> Description: The patch follows from the suggestions by AC and Felipe W
> Damasio for fixing the return codes from IDE drivers.
> 
> Do consider applying.

Thanks but this is already fixed in 2.6.11-rc1.

> Signed-off-by: Amit Gud <gud@eth.net>
> 
> --- vanilla-2.6.10/drivers/ide/pci/generic.c    2005-01-19
> 11:19:28.000000000 +0530
> +++ linux-2.6.9/drivers/ide/pci/generic.c       2005-01-19
> 11:15:36.000000000 +0530
> @@ -100,18 +100,18 @@
>         if (dev->vendor == PCI_VENDOR_ID_UMC &&
>             dev->device == PCI_DEVICE_ID_UMC_UM8886A &&
>             (!(PCI_FUNC(dev->devfn) & 1)))
> -               return 1; /* UM8886A/BF pair */
> +               return -EAGAIN; /* UM8886A/BF pair */
> 
>         if (dev->vendor == PCI_VENDOR_ID_OPTI &&
>             dev->device == PCI_DEVICE_ID_OPTI_82C558 &&
>             (!(PCI_FUNC(dev->devfn) & 1)))
> -               return 1;
> +               return -EAGAIN;
> 
>         pci_read_config_word(dev, PCI_COMMAND, &command);
>         if(!(command & PCI_COMMAND_IO))
>         {
>                 printk(KERN_INFO "Skipping disabled %s IDE
> controller.\n", d->name);
> -               return 1;
> +               return -EAGAIN;
>         }
>         ide_setup_pci_device(dev, d);
>         return 0;
> 
> 
> 
> 

--===============8575293332361742==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8575293332361742==--
