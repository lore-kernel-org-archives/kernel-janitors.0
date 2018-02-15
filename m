From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 15 Feb 2018 15:52:34 +0000
Subject: Re: [PATCH] crypto: ccp - Make function ccp_get_dma_chan_attr static
Message-Id: <20180215155234.GO7352@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206232001.14102-1-colin.king@canonical.com>
In-Reply-To: <20180206232001.14102-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Gary Hook <gary.hook@amd.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 06, 2018 at 11:20:01PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Function ccp_get_dma_chan_attr is local to the source and does not
> need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/crypto/ccp/ccp-dmaengine.c:41:14: warning: symbol
> 'ccp_get_dma_chan_attr' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
