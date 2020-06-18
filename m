From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 18 Jun 2020 07:56:54 +0000
Subject: Re: [PATCH v2] crypto: hisilicon - allow smaller reads in debugfs
Message-Id: <20200618075654.GD10091@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602135409.GA59808@mwanda>
In-Reply-To: <20200602135409.GA59808@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: b6da310b-e633-9f74-f7af-7791d803aaf5@huawei.com
Cc: Zhou Wang <wangzhou1@hisilicon.com>, Shukun Tan <tanshukun1@huawei.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 02, 2020 at 04:54:09PM +0300, Dan Carpenter wrote:
> Originally this code rejected any read less than 256 bytes.  There
> is no need for this artificial limit.  We should just use the normal
> helper functions to read a string from the kernel.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Use simple_read_from_buffer().  The v1 was slightly half arsed
> because I left the original check for:
> 
> 	if (*pos)
> 		return 0;
> 
> So it could result in partial reads.  The new code means that if you
> want to read the buffer one byte at a time, that's fine or if you want
> to read it in one 256 byte chunk that's also fine.  Plus it deletes 21
> lines of code and is a lot cleaner.
> 
>  drivers/crypto/hisilicon/qm.c | 33 ++++++---------------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
