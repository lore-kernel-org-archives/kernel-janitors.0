From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 11 Dec 2017 11:46:36 +0000
Subject: Re: [PATCH] chcr: remove unused variables net_device, pi, adap and cntrl
Message-Id: <20171211114636.GJ12014@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130141144.20845-1-colin.king@canonical.com>
In-Reply-To: <20171130141144.20845-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Harsh Jain <harsh@chelsio.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 30, 2017 at 02:11:44PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables adap, pi and cntrl are assigned but are never read, hence
> they are redundant and can be removed.
> 
> Cleans up various clang build warnings.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
