From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?=  <siglesias@igalia.com>
Date: Thu, 07 May 2020 14:34:06 +0000
Subject: Re: [PATCH -next] ipack: tpci200: fix error return code in tpci200_register()
Message-Id: <eaaa54dbe413bf3f13f08c267e6c31c497afb509.camel@igalia.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-6OhG+JRPe3bIgyHL09ni"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507094237.13599-1-weiyongjun1@huawei.com>
In-Reply-To: <20200507094237.13599-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Jens Taprogge <jens.taprogge@taprogge.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zhouyang Jia <jiazhouyang09@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: industrypack-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>


--=-6OhG+JRPe3bIgyHL09ni
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Wei,

Thanks for the patch!

Patch is,

Acked-by: Samuel Iglesias Gonsalvez <siglesias@igalia.com>

Greg, Would you mind picking this patch series through your char-misc
tree?

Thanks!

Sam

On Thu, 2020-05-07 at 09:42 +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the ioremap() error
> handling
> case instead of 0, as done elsewhere in this function.
>=20
> Fixes: 43986798fd50 ("ipack: add error handling for ioremap_nocache")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/ipack/carriers/tpci200.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/ipack/carriers/tpci200.c
> b/drivers/ipack/carriers/tpci200.c
> index 8a9c169..b5eec18 100644
> --- a/drivers/ipack/carriers/tpci200.c
> +++ b/drivers/ipack/carriers/tpci200.c
> @@ -309,6 +309,7 @@ static int tpci200_register(struct tpci200_board
> *tpci200)
>  			"(bn 0x%X, sn 0x%X) failed to map driver user
> space!",
>  			tpci200->info->pdev->bus->number,
>  			tpci200->info->pdev->devfn);
> +		res =3D -ENOMEM;
>  		goto out_release_mem8_space;
>  	}
>=20
>=20
>=20
>=20

--=-6OhG+JRPe3bIgyHL09ni
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAl60HF4ACgkQf/S6MvF9
w0NaghAAysFj+kKNNuNU7yebV5ggXMJd2UwHJkYMm3U9YUGYnzW/GFy9MA2UuQjZ
yUqjneHFo3yA5F9Ef+ZCFGXHxuEQbGTeW0v2mFrDb5JlyMWKHDqBkCDu1h1Y6TJ8
ty4whqUPQpgPOB6DurAur8todoKlxwAXyTpLcX63LF4zXGoojKLczsuVXoFJXVIJ
6s1JlITIaLNDf0kFX6ql5HTsL6Lg+WRl6wmls37YlPzq04C2EA9gPeN5xCTw6hlp
7t4qTLnY8sh7ZvEA2TsAPkHBICfW3uN2CsuMs9h4fDlD5qijrGElw6NntzctxjZf
EfCvVlpMY9Ac2FHTpfYb6ipUI+bqOd0winx1pE0ilnoc/K8lPYaTSpy43fhlUi8X
EPIlcWEvEwtDm2UDnoassPJzUDuKUHpYkfCvbsZPd576AagoF/F1XvcnIIAiwLkC
dxr04EsVpIaCdvdXRHM4zFfff2g9OEgEGQ4yrGcW6iYD9xrWmv2XsEBuBcwM1EEc
uxpovOBUUbyYHsqvB1wJ7Le3v0sfnqRw1xDpxNNOl52RaGL/2ElL7NZFOmryRYbi
LV8YxTfTstEZS7s7LFwsAAQXzUjqSkSuaQFCYWveCk1+PvoRu0coKq/NB0W5O1TG
dT6dacdPb19LFVL/KayLG+14LRlmKW/6PcbL1HKbNWyr5ok6QBs=
=0aD1
-----END PGP SIGNATURE-----

--=-6OhG+JRPe3bIgyHL09ni--
