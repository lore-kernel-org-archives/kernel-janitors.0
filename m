From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 03 Nov 2017 14:23:08 +0000
Subject: Re: [PATCH] crypto: ccp: remove unused variable qim
Message-Id: <20171103142308.GF9011@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171012165541.32256-1-colin.king@canonical.com>
In-Reply-To: <20171012165541.32256-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Gary Hook <gary.hook@amd.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 12, 2017 at 05:55:41PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable qim is assigned but never read, it is redundant and can
> be removed.
> 
> Cleans up clang warning: Value stored to 'qim' is never read
> 
> Fixes: 4b394a232df7 ("crypto: ccp - Let a v5 CCP provide the same function as v3")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
