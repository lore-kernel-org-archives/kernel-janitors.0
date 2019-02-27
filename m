From: Andrzej Hajda <a.hajda@samsung.com>
Date: Wed, 27 Feb 2019 12:20:36 +0000
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: make const array static
Message-Id: <a10c5be3-9223-a1b7-a3d5-22d7ec6542eb@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20190226165938epcas2p2aba05bf0a7b1b992ff2f71c0bfcffb6a@epcas2p2.samsung.com>
        <20190226165932.17528-1-colin.king@canonical.com>
In-Reply-To: <20190226165932.17528-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 26.02.2019 17:59, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the const array ti_sn_bridge_supply_names on the
> stack but instead make it static.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

=C2=A0--
Regards
Andrzej
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index f72ee137e5f1..4c2ca4e39be5 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -211,7 +211,7 @@ static struct ti_sn_bridge *bridge_to_ti_sn_bridge(st=
ruct drm_bridge *bridge)
>  static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
>  {
>  	unsigned int i;
> -	const char * const ti_sn_bridge_supply_names[] =3D {
> +	static const char * const ti_sn_bridge_supply_names[] =3D {
>  		"vcca", "vcc", "vccio", "vpll",
>  	};
> =20
