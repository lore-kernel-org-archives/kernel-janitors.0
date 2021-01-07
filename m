From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Thu, 07 Jan 2021 17:03:09 +0000
Subject: Re: [PATCH 3/3] powercap/drivers/dtpm: Fix an IS_ERR() vs NULL check
Message-Id: <5cd25798-5dc1-4e8b-61a6-5a5f425f9473@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/V8zHPwlGiSxq1M@mwanda>
In-Reply-To: <X/V8zHPwlGiSxq1M@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/01/2021 10:03, Dan Carpenter wrote:
> The powercap_register_control_type() function never returns NULL, it
> returns error pointers on error so update this check.
>=20
> Fixes: a20d0ef97abf ("powercap/drivers/dtpm: Add API for dynamic thermal =
power management")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thanks for these fixes.

  --Daniel

> ---
>  drivers/powercap/dtpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
> index 470a1182b868..5a51cd34a7e8 100644
> --- a/drivers/powercap/dtpm.c
> +++ b/drivers/powercap/dtpm.c
> @@ -467,9 +467,9 @@ static int __init dtpm_init(void)
>  	struct dtpm_descr **dtpm_descr;
> =20
>  	pct =3D powercap_register_control_type(NULL, "dtpm", NULL);
> -	if (!pct) {
> +	if (IS_ERR(pct)) {
>  		pr_err("Failed to register control type\n");
> -		return -EINVAL;
> +		return PTR_ERR(pct);
>  	}
> =20
>  	for_each_dtpm_table(dtpm_descr)
>=20


--=20
<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
