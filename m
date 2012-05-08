From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Tue, 08 May 2012 00:26:40 +0000
Subject: Re: [patch] xhci: testing sizeof xhci_doorbell_array 2 time
Message-Id: <20120508002640.GA10340@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAMC5Lb4bMfqnWuvzcisGNV-uM08vHJMLt8X+mYmOp0P6RzqtrA@mail.gmail.com>
In-Reply-To: <CAMC5Lb4bMfqnWuvzcisGNV-uM08vHJMLt8X+mYmOp0P6RzqtrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: girish verma <girish.gcet@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org

Hi Girish,

Although this is a pretty trivial change, can you please Cc the
maintainer of the driver (me, for the xHCI driver) next time?  Either
check the MAINTAINERS file, or run scripts/get_maintainer.pl.

In any case, I see no problem with this patch.  Greg's already taken it
anyway. :)

Thanks,
Sarah Sharp

On Sun, May 06, 2012 at 08:35:13PM +0530, girish verma wrote:
> Testing BUILD_BUG_ON xhci_doorbell_array structure 2 time, redundant stat=
ement
>=20
> Signed-off-by: Girish Verma <girish.gcet@gmail.com>
>=20
> =A0---
>  drivers/usb/host/xhci.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 36641a7..cfcf733 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4090,7 +4090,6 @@ static int __init xhci_hcd_init(void)
>  	BUILD_BUG_ON(sizeof(struct xhci_intr_reg) !=3D 8*32/8);
>  	/* xhci_run_regs has eight fields and embeds 128 xhci_intr_regs */
>  	BUILD_BUG_ON(sizeof(struct xhci_run_regs) !=3D (8+8*128)*32/8);
> -	BUILD_BUG_ON(sizeof(struct xhci_doorbell_array) !=3D 256*32/8);
>  	return 0;
>  unreg_pci:
>  	xhci_unregister_pci();
> --
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
