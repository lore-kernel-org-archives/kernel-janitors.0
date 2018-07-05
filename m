From: Andrzej Hajda <a.hajda@samsung.com>
Date: Thu, 05 Jul 2018 10:29:04 +0000
Subject: Re: [PATCH] drm/panel: type promotion bug in s6e8aa0_read_mtp_id()
Message-Id: <20180705102905eucas1p1a50751d32ab9ad816e438e668755827b~_ckDBVPFR2442324423eucas1p1I@eucas1p1.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180704093825epcas5p3942c2cb6586f11a2f6607cd8fc9492a6@epcas5p3.samsung.com>
 <20180704093807.s3lqsb2v6dg2k43d@kili.mountain>
In-Reply-To: <20180704093807.s3lqsb2v6dg2k43d@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On 04.07.2018 11:38, Dan Carpenter wrote:
> The ARRAY_SIZE() macro is type size_t.  If s6e8aa0_dcs_read() returns a
> negative error code, then "ret < ARRAY_SIZE(id)" is false because the
> negative error code is type promoted to a high positive value.
>
> Fixes: 02051ca06371 ("drm/panel: add S6E8AA0 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/=
drm/panel/panel-samsung-s6e8aa0.c
> index a188a3959f1a..6ad827b93ae1 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> @@ -823,7 +823,7 @@ static void s6e8aa0_read_mtp_id(struct s6e8aa0 *ctx)
>  	int ret, i;
> =20
>  	ret =3D s6e8aa0_dcs_read(ctx, 0xd1, id, ARRAY_SIZE(id));
> -	if (ret < ARRAY_SIZE(id) || id[0] =3D 0x00) {
> +	if (ret < 0 || ret < ARRAY_SIZE(id) || id[0] =3D 0x00) {
>  		dev_err(ctx->dev, "read id failed\n");
>  		ctx->error =3D -EIO;
>  		return;
>
>
>

Thanks for the fix.


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

=C2=A0--
Regards
Andrzej

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
