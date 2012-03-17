From: Oliver Neukum <oliver@neukum.org>
Date: Sat, 17 Mar 2012 16:20:16 +0000
Subject: Re: [PATCH] [media] staging: Return -EINTR in s2250_probe() if fails to get lock.
Message-Id: <201203171720.16945.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331915038-11231-1-git-send-email-santoshprasadnayak@gmail.com> <201203161859.35104.oliver@neukum.org> <CAOD=uF6wD1sx2=Rk3ZaxtykBR32_GMsHmiuXuAQP2U_=c-Ytbw@mail.gmail.com>
In-Reply-To: <CAOD=uF6wD1sx2=Rk3ZaxtykBR32_GMsHmiuXuAQP2U_=c-Ytbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: santosh prasad nayak <santoshprasadnayak@gmail.com>
Cc: mchehab@infradead.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Samstag, 17. M=E4rz 2012, 17:00:36 schrieb santosh prasad nayak:
> Oliver,
>=20
> The following changes are for review only  not a formal patch.
>=20
> -------------------------------------------------------------------------=
------------------------------------
> -       if (mutex_lock_interruptible(&usb->i2c_lock) =3D 0) {
> +       mutex_lock(&usb->i2c_lock);
>                 data =3D kzalloc(16, GFP_KERNEL);
> -               if (data !=3D NULL) {
> +               if(data =3D NULL) {
> +                       i2c_unregister_device(audio);
> +                       kfree(state);
> +                       return -ENOMEM;
> +               } else {
>                         int rc;
>                         rc =3D go7007_usb_vendor_request(go, 0x41, 0, 0,
>                                                        data, 16, 1);
> @@ -657,7 +661,7 @@ static int s2250_probe(struct i2c_client *client,
>                         kfree(data);
>                 }
>                 mutex_unlock(&usb->i2c_lock);
> -       }
> +
>=20
> ----------------------------------------------------------------------
>=20
>=20
> Is it ok ?

Hi,

well done. That's correct.

	Regards
		Oliver
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
