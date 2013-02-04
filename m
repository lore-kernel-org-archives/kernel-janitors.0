From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 04 Feb 2013 13:21:41 +0000
Subject: Re: [PATCH] crypto: use ERR_CAST
Message-Id: <20130204132141.GB21627@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358854166-3952-1-git-send-email-Julia.Lawall@lip6.fr>
 <1358854166-3952-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358854166-3952-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 22, 2013 at 12:29:26PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Replace PTR_ERR followed by ERR_PTR by ERR_CAST, to be more concise.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression err,x;
> @@
> -       err = PTR_ERR(x);
>         if (IS_ERR(x))
> -                return ERR_PTR(err);
> +                return ERR_CAST(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
