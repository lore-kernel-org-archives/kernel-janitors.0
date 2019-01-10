From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 10 Jan 2019 14:05:15 +0000
Subject: Re: [PATCH] crypto: cavium/nitrox - Use after free in process_response_list()
Message-Id: <20190110140515.6lfiip7tlyhxng2o@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190104064611.GA30627@kadam>
In-Reply-To: <20190104064611.GA30627@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nagadheeraj Rottela <rnagadheeraj@marvell.com>, "David S. Miller" <davem@davemloft.net>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, Gadam Sreerama <sgadam@cavium.com>, "Nagadheeraj, Rottela" <Rottela.Nagadheeraj@cavium.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 04, 2019 at 09:46:11AM +0300, Dan Carpenter wrote:
> We free "sr" and then dereference it on the next line.
> 
> Fixes: c9613335bf4f ("crypto: cavium/nitrox - Added AEAD cipher support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/cavium/nitrox/nitrox_reqmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
