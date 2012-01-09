From: Martin Peres <martin.peres@ensi-bourges.fr>
Date: Mon, 09 Jan 2012 23:28:13 +0000
Subject: Re: [patch] drm/nv50/pm: signedness bug in nv50_pm_clocks_pre()
Message-Id: <4F0B780D.1080804@ensi-bourges.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120104072047.GE30978@elgon.mountain>
In-Reply-To: <20120104072047.GE30978@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

Le 04/01/2012 08:20, Dan Carpenter a =E9crit :
> calc_mclk() returns zero on success and negative on failure but clk is
> a u32.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/=
nv50_pm.c
> index 0393721..3508de9 100644
> --- a/drivers/gpu/drm/nouveau/nv50_pm.c
> +++ b/drivers/gpu/drm/nouveau/nv50_pm.c
> @@ -540,7 +540,7 @@ nv50_pm_clocks_pre(struct drm_device *dev, struct nou=
veau_pm_level *perflvl)
>   	info->mclk_hwsq.len =3D 0;
>   	if (perflvl->memory) {
>   		clk =3D calc_mclk(dev, perflvl->memory,&info->mclk_hwsq);
> -		if (clk<  0) {
> +		if ((int)clk<  0) {
>   			ret =3D clk;
>   			goto error;
>   		}
Well spotted Dan!

Sorry for the late answer, was busy reworking this file for safe reclocking.

I have a slightly different fix for that. Please tell me if It suits=20
you:=20
https://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commit/c1b80360ezd1=
aa7dd780ac383aae9437c66ef3b89
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
