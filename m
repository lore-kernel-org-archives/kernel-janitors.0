From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 08 Feb 2010 21:07:52 +0000
Subject: Re: [PATCH 6/11] drivers/dma: Correct NULL test
Message-Id: <e9c3a7c21002081307j567413adg6ed8aa04bf153e41@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1002060943220.8092@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1002060943220.8092@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>, Linus Walleij <linus.walleij@stericsson.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

[ adding Linus in case this BUG_ON had a different intent, or can be delete=
d ]

On Sat, Feb 6, 2010 at 1:43 AM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> cohd_fin has already been verified not to be NULL, so the argument to
> BUG_ON cannot be true.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r@
> expression *x;
> expression e;
> identifier l;
> @@
>
> if (x =3D NULL || ...) {
> =A0 =A0... when forall
> =A0 =A0return ...; }
> ... when !=3D goto l;
> =A0 =A0when !=3D x =3D e
> =A0 =A0when !=3D &x
> *x =3D NULL
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
> =A0drivers/dma/coh901318.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 --
> =A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
> index b5f2ee0..64a9372 100644
> --- a/drivers/dma/coh901318.c
> +++ b/drivers/dma/coh901318.c
> @@ -613,8 +613,6 @@ static void dma_tasklet(unsigned long data)
> =A0 =A0 =A0 =A0cohd_fin->pending_irqs--;
> =A0 =A0 =A0 =A0cohc->completed =3D cohd_fin->desc.cookie;
>
> - =A0 =A0 =A0 BUG_ON(cohc->nbr_active_done && cohd_fin =3D NULL);
> -
> =A0 =A0 =A0 =A0if (cohc->nbr_active_done =3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
