From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 14 Dec 2005 15:19:55 +0000
Subject: Re: [KJ] [PATCH] crypto/aes: add unsigned to ints that can't go
Message-Id: <20051214151955.GA12653@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11329565588514501=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051209155957.39daf59d@lucky.kitzblitz>
In-Reply-To: <20051209155957.39daf59d@lucky.kitzblitz>
To: kernel-janitors@vger.kernel.org

--===============11329565588514501==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 09, 2005 at 03:59:57PM +0100, Nicolas Kaiser wrote:
> * Key length can't go negative, "unsigned int" is preferred to "int"
> * E-Key is most frequently accessed struct member

I've checked alpha and s390 (defconfigs):

* just rearranging doesn't change anything wrt size(1)
* just adding "unsigned" increases size of aes.o. In alpha case by 0x30
  bytes.

> --- a/crypto/aes.c
> +++ b/crypto/aes.c
> @@ -77,9 +77,9 @@ byte(const u32 x, const unsigned n)
>  #define u32_out(to, from) (*(u32 *)(to) = cpu_to_le32(from))
>  
>  struct aes_ctx {
> -	int key_length;
>  	u32 E[60];
>  	u32 D[60];
> +	unsigned int key_length;
>  };
>  
>  #define E_KEY ctx->E
> @@ -378,7 +378,7 @@ static void aes_decrypt(void *ctx_arg, u
>  {
>  	const struct aes_ctx *ctx = ctx_arg;
>  	u32 b0[4], b1[4];
> -	const int key_len = ctx->key_length;
> +	const unsigned int key_len = ctx->key_length;


--===============11329565588514501==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11329565588514501==--
