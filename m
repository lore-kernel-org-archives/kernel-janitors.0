From: Pawel Moll <pawel.moll@arm.com>
Date: Fri, 08 Nov 2013 12:42:54 +0000
Subject: Re: [patch] clk: vexpress: NULL dereference on error path
Message-Id: <1383914574.3226.0.camel@hornet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107080844.GR21844@elgon.mountain>
In-Reply-To: <20131107080844.GR21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Thu, 2013-11-07 at 08:08 +0000, Dan Carpenter wrote:
> If the allocation fails then we dereference the NULL in the error path.
> Just return directly.
>=20
> Fixes: ed27ff1db869 ('clk: Versatile Express clock generators ("osc") dri=
ver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versa=
tile/clk-vexpress-osc.c
> index 2dc8b41..a535c7b 100644
> --- a/drivers/clk/versatile/clk-vexpress-osc.c
> +++ b/drivers/clk/versatile/clk-vexpress-osc.c
> @@ -102,7 +102,7 @@ void __init vexpress_osc_of_setup(struct device_node =
*node)
> =20
>  	osc =3D kzalloc(sizeof(*osc), GFP_KERNEL);
>  	if (!osc)
> -		goto error;
> +		return;
> =20
>  	osc->func =3D vexpress_config_func_get_by_node(node);
>  	if (!osc->func) {

Well spotted, thanks!

Will get it queued with other vexpress clk changes.

Pawe=C5=82


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
