From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 03 Nov 2017 14:22:58 +0000
Subject: Re: [PATCH] crypto: cavium: clean up clang warning on unread variable offset
Message-Id: <20171103142258.GE9011@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171012164406.31934-1-colin.king@canonical.com>
In-Reply-To: <20171012164406.31934-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 12, 2017 at 05:44:06PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable offset is being assigned and not being used; it should
> be passed as the 2nd argument to call to function nitrox_write_csr
> but has been omitted. Fix this.
> 
> Cleans up clang warning: Value stored to 'offset' is never read
> 
> Fixes: 14fa93cdcd9b ("crypto: cavium - Add support for CNN55XX adapters.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
