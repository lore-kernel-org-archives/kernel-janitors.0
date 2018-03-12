From: Marcel Holtmann <marcel@holtmann.org>
Date: Mon, 12 Mar 2018 16:18:31 +0000
Subject: Re: [PATCH 1/5] Bluetooth: btmrvl: Use common error handling code in btmrvl_sdio_register_dev()
Message-Id: <EE3DFCC7-3B51-43B6-A28B-3102F55479AA@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8d050f76-aed1-7b6b-8778-a78aef34d4ea@users.sourceforge.net>
 <5c3361c6-ef1d-b919-8817-05c2c98fb2ef@users.sourceforge.net>
In-Reply-To: <5c3361c6-ef1d-b919-8817-05c2c98fb2ef@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-bluetooth@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,

> Adjust a jump target so that a bit of exception handling can be better
> reused at the end of this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/bluetooth/btmrvl_sdio.c | 50 ++++++++++++++++--------------------=
-----
> 1 file changed, 19 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/bluetooth/btmrvl_sdio.c b/drivers/bluetooth/btmrvl_s=
dio.c
> index 0f020254fd39..df2a04bd8428 100644
> --- a/drivers/bluetooth/btmrvl_sdio.c
> +++ b/drivers/bluetooth/btmrvl_sdio.c
> @@ -949,31 +949,24 @@ static int btmrvl_sdio_register_dev(struct btmrvl_s=
dio_card *card)
> 	ret =3D sdio_set_block_size(card->func, SDIO_BLOCK_SIZE);
> 	if (ret) {
> 		BT_ERR("cannot set SDIO block size");
> -		ret =3D -EIO;
> -		goto release_irq;
> +		goto release_with_eio;
> 	}
>=20
> 	reg =3D sdio_readb(func, card->reg->io_port_0, &ret);
> -	if (ret < 0) {
> -		ret =3D -EIO;
> -		goto release_irq;
> -	}
> +	if (ret < 0)
> +		goto release_with_eio;
>=20
> 	card->ioport =3D reg;
>=20
> 	reg =3D sdio_readb(func, card->reg->io_port_1, &ret);
> -	if (ret < 0) {
> -		ret =3D -EIO;
> -		goto release_irq;
> -	}
> +	if (ret < 0)
> +		goto release_with_eio;
>=20
> 	card->ioport |=3D (reg << 8);
>=20
> 	reg =3D sdio_readb(func, card->reg->io_port_2, &ret);
> -	if (ret < 0) {
> -		ret =3D -EIO;
> -		goto release_irq;
> -	}
> +	if (ret < 0)
> +		goto release_with_eio;
>=20
> 	card->ioport |=3D (reg << 16);
>=20
> @@ -981,26 +974,20 @@ static int btmrvl_sdio_register_dev(struct btmrvl_s=
dio_card *card)
>=20
> 	if (card->reg->int_read_to_clear) {
> 		reg =3D sdio_readb(func, card->reg->host_int_rsr, &ret);
> -		if (ret < 0) {
> -			ret =3D -EIO;
> -			goto release_irq;
> -		}
> +		if (ret < 0)
> +			goto release_with_eio;
> +
> 		sdio_writeb(func, reg | 0x3f, card->reg->host_int_rsr, &ret);
> -		if (ret < 0) {
> -			ret =3D -EIO;
> -			goto release_irq;
> -		}
> +		if (ret < 0)
> +			goto release_with_eio;
>=20
> 		reg =3D sdio_readb(func, card->reg->card_misc_cfg, &ret);
> -		if (ret < 0) {
> -			ret =3D -EIO;
> -			goto release_irq;
> -		}
> +		if (ret < 0)
> +			goto release_with_eio;
> +
> 		sdio_writeb(func, reg | 0x10, card->reg->card_misc_cfg, &ret);
> -		if (ret < 0) {
> -			ret =3D -EIO;
> -			goto release_irq;
> -		}
> +		if (ret < 0)
> +			goto release_with_eio;
> 	}
>=20
> 	sdio_set_drvdata(func, card);
> @@ -1009,7 +996,8 @@ static int btmrvl_sdio_register_dev(struct btmrvl_sd=
io_card *card)
>=20
> 	return 0;
>=20
> -release_irq:
> +release_with_eio:
> +	ret =3D -EIO;
> 	sdio_release_irq(func);
>=20
> disable_func:

please do not send me any patches with renaming goto labels. I dislike long=
 goto labels anyway and it doesn=E2=80=99t make it any better in mind.

In addition, this patch is half baked. If you want to do something, then yo=
u replace all err =3D -EIO and use this.

release_irq:
        sdio_release_irq(func);

disable_func:
        sdio_disable_func(func);

release_host:
        sdio_release_host(func);

	return -EIO;

And replace goto failed with return -EINVAL;

Regards

Marcel

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
