From: Andrzej Hajda <a.hajda@samsung.com>
Date: Fri, 07 Jun 2019 13:15:14 +0000
Subject: Re: [PATCH][next] drm/bridge: sii902x: fix comparision of u32 with less than zero
Message-Id: <4454a547-d8f9-2df8-d3fa-2026860a14a9@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20190603142108epcas2p4625777c1aaea18257804ca86bcb64454@epcas2p4.samsung.com>
        <20190603142102.27191-1-colin.king@canonical.com>
In-Reply-To: <20190603142102.27191-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jyri Sarha <jsarha@ti.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03.06.2019 16:21, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The less than check for the variable num_lanes is always going to be
> false because the variable is a u32.  Fix this by making num_lanes an
> int and also make loop index i an int too.
>
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d6f98d388ac2..21a947603c88 100644
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

Queued to drm-misc-next.

--
Regards
Andrzej
