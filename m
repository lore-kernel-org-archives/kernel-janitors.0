From: Ayush Sawal <ayush.sawal@chelsio.com>
Date: Wed, 27 May 2020 13:51:43 +0000
Subject: Re: [PATCH] crypto: chelsio: remove redundant premature assignment to iv
Message-Id: <224c28f6-27ba-a671-958a-4d72e7933864@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527112922.171745-1-colin.king@canonical.com>
In-Reply-To: <20200527112922.171745-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: ayush.sawal@asicdesigners.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On 5/27/2020 4:59 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable iv is being assigned twice with the same value, the first
> assignment is redundant and can be removed and instead keep the
> latter assignment of iv as it is closer to the point it is being
> used.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/crypto/chelsio/chcr_ipsec.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/crypto/chelsio/chcr_ipsec.c b/drivers/crypto/chelsio/chcr_ipsec.c
> index af961dcd317b..f9ad8c93e5ff 100644
> --- a/drivers/crypto/chelsio/chcr_ipsec.c
> +++ b/drivers/crypto/chelsio/chcr_ipsec.c
> @@ -398,7 +398,6 @@ inline void *copy_esn_pktxt(struct sk_buff *skb,
>   	memset(pos, 0, len);
>   	aadiv = (struct chcr_ipsec_aadiv *)pos;
>   	esphdr = (struct ip_esp_hdr *)skb_transport_header(skb);
> -	iv = skb_transport_header(skb) + sizeof(struct ip_esp_hdr);
>   	xo = xfrm_offload(skb);
>   
>   	aadiv->spi = (esphdr->spi);

Patch looks good, thank you for correcting.
