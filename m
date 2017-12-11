From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 11 Dec 2017 11:46:03 +0000
Subject: Re: [PATCH] crypto: cryptd: make cryptd_max_cpu_qlen module parameter static
Message-Id: <20171211114603.GG12014@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130112614.3090-1-colin.king@canonical.com>
In-Reply-To: <20171130112614.3090-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 30, 2017 at 11:26:14AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The cryptd_max_cpu_qlen module parameter is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> crypto/cryptd.c:35:14: warning: symbol 'cryptd_max_cpu_qlen' was not
> declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
