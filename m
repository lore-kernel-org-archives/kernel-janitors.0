From: walter harms <wharms@bfs.de>
Date: Fri, 07 Jun 2019 07:39:57 +0000
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent out of bounds read
Message-Id: <5CFA14CD.5010502@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190607072704.GA25229@mwanda>
In-Reply-To: <20190607072704.GA25229@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>



Am 07.06.2019 09:27, schrieb Dan Carpenter:
> This should check that "i" is within bounds before checking reading from
> the array.
> 
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d6f98d388ac2..6b03616d6bc3 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -589,8 +589,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
>  	if (ret)
>  		goto out;
>  
> -	for (i = 0; sii902x->audio.i2s_fifo_sequence[i] &&
> -		     i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++)
> +	for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence) &&
> +		    sii902x->audio.i2s_fifo_sequence[i]; i++)
>  		regmap_write(sii902x->regmap,
>  			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
>  			     sii902x->audio.i2s_fifo_sequence[i]);


mmmh, i am a big fan of KISS and in this case i would check sii902x->audio.i2s_fifo_sequence[i]
outside for(). like:

	 for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++) {
	        if (!sii902x->audio.i2s_fifo_sequence[i])
                         break;

                 regmap_write(sii902x->regmap,
  			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
  			     sii902x->audio.i2s_fifo_sequence[i]);
	}

just my 2 cents,

re,
 wh
