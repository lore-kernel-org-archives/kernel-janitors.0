From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:48:45 +0000
Subject: Re: [KJ] [PATCH 4/18] drivers/ide/ remove pci_find_{device, subsys}
Message-Id: <20050214184845.GU7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32492533982186522=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141112.50114.amitg@calsoftinc.com>
In-Reply-To: <200502141112.50114.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============32492533982186522==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:12:48AM +0530, Amit Gud wrote:
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
> diff -uprN orig/drivers/ide/pci/alim15x3.c linux-2.6.11-rc3/drivers/ide/pci/alim15x3.c
> --- orig/drivers/ide/pci/alim15x3.c	2005-02-11 15:19:43.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/ide/pci/alim15x3.c	2005-02-14 05:16:10.000000000 +0530
> @@ -591,7 +591,7 @@ static unsigned int __init init_chipset_
>  
>  	pci_read_config_byte(dev, PCI_REVISION_ID, &m5229_revision);
>  
> -	isa_dev = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
> +	isa_dev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
>  
>  #if defined(DISPLAY_ALI_TIMINGS) && defined(CONFIG_PROC_FS)
>  	if (!ali_proc) {

No, this is incorrect, please do not apply.

greg k-h

--===============32492533982186522==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32492533982186522==--
