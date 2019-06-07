From: Andrzej Hajda <a.hajda@samsung.com>
Date: Fri, 07 Jun 2019 09:43:21 +0000
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent out of bounds read
Message-Id: <2f21e800-7053-f004-6592-6ef43ee68914@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20190607072733epcas1p34d1a3afb68cb189947c794b1fc8c73a0@epcas1p3.samsung.com>
 <20190607072704.GA25229@mwanda>
In-Reply-To: <20190607072704.GA25229@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Jyri Sarha <jsarha@ti.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>

On 07.06.2019 09:27, Dan Carpenter wrote:
> This should check that "i" is within bounds before checking reading from
> the array.
>
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

=C2=A0--
Regards
Andrzej


> ---
>  drivers/gpu/drm/bridge/sii902x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/si=
i902x.c
> index d6f98d388ac2..6b03616d6bc3 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -589,8 +589,8 @@ static int sii902x_audio_hw_params(struct device *dev=
, void *data,
>  	if (ret)
>  		goto out;
> =20
> -	for (i =3D 0; sii902x->audio.i2s_fifo_sequence[i] &&
> -		     i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++)
> +	for (i =3D 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence) &&
> +		    sii902x->audio.i2s_fifo_sequence[i]; i++)
>  		regmap_write(sii902x->regmap,
>  			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
>  			     sii902x->audio.i2s_fifo_sequence[i]);
