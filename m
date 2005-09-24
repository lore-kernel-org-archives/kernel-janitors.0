From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Sat, 24 Sep 2005 17:10:21 +0000
Subject: Re: [KJ] hint, hint...
Message-Id: <20050924101021.044ea79c.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70049441643465793=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050924155552.GA31609@mipter.zuzino.mipt.ru>
In-Reply-To: <20050924155552.GA31609@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============70049441643465793==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Sep 2005 19:55:52 +0400 Alexey Dobriyan wrote:

> TODO already updated. ;-)
> 
> --- a/drivers/ide/pci/piix.c
> +++ b/drivers/ide/pci/piix.c
> @@ -542,10 +542,9 @@ static void __devinit init_hwif_piix(ide
>  	}
>  
>  static ide_pci_device_t piix_pci_info[] __devinitdata = {
> -	/*  0 */ DECLARE_PIIX_DEV("PIIXa"),
> -	/*  1 */ DECLARE_PIIX_DEV("PIIXb"),
> -
> -	{	/* 2 */
> +	[ 0] = DECLARE_PIIX_DEV("PIIXa"),
> +	[ 1] = DECLARE_PIIX_DEV("PIIXb"),
> +	[ 2] = {
>  		.name		= "MPIIX",
>  		.init_hwif	= init_hwif_piix,
>  		.channels	= 2,

Even in cases where the order/location/index doesn't matter?
(I hope not.)

---
~Randy
You can't do anything without having to do something else first.
-- Belefant's Law

--===============70049441643465793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70049441643465793==--
