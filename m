From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Mon, 04 Jan 2021 14:23:44 +0000
Subject: Re: [PATCH][next] powercap/drivers/dtpm: Fix size of object being allocated
Message-Id: <ea95f420-2a2e-d0f9-9b34-e329d80bbd9d@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210104121053.33210-1-colin.king@canonical.com>
In-Reply-To: <20210104121053.33210-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/01/2021 13:10, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The kzalloc allocation for dtpm_cpu is currently allocating the size
> of the pointer and not the size of the structure. Fix this by using
> the correct sizeof argument.
>=20
> Addresses-Coverity: ("Wrong sizeof argument")
> Fixes: 0e8f68d7f048 ("powercap/drivers/dtpm: Add CPU energy model based s=
upport")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch, thanks for fixing this

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>  drivers/powercap/dtpm_cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index 6933c783c6b4..51c366938acd 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -200,7 +200,7 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
>  	if (!dtpm)
>  		return -EINVAL;
> =20
> -	dtpm_cpu =3D kzalloc(sizeof(dtpm_cpu), GFP_KERNEL);
> +	dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
>  	if (!dtpm_cpu)
>  		goto out_kfree_dtpm;
> =20
>=20


--=20
<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
