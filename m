From: Pawel Moll <pawel.moll@arm.com>
Date: Wed, 11 Jun 2014 10:33:20 +0000
Subject: Re: [patch v2] mfd: vexpress: fix error handling vexpress_syscfg_regmap_init()
Message-Id: <1402482800.3523.20.camel@hornet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611101740.GA13148@mwanda>
In-Reply-To: <20140611101740.GA13148@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, 2014-06-11 at 11:17 +0100, Dan Carpenter wrote:
> This function should be returning an ERR_PTR() on failure instead of
> NULL.  Also there is a use after free bug if regmap_init() fails because
> we free "func" and then dereference doing the return.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/misc/vexpress-syscfg.c b/drivers/misc/vexpress-syscf=
g.c
> index 73068e5..3250fc1 100644
> --- a/drivers/misc/vexpress-syscfg.c
> +++ b/drivers/misc/vexpress-syscfg.c
> @@ -199,7 +199,7 @@ static struct regmap *vexpress_syscfg_regmap_init(str=
uct device *dev,
>  	func =3D kzalloc(sizeof(*func) + sizeof(*func->template) * num,
>  			GFP_KERNEL);
>  	if (!func)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> =20
>  	func->syscfg =3D syscfg;
>  	func->num_templates =3D num;
> @@ -231,10 +231,14 @@ static struct regmap *vexpress_syscfg_regmap_init(s=
truct device *dev,
>  	func->regmap =3D regmap_init(dev, NULL, func,
>  			&vexpress_syscfg_regmap_config);
> =20
> -	if (IS_ERR(func->regmap))
> +	if (IS_ERR(func->regmap)) {
> +		void *err =3D func->regmap;
> +
>  		kfree(func);
> -	else
> -		list_add(&func->list, &syscfg->funcs);
> +		return err;
> +	}
> +
> +	list_add(&func->list, &syscfg->funcs);
> =20
>  	return func->regmap;
>  }

Uh, right. Dereferencing a freed structure. My bad. Thanks for spotting
this!

Acked-by: Pawel Moll <pawel.moll@arm.com>

(nit: the subject should be "misc: vexpress:" rather then "mfd:")

Arnd, Olof, can you pick this one as an early fix or do you want me to
queue it for rc1-based fixes branch?

Pawe=C5=82

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
