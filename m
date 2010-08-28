From: David Brownell <david-b@pacbell.net>
Date: Sat, 28 Aug 2010 18:24:24 +0000
Subject: Re: [PATCH 2/7] drivers/usb/gadget/amd5536udc.c: Remove double test
Message-Id: <634098.18332.qm@web180309.mail.gq1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1008281846170.13508@ask.diku.dk>
References: <Pine.LNX.4.64.1008281846170.13508@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008281846170.13508@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Julia Lawall <julia@diku.dk>
Cc: Thomas Dahlmann <dahlmann.thomas@arcor.de>, kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org



--- On Sat, 8/28/10, Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> Subject: Re: [PATCH 2/7] drivers/usb/gadget/amd5536udc.c: Remove double t=
est
> To: "Dan Carpenter" <error27@gmail.com>
> Cc: "Thomas Dahlmann" <dahlmann.thomas@arcor.de>, kernel-janitors@vger.ke=
rnel.org, "David Brownell" <dbrownell@users.sourceforge.net>, "Greg Kroah-H=
artman" <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.k=
ernel.org, linux-kernel@vger.kernel.org
> Date: Saturday, August 28, 2010, 9:48 AM
> The same expression is tested twice
> and the result is the same each time.
> Instead test for use_dma_ppb as in the test above.
>=20
> The sematic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @expression@
> expression E;
> @@
>=20
> (
> * E
> =A0 || ... || E
> |
> * E
> =A0 && ... && E
> )
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>


OK by me unless the maintainer/author objects.

Thank you!

- Dave



>=20
> ---
>  drivers/usb/gadget/amd5536udc.c |=A0 =A0 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/amd5536udc.c
> b/drivers/usb/gadget/amd5536udc.c
> index 731150d..6c40c99 100644
> --- a/drivers/usb/gadget/amd5536udc.c
> +++ b/drivers/usb/gadget/amd5536udc.c
> @@ -203,7 +203,7 @@ static void print_regs(struct udc
> *dev)
>  =A0=A0=A0 =A0=A0=A0 DBG(dev, "DMA
> mode=A0 =A0 =A0=A0=A0=3D PPBNDU (packet per
> buffer "
>  =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> "WITHOUT desc. update)\n");
>  =A0=A0=A0 =A0=A0=A0
> dev_info(&dev->pdev->dev, "DMA mode (%s)\n",
> "PPBNDU");
> -=A0=A0=A0 } else if (use_dma &&
> use_dma_ppb_du && use_dma_ppb_du) {
> +=A0=A0=A0 } else if (use_dma &&
> use_dma_ppb && use_dma_ppb_du) {
>  =A0=A0=A0 =A0=A0=A0 DBG(dev, "DMA
> mode=A0 =A0 =A0=A0=A0=3D PPBDU (packet per
> buffer "
>  =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> "WITH desc. update)\n");
>  =A0=A0=A0 =A0=A0=A0
> dev_info(&dev->pdev->dev, "DMA mode (%s)\n",
> "PPBDU");
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
