From: leroy christophe <christophe.leroy@c-s.fr>
Date: Mon, 11 May 2015 13:35:12 +0000
Subject: Re: [patch -next] crypto: talitos - fix size calculation in talitos_edesc_alloc()
Message-Id: <5550B010.60008@c-s.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150511101009.GA12395@mwanda>
In-Reply-To: <20150511101009.GA12395@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org



Le 11/05/2015 12:10, Dan Carpenter a =E9crit :
> The + operation has higher precedence than ?: so we need parentheses
> here.  Otherwise we may end up allocating a max of only one "cryptlen"
> instead of two.
>
> Fixes: 6f65f6ac5fb3 ('crypto: talitos - implement scatter/gather copy for=
 SEC1')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
> index c04074d..273942c 100644
> --- a/drivers/crypto/talitos.c
> +++ b/drivers/crypto/talitos.c
> @@ -1335,8 +1335,8 @@ static struct talitos_edesc *talitos_edesc_alloc(st=
ruct device *dev,
>   	alloc_len =3D sizeof(struct talitos_edesc);
>   	if (assoc_nents || src_nents || dst_nents) {
>   		if (is_sec1)
> -			dma_len =3D src_nents ? cryptlen : 0 +
> -				  dst_nents ? cryptlen : 0;
> +			dma_len =3D (src_nents ? cryptlen : 0) +
> +				  (dst_nents ? cryptlen : 0);
>   		else
>   			dma_len =3D (src_nents + dst_nents + 2 + assoc_nents) *
>   				  sizeof(struct talitos_ptr) + authsize;
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
