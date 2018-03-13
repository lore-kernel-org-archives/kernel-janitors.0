From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue, 13 Mar 2018 15:07:34 +0000
Subject: Re: [PATCH -next] crypto: fix missing unlock on error in safexcel_ahash_send_req()
Message-Id: <20180313150734.GL2496@kwain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1520952843-68436-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1520952843-68436-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Wei,

On Tue, Mar 13, 2018 at 02:54:03PM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function
> safexcel_ahash_send_req() in the error handling case.
>=20
> Fixes: cff9a17545a3 ("crypto: inside-secure - move cache result dma mappi=
ng to request")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Antoine Tenart <antoine.tenart@bootlin.com>

Thanks!
Antoine

> ---
>  drivers/crypto/inside-secure/safexcel_hash.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypt=
o/inside-secure/safexcel_hash.c
> index 77268c9..6e9eb9b 100644
> --- a/drivers/crypto/inside-secure/safexcel_hash.c
> +++ b/drivers/crypto/inside-secure/safexcel_hash.c
> @@ -236,8 +236,10 @@ static int safexcel_ahash_send_req(struct crypto_asy=
nc_request *async, int ring,
>  	if (cache_len) {
>  		req->cache_dma =3D dma_map_single(priv->dev, req->cache,
>  						cache_len, DMA_TO_DEVICE);
> -		if (dma_mapping_error(priv->dev, req->cache_dma))
> +		if (dma_mapping_error(priv->dev, req->cache_dma)) {
> +			spin_unlock_bh(&priv->ring[ring].egress_lock);
>  			return -EINVAL;
> +		}
> =20
>  		req->cache_sz =3D cache_len;
>  		first_cdesc =3D safexcel_add_cdesc(priv, ring, 1,
>=20

--=20
Antoine T=E9nart, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
