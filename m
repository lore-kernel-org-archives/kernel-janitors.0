From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Thu, 07 Jan 2021 17:01:03 +0000
Subject: Re: [PATCH 2/3] powercap/drivers/dtpm: Fix some missing unlock bugs
Message-Id: <8fe7e742-56dd-f4b9-e857-7e27b8b734cc@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/V3pV//ui0rcxbs@mwanda>
In-Reply-To: <X/V3pV//ui0rcxbs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/01/2021 09:41, Dan Carpenter wrote:
> We need to unlock on these paths before returning.
>=20
> Fixes: a20d0ef97abf ("powercap/drivers/dtpm: Add API for dynamic thermal =
power management")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


> ---
>  drivers/powercap/dtpm.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
> index d49df0569cd4..470a1182b868 100644
> --- a/drivers/powercap/dtpm.c
> +++ b/drivers/powercap/dtpm.c
> @@ -147,13 +147,17 @@ static void __dtpm_add_power(struct dtpm *dtpm)
>   */
>  int dtpm_update_power(struct dtpm *dtpm, u64 power_min, u64 power_max)
>  {
> +	int ret =3D 0;
> +
>  	mutex_lock(&dtpm_lock);
> =20
>  	if (power_min =3D dtpm->power_min && power_max =3D dtpm->power_max)
> -		return 0;
> +		goto unlock;
> =20
> -	if (power_max < power_min)
> -		return -EINVAL;
> +	if (power_max < power_min) {
> +		ret =3D -EINVAL;
> +		goto unlock;
> +	}
> =20
>  	__dtpm_sub_power(dtpm);
> =20
> @@ -164,9 +168,10 @@ int dtpm_update_power(struct dtpm *dtpm, u64 power_m=
in, u64 power_max)
> =20
>  	__dtpm_add_power(dtpm);
> =20
> +unlock:
>  	mutex_unlock(&dtpm_lock);
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  /**
> @@ -187,8 +192,10 @@ int dtpm_release_zone(struct powercap_zone *pcz)
> =20
>  	mutex_lock(&dtpm_lock);
> =20
> -	if (!list_empty(&dtpm->children))
> +	if (!list_empty(&dtpm->children)) {
> +		mutex_unlock(&dtpm_lock);
>  		return -EBUSY;
> +	}
> =20
>  	if (parent)
>  		list_del(&dtpm->sibling);
>=20


--=20
<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
