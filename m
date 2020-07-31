From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 31 Jul 2020 13:32:19 +0000
Subject: Re: [PATCH] hwrng: core: remove redundant initialization of variable ret
Message-Id: <20200731133218.GA14568@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200724101001.12505-1-colin.king@canonical.com>
References: <20200724101001.12505-1-colin.king@canonical.com>
In-Reply-To: <20200724101001.12505-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: mpm@selenic.com, arnd@arndb.de, gregkh@linuxfoundation.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/char/hw_random/core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
