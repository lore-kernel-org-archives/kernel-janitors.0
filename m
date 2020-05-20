From: Paul Cercueil <paul@crapouillou.net>
Date: Wed, 20 May 2020 14:47:10 +0000
Subject: Re: [PATCH] remoteproc: Fix an error code in devm_rproc_alloc()
Message-Id: <M2XMAQ.69YYPQMEVN31@crapouillou.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520120705.GH172354@mwanda>
In-Reply-To: <20200520120705.GH172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Le mer. 20 mai 2020 =E0 15:07, Dan Carpenter <dan.carpenter@oracle.com>=20
a =E9crit :
> The comments say that this function should return NULL on error and=20
> the
> caller expects NULL returns as well so I have modified the code to=20
> match.
> Returning an ERR_PTR(-ENOMEM) would lead to an OOps.
>=20
> Fixes: 305ac5a766b1 ("remoteproc: Add device-managed variants of=20
> rproc_alloc/rproc_add")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Alright, makes sense.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c=20
> b/drivers/remoteproc/remoteproc_core.c
> index 0cc015fabf78..9f04c30c4aaf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2297,7 +2297,7 @@ struct rproc *devm_rproc_alloc(struct device=20
> *dev, const char *name,
>=20
>  	ptr =3D devres_alloc(devm_rproc_free, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>=20
>  	rproc =3D rproc_alloc(dev, name, ops, firmware, len);
>  	if (rproc) {
> --
> 2.26.2
>=20
