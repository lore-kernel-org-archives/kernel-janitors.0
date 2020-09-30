From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 30 Sep 2020 10:12:54 +0000
Subject: Re: [PATCH][next] lib/mpi: fix off-by-one check on index "no"
Message-Id: <20200930101253.GB25359@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200929131828.155691-1-colin.king@canonical.com>
In-Reply-To: <20200929131828.155691-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, Waiman Long <longman@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 29, 2020 at 02:18:28PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an off-by-one range check on the upper limit of
> index "no".  Fix this by changing the > comparison to >> 
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: a8ea8bdd9df9 ("lib/mpi: Extend the MPI library")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  lib/mpi/mpiutil.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Could you resend this with a cc to linux-crypto?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
