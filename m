From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 12 Jul 2017 10:52:21 +0000
Subject: Re: [PATCH] crypto: cavium: make several functions static
Message-Id: <20170712105221.GE22109@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170620103550.7660-1-colin.king@canonical.com>
In-Reply-To: <20170620103550.7660-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: George Cherian <george.cherian@cavium.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 20, 2017 at 11:35:50AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The functions cvm_encrypt, cvm_decrypt, cvm_xts_setkey and
> cvm_enc_dec_init does not need to be in global scope, so make
> them static.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
