From: Andrzej Hajda <a.hajda@samsung.com>
Date: Fri, 07 Jun 2019 09:43:00 +0000
Subject: Re: [PATCH 2/2] drm/bridge: sii902x: fix a signedness bug in sii902x_audio_codec_init()
Message-Id: <cd974289-db19-5e80-bd64-4b5f05dcb845@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20190607072751epcas1p1e28023f2b62a6d052a19e4c0558188e1@epcas1p1.samsung.com>
 <20190607072727.GB25229@mwanda>
In-Reply-To: <20190607072727.GB25229@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jyri Sarha <jsarha@ti.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>

On 07.06.2019 09:27, Dan Carpenter wrote:
> The "num_lanes" variable needs to be signed for the error handling to
> work.  The "i" variable can be a regular int as well.
>
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Colin send already fix for this.


Regards

Andrzej


> ---
>  drivers/gpu/drm/bridge/sii902x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 6b03616d6bc3..dd7aa466b280 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -719,7 +719,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
>  		.max_i2s_channels = 0,
>  	};
>  	u8 lanes[4];
> -	u32 num_lanes, i;
> +	int num_lanes, i;
>  
>  	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
>  		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
