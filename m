From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 29 Nov 2005 11:44:10 +0000
Subject: Re: [KJ] changed from pci_find_device to pci_get_device
Message-Id: <20051129114410.GA2573@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65630117206522876=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <438A0BE0.4010904@comhem.se>
In-Reply-To: <438A0BE0.4010904@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============65630117206522876==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 28, 2005 at 10:43:58PM +0100, Daniel Marjam?ki wrote:
> --- a/drivers/ide/pci/via82cxxx.c
> +++ b/drivers/ide/pci/via82cxxx.c
> @@ -282,7 +285,7 @@ static unsigned int __devinit init_chips
>  	via_config = via_config_find(&isa);
>  	if (!via_config->id) {
>  		printk(KERN_WARNING "VP_IDE: Unknown VIA SouthBridge,
>  		disabling DMA.\n");
> -		return -ENODEV;
> +		return ENODEV;
>  	}

I do not understand this chunk.

> @@ -430,6 +435,7 @@ static void __devinit init_hwif_via82cxx
>  	ide_set_hwifdata(hwif, vdev);
>
>  	vdev->via_config = via_config_find(&isa);
> +	if (isa) pci_dev_put(isa);
>  	via_cable_detect(hwif->pci_dev, vdev);

	if (isa)
		pci_...


--===============65630117206522876==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65630117206522876==--
