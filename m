From: Julia Lawall <julia@diku.dk>
Date: Sat, 21 Nov 2009 21:44:08 +0000
Subject: Re: [PATCH 7/8] drivers/dma: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0911212243420.28848@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-1799644698-1258839848=:28848"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911211252180.23681@ask.diku.dk>
 <e9c3a7c20911211321x4f87f616ya6bf7561ff5748f@mail.gmail.com>
In-Reply-To: <e9c3a7c20911211321x4f87f616ya6bf7561ff5748f@mail.gmail.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: maciej.sosnowski@intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-1799644698-1258839848=:28848
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Nov 2009, Dan Williams wrote:

> On Sat, Nov 21, 2009 at 4:52 AM, Julia Lawall <julia@diku.dk> wrote:
> > From: Julia Lawall <julia@diku.dk>
> >
> > Error handling code following a kzalloc should free the allocated data.
> >
>=20
> Yes, but there is another buglet here:
>=20
> > =A0 =A0 =A0 =A0/* get platform data */
> > =A0 =A0 =A0 =A0if (!pdev->dev.platform_data)
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto shdev_err;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto platform_err;
>=20
> "err" is still zero at this point so the probe does not fail.
>=20
> How about the following instead?

OK, that is indeed both better and simpler.

thanks,
julia


> diff --git a/drivers/dma/shdma.c b/drivers/dma/shdma.c
> index b3b065c..034ecf0 100644
> --- a/drivers/dma/shdma.c
> +++ b/drivers/dma/shdma.c
> @@ -640,17 +640,16 @@ static int __init sh_dmae_probe(struct
> platform_device *pdev)
>  #endif
>         struct sh_dmae_device *shdev;
>=20
> +       /* get platform data */
> +       if (!pdev->dev.platform_data)
> +               return -ENODEV;
> +
>         shdev =3D kzalloc(sizeof(struct sh_dmae_device), GFP_KERNEL);
>         if (!shdev) {
>                 dev_err(&pdev->dev, "No enough memory\n");
> -               err =3D -ENOMEM;
> -               goto shdev_err;
> +               return -ENOMEM;
>         }
>=20
> -       /* get platform data */
> -       if (!pdev->dev.platform_data)
> -               goto shdev_err;
> -
>         /* platform data */
>         memcpy(&shdev->pdata, pdev->dev.platform_data,
>                         sizeof(struct sh_dmae_pdata));
> @@ -722,7 +721,6 @@ eirq_err:
>  rst_err:
>         kfree(shdev);
>=20
> -shdev_err:
>         return err;
>  }
>=20
---511516320-1799644698-1258839848=:28848--
