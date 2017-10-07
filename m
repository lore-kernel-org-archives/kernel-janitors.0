From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sat, 07 Oct 2017 04:36:33 +0000
Subject: Re: [PATCH] crypto: algboss: remove redundant setting of len to zero
Message-Id: <20171007043633.GH29803@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170914180219.12994-1-colin.king@canonical.com>
In-Reply-To: <20170914180219.12994-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 14, 2017 at 07:02:19PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable len is set to zero, never read and then later updated
> to p - name, so clearly the zero'ing of len is redundant and
> can be removed.
> 
> Detected by clang scan-build:
> " warning: Value stored to 'len' is never read"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
