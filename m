From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:41:19 +0000
Subject: Re: [KJ] [PATCH 16/18] sound/oss/ remove pci_find_{device, subsys}
Message-Id: <20050214184119.GG7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84845354920463323=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141158.09192.amitg@calsoftinc.com>
In-Reply-To: <200502141158.09192.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============84845354920463323==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:58:07AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> Do consider applying.
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/sound/oss/cs46xx.c linux-2.6.11-rc3/sound/oss/cs46xx.c
> --- orig/sound/oss/cs46xx.c	2005-02-11 15:20:12.000000000 +0530
> +++ linux-2.6.11-rc3/sound/oss/cs46xx.c	2005-02-14 05:33:56.000000000 +0530
> @@ -3131,7 +3131,7 @@ static void clkrun_hack(struct cs_card *
>  	
>  	card->active+=change;
>  	
> -	acpi_dev = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
> +	acpi_dev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
>  	if(acpi_dev == NULL)
>  		return;		/* Not a thinkpad thats for sure */
>  


No, incorrect replacement.  Jeff, please do not apply.

thanks,

greg k-h

--===============84845354920463323==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84845354920463323==--
