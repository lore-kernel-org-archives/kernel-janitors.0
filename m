From: Johannes =?iso-8859-1?Q?G=F6tzfried?=  <johannes.goetzfried@cs.fau.de>
Date: Fri, 14 Feb 2014 17:55:45 +0000
Subject: Re: [patch] crypto: remove a duplicate checks in __cbc_decrypt()
Message-Id: <20140214175544.GI2591@kronos.hofmann.stw.uni-erlangen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140213145832.GA11059@elgon.mountain>
In-Reply-To: <20140213145832.GA11059@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Jussi Kivilinna <jussi.kivilinna@mbnet.fi>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 13, 2014 at 05:58:32PM +0300, Dan Carpenter wrote:
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Johannes G=F6tzfried <johannes.goetzfried@cs.fau.de>

> ---
> This doesn't change how the code works, but maybe their is a bug in the
> original code.  Please review?

> diff --git a/arch/x86/crypto/cast5_avx_glue.c b/arch/x86/crypto/cast5_avx=
_glue.c
> index e6a3700489b9..e57e20ab5e0b 100644
> --- a/arch/x86/crypto/cast5_avx_glue.c
> +++ b/arch/x86/crypto/cast5_avx_glue.c
> @@ -203,9 +203,6 @@ static unsigned int __cbc_decrypt(struct blkcipher_de=
sc *desc,
>  			src -=3D 1;
>  			dst -=3D 1;
>  		} while (nbytes >=3D bsize * CAST5_PARALLEL_BLOCKS);
> -
> -		if (nbytes < bsize)
> -			goto done;
>  	}

>  	/* Handle leftovers */
> diff --git a/arch/x86/crypto/blowfish_glue.c b/arch/x86/crypto/blowfish_g=
lue.c
> index 50ec333b70e6..8af519ed73d1 100644
> --- a/arch/x86/crypto/blowfish_glue.c
> +++ b/arch/x86/crypto/blowfish_glue.c
> @@ -223,9 +223,6 @@ static unsigned int __cbc_decrypt(struct blkcipher_de=
sc *desc,
>  			src -=3D 1;
>  			dst -=3D 1;
>  		} while (nbytes >=3D bsize * 4);
> -
> -		if (nbytes < bsize)
> -			goto done;
>  	}

>  	/* Handle leftovers */

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
