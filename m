From: Greg KH <greg@kroah.com>
Date: Tue, 29 Nov 2005 17:34:30 +0000
Subject: Re: [KJ] changed from pci_find_device to pci_get_device
Message-Id: <20051129173430.GA10998@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============035555437992684347=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <438A0BE0.4010904@comhem.se>
In-Reply-To: <438A0BE0.4010904@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============035555437992684347==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 29, 2005 at 02:56:09PM +0100, Daniel Marjam?ki wrote:
> 
> Hello friends!
> 
> I have reworked my patch that I sent a few days ago.
> I made huge mistakes in the previous patch but I hope this patch is perfect.

Please include the whole list of what you are changing in the patch, as
sometimes we don't remember what is supposed to be happening here :)

Also, you forgot the "Signed-off-by:" line...

> @@ -430,6 +435,8 @@ static void __devinit init_hwif_via82cxx
>  	ide_set_hwifdata(hwif, vdev);
> 
>  	vdev->via_config = via_config_find(&isa);
> +	if (isa)
> +		pci_dev_put(isa);
>  	via_cable_detect(hwif->pci_dev, vdev);

You don't have to check for NULL before calling pci_dev_put(), so you
can drop the if() check.

thanks,

greg k-h

--===============035555437992684347==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============035555437992684347==--
