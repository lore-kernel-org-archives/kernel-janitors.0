From: Greg KH <greg@kroah.com>
Date: Tue, 25 Apr 2006 21:16:29 +0000
Subject: Re: [KJ] [PATCH] cleanup of PCIE-portbus driver
Message-Id: <20060425211629.GA11944@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61901202540398892=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <444DCB35.1060208@nachtwindheim.de>
In-Reply-To: <444DCB35.1060208@nachtwindheim.de>
To: kernel-janitors@vger.kernel.org

--===============61901202540398892==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 25, 2006 at 09:09:41AM +0200, Henne wrote:
> From: Henrik Kretzschmar <henne@nachtwindheim.de>
> 
> Marking the pci_device_id table of portdrv_pci.c as __devinitdata and
> making save/resore_config() dependend to CONFIG_PM
> Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
> ---
> 
> --- linux-2.6.17-rc2/drivers/pci/pcie/portdrv_pci.c	2006-04-24 
> 13:31:00.000000000 +0200
> +++ linux/drivers/pci/pcie/portdrv_pci.c	2006-04-25 
> 09:04:42.000000000 +0200

All of your patches are line-wrapped and can not be applied :(

thanks,

greg k-h

--===============61901202540398892==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61901202540398892==--
