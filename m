From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 28 Feb 2019 06:28:57 +0000
Subject: Re: [PATCH] crypto: stm32 - drop pointless static qualifier in stm32_hash_remove()
Message-Id: <20190228062857.rtxuq6lwns4cqu6m@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218144900.142544-1-maowenan@huawei.com>
In-Reply-To: <20190218144900.142544-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, mcoquelin.stm32@gmail.com, clabbe.montjoie@gmail.com, gilad@benyossef.com, ebiggers@google.com, keescook@chromium.org, alexandre.torgue@st.com

On Mon, Feb 18, 2019 at 10:49:00PM +0800, Mao Wenan wrote:
> There is no need to have the struct stm32_hash_dev *hdev static
> since new value always be assigned before use it.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/crypto/stm32/stm32-hash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
