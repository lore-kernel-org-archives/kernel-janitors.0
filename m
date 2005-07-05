From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 05 Jul 2005 22:11:41 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qla1280.c: pci_get_device instead of
Message-Id: <200507060211.42028.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbecb30405070514134ebef46@mail.gmail.com>
In-Reply-To: <cbecb30405070514134ebef46@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 06 July 2005 01:13, Rodrigo Nascimento wrote:
> This patch changes the pci_find_device to pci_get_device.
> Please correct me, whether it's wrong. It is my first patch. :)

Thanks. It looks good except trivially fixable issues:
1. Long lines are wrapped.
2. Tabs are converted to spaces.

If you're using Gmail web-interface and copy-pasting patch, stop now. ;-) If
you're using email program, tune it a little.

> #

You can hack in your home directory. Much safer. You need root privileges
only when installing new kernel.

> diff -urpN /usr/src/linux/drivers/scsi/qla1280.c 
> /usr/src/linux-kj/drivers/scsi/qla1280.c
> --- /usr/src/linux/drivers/scsi/qla1280.c       2005-06-22
> 16:33:05.000000000 -0300
> +++ /usr/src/linux-kj/drivers/scsi/qla1280.c    2005-07-05
> 17:55:24.000000000 -0300

Patches are supposed to be "patch -p1" compliant. Paths should be
relative:

	--- linux/drivers/scsi/qla1280.c
	+++ linux-kj/drivers/scsi/qla1280.c

> @@ -1196,7 +1196,7 @@ qla1280_detect(Scsi_Host_Template *templ
>  #endif
> 
>         /* First Initialize QLA12160 on PCI Bus 1 Dev 2 */
> -       while ((pdev = pci_find_device(id->vendor, id->device, pdev))) {
> +       while ((pdev = pci_get_device(id->vendor, id->device, pdev))) {
>                 if (pdev->bus->number = 1 && PCI_SLOT(pdev->devfn) = 2) {
>                         if (!qla1280_probe_one(pdev, id))
>                                 num_hosts++;
> @@ -1206,7 +1206,7 @@ qla1280_detect(Scsi_Host_Template *templ
>         pdev = NULL;
>         /* Try and find each different type of adapter we support */
>         for (id = &qla1280_pci_tbl[0]; id->device; id++) {
> -               while ((pdev = pci_find_device(id->vendor, id->device, pdev))) {
> +               while ((pdev = pci_get_device(id->vendor, id->device, pdev))) {
>                         /*
>                          * skip QLA12160 already initialized on
>                          * PCI Bus 1 Dev 2 since we already initialized
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
