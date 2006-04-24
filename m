From: Greg KH <greg@kroah.com>
Date: Mon, 24 Apr 2006 16:54:31 +0000
Subject: Re: [KJ] [PATCH] Cleanup of portdrv_pci.c
Message-Id: <20060424165431.GA17018@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============048293904385240616=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CFCAD.8020002@nachtwindheim.de>
In-Reply-To: <444CFCAD.8020002@nachtwindheim.de>
To: kernel-janitors@vger.kernel.org

--===============048293904385240616==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2006 at 06:28:29PM +0200, Henne wrote:
> From: Henrik Kretzschmar <henne@nachtwindheim.de>
> 
> Marking the pci_device_id table of portdrv_pci.c as __devinitdata and
> making save/resore_config() dependend tp CONFIG_PM
> Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
> ---
> 
> --- linux-2.6.17-rc2/drivers/pci/pcie/portdrv_pci.c	2006-04-24 
> 13:31:00.000000000 +0200
> +++ linux_test/drivers/pci/pcie/portdrv_pci.c	2006-04-24 
> 18:20:29.000000000 +0200
> @@ -30,6 +30,7 @@
>  /* global data */
>  static const char device_name[] = "pcieport-driver";
> 
> +#ifdef CONFIG_PM

No, please no ifdefs in .c files if you can help it.

thanks,

greg k-h

--===============048293904385240616==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============048293904385240616==--
