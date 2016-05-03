From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 03 May 2016 08:17:35 +0000
Subject: Re: [PATCH] crypto: constify ccp_actions structure
Message-Id: <20160503081735.GF17166@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1462103575-21705-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1462103575-21705-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, kernel-janitors@vger.kernel.org, Gary Hook <gary.hook@amd.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, May 01, 2016 at 01:52:55PM +0200, Julia Lawall wrote:
> The ccp_actions structure is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
