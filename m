From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:42:28 +0000
Subject: Re: [KJ] [PATCH 18/18] arch/ remove pci_find_{device, subsys}
Message-Id: <20050214184228.GI7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18926158653532066=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141205.46515.amitg@calsoftinc.com>
In-Reply-To: <200502141205.46515.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============18926158653532066==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 12:05:42PM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> Do consider applying.
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/arch/alpha/kernel/sys_alcor.c linux-2.6.11-rc3/arch/alpha/kernel/sys_alcor.c
> --- orig/arch/alpha/kernel/sys_alcor.c	2005-01-20 20:06:07.000000000 +0530
> +++ linux-2.6.11-rc3/arch/alpha/kernel/sys_alcor.c	2005-02-14 00:02:35.000000000 +0530
> @@ -254,7 +254,7 @@ alcor_init_pci(void)
>  	 * motherboard, by looking for a 21040 TULIP in slot 6, which is
>  	 * built into XLT and BRET/MAVERICK, but not available on ALCOR.
>  	 */
> -	dev = pci_find_device(PCI_VENDOR_ID_DEC,
> +	dev = pci_get_device(PCI_VENDOR_ID_DEC,
>  			      PCI_DEVICE_ID_DEC_TULIP,
>  			      NULL);
>  	if (dev && dev->devfn == PCI_DEVFN(6,0)) {

Nope, incorrect usage, please do not apply.

greg k-h

--===============18926158653532066==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18926158653532066==--
