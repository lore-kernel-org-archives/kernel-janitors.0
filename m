From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sun, 20 Sep 2020 13:23:20 +0000
Subject: Re: [PATCH] rhashtable: fix indentation of a continue statement
Message-Id: <20200920132320.GA769@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918215126.49236-1-colin.king@canonical.com>
In-Reply-To: <20200918215126.49236-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Graf <tgraf@suug.ch>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 18, 2020 at 10:51:26PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A continue statement is indented incorrectly, add in the missing
> tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  lib/test_rhashtable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
