From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Fri, 03 Nov 2017 07:37:09 +0000
Subject: Re: [PATCH] media: v4l: async: fix return of unitialized variable ret
Message-Id: <20171103073709.GD24132@bigcity.dyn.berto.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171103065827.25988-1-colin.king@canonical.com>
In-Reply-To: <20171103065827.25988-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

Thanks for your patch.

On 2017-11-03 06:58:27 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> A shadow declaration of variable ret is being assigned a return error
> status and this value is being lost when the error exit goto's jump
> out of the local scope. This leads to an uninitalized error return value
> in the outer scope being returned. Fix this by removing the inner scoped
> declaration of variable ret.
>=20
> Detected by CoverityScan, CID#1460380 ("Uninitialized scalar variable")
>=20
> Fixes: fb45f436b818 ("media: v4l: async: Fix notifier complete callback e=
rror handling")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/v4l2-core/v4l2-async.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-co=
re/v4l2-async.c
> index 49f7eccc76db..7020b2e6d158 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -550,7 +550,6 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  		struct v4l2_device *v4l2_dev >  			v4l2_async_notifier_find_v4l2_dev(n=
otifier);
>  		struct v4l2_async_subdev *asd;
> -		int ret;
> =20
>  		if (!v4l2_dev)
>  			continue;
> --=20
> 2.14.1
>=20

--=20
Regards,
Niklas S=F6derlund
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
