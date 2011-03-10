From: huajun li <huajun.li.lee@gmail.com>
Date: Thu, 10 Mar 2011 10:03:08 +0000
Subject: Re: [patch] USB: ene_ub6250: fix memory leak in ene_load_bincode()
Message-Id: <AANLkTinTjWk7yQmf_cLe5XSuZht=grAzHZV0SzK0Ogp7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110310083133.GL3416@bicker>
In-Reply-To: <20110310083133.GL3416@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Yes, you are right, thanks. :)

Thanks,
--huajun

2011/3/10 Dan Carpenter <error27@gmail.com>:
> "buf" gets allocated twice in a row. =A0It's the second allocation which
> is correct. =A0The first one should be removed.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_u=
b6250.c
> index 058c5d5..08e0374 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -491,10 +491,6 @@ static int ene_load_bincode(struct us_data *us, unsi=
gned char flag)
> =A0 =A0 =A0 =A0if (info->BIN_FLAG =3D flag)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return USB_STOR_TRANSPORT_GOOD;
>
> - =A0 =A0 =A0 buf =3D kmalloc(ENE_BIN_CODE_LEN, GFP_KERNEL);
> - =A0 =A0 =A0 if (buf =3D NULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return USB_STOR_TRANSPORT_ERROR;
> -
> =A0 =A0 =A0 =A0switch (flag) {
> =A0 =A0 =A0 =A0/* For SD */
> =A0 =A0 =A0 =A0case SD_INIT1_PATTERN:
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
