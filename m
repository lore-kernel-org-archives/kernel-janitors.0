From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Thu, 07 Jan 2021 16:59:37 +0000
Subject: Re: [PATCH 1/3] powercap/drivers/dtpm: Fix a double shift bug
Message-Id: <3723a63e-5c3f-9c15-2e2c-788e7e6ec0bf@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/V2k8dwaXJH6VFh@mwanda>
In-Reply-To: <X/V2k8dwaXJH6VFh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/01/2021 09:36, Dan Carpenter wrote:
> The DTPM_POWER_LIMIT_FLAG is used for test_bit() etc which take a bit
> number so it should be bit 0.  But currently it's set to BIT(0) then
> that is double shifted equivalent to BIT(BIT(0)).  This doesn't cause a
> run time problem because it's done consistently.
>=20
> Fixes: a20d0ef97abf ("powercap/drivers/dtpm: Add API for dynamic thermal =
power management")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>  drivers/powercap/dtpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
> index 0abcc439d728..d49df0569cd4 100644
> --- a/drivers/powercap/dtpm.c
> +++ b/drivers/powercap/dtpm.c
> @@ -24,7 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
> =20
> -#define DTPM_POWER_LIMIT_FLAG BIT(0)
> +#define DTPM_POWER_LIMIT_FLAG 0
> =20
>  static const char *constraint_name[] =3D {
>  	"Instantaneous",
>=20


--=20
<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
