From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 09 Apr 2020 17:42:33 +0000
Subject: Re: [PATCH] lib/math: avoid trailing '\n' hidden in pr_fmt()
Message-Id: <20200409174233.GL3676135@smile.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200409163234.22830-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200409163234.22830-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mchehab+samsung@kernel.org, akpm@linux-foundation.org, gregkh@linuxfoundation.org, tglx@linutronix.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2020 at 06:32:34PM +0200, Christophe JAILLET wrote:
> pr_xxx() functions usually have '\n' at the end of the logging message.
> Here, this '\n' is added via the 'pr_fmt' macro.
> 
> In order to be more consistent with other files, use a more standard
> convention and put these '\n' back in the messages themselves and remove it
> from the pr_fmt macro.
> 
> While at it, use __func__ instead of hardcoding a function name in the
> last message.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  lib/math/prime_numbers.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/math/prime_numbers.c b/lib/math/prime_numbers.c
> index 052f5b727be7..d42cebf7407f 100644
> --- a/lib/math/prime_numbers.c
> +++ b/lib/math/prime_numbers.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -#define pr_fmt(fmt) "prime numbers: " fmt "\n"
> +#define pr_fmt(fmt) "prime numbers: " fmt
>  
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -253,7 +253,7 @@ static void dump_primes(void)
>  
>  	if (buf)
>  		bitmap_print_to_pagebuf(true, buf, p->primes, p->sz);
> -	pr_info("primes.{last=%lu, .sz=%lu, .primes[]=...x%lx} = %s",
> +	pr_info("primes.{last=%lu, .sz=%lu, .primes[]=...x%lx} = %s\n",
>  		p->last, p->sz, p->primes[BITS_TO_LONGS(p->sz) - 1], buf);
>  
>  	rcu_read_unlock();
> @@ -273,7 +273,7 @@ static int selftest(unsigned long max)
>  		bool fast = is_prime_number(x);
>  
>  		if (slow != fast) {
> -			pr_err("inconsistent result for is-prime(%lu): slow=%s, fast=%s!",
> +			pr_err("inconsistent result for is-prime(%lu): slow=%s, fast=%s!\n",
>  			       x, slow ? "yes" : "no", fast ? "yes" : "no");
>  			goto err;
>  		}
> @@ -282,14 +282,14 @@ static int selftest(unsigned long max)
>  			continue;
>  
>  		if (next_prime_number(last) != x) {
> -			pr_err("incorrect result for next-prime(%lu): expected %lu, got %lu",
> +			pr_err("incorrect result for next-prime(%lu): expected %lu, got %lu\n",
>  			       last, x, next_prime_number(last));
>  			goto err;
>  		}
>  		last = x;
>  	}
>  
> -	pr_info("selftest(%lu) passed, last prime was %lu", x, last);
> +	pr_info("%s(%lu) passed, last prime was %lu\n", __func__, x, last);
>  	return 0;
>  
>  err:
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko
