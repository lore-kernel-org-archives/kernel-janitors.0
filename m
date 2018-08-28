From: Will Deacon <will.deacon@arm.com>
Date: Tue, 28 Aug 2018 17:39:52 +0000
Subject: Re: [PATCH] locking/ww_mutex: fix spelling mistake "cylic" -> "cyclic"
Message-Id: <20180828173951.GB20375@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180824112235.8842-1-colin.king@canonical.com>
In-Reply-To: <20180824112235.8842-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 24, 2018 at 12:22:35PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in pr_err error message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/locking/test-ww_mutex.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Given that this is part of an error message, I agree it's worth fixing.

Will

> diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
> index 5b915b370d5a..0be047dbd897 100644
> --- a/kernel/locking/test-ww_mutex.c
> +++ b/kernel/locking/test-ww_mutex.c
> @@ -324,7 +324,7 @@ static int __test_cycle(unsigned int nthreads)
>  		if (!cycle->result)
>  			continue;
>  
> -		pr_err("cylic deadlock not resolved, ret[%d/%d] = %d\n",
> +		pr_err("cyclic deadlock not resolved, ret[%d/%d] = %d\n",
>  		       n, nthreads, cycle->result);
>  		ret = -EINVAL;
>  		break;
> -- 
> 2.17.1
> 
