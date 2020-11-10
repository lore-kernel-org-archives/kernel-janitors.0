From: Qian Cai <cai@redhat.com>
Date: Tue, 10 Nov 2020 01:07:10 +0000
Subject: Re: [PATCH][next] cpumask: allocate enough space for string and trailing '\0' char
Message-Id: <737d5be9eb5af55b1a61bd8bfb49b1829a3ff916.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109130447.2080491-1-colin.king@canonical.com>
In-Reply-To: <20201109130447.2080491-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, "Paul E . McKenney" <paulmck@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>

On Mon, 2020-11-09 at 13:04 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the allocation of cpulist is based on the length of buf but does
> not include the addition end of string '\0' terminator. Static analysis is
> reporting this as a potential out-of-bounds access on cpulist. Fix this by
> allocating enough space for the additional '\0' terminator.
> 
> Addresses-Coverity: ("Out-of-bounds access")
> Fixes: 65987e67f7ff ("cpumask: add "last" alias for cpu list specifications")

Yeah, this bad commit also introduced KASAN errors everywhere and then will
disable lockdep that makes our linux-next CI miserable. Confirmed that this
patch will fix it.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  lib/cpumask.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/cpumask.c b/lib/cpumask.c
> index 34ecb3005941..cb8a3ef0e73e 100644
> --- a/lib/cpumask.c
> +++ b/lib/cpumask.c
> @@ -185,7 +185,7 @@ int __ref cpulist_parse(const char *buf, struct cpumask
> *dstp)
>  {
>  	int r;
>  	char *cpulist, last_cpu[5];	/* NR_CPUS <= 9999 */
> -	size_t len = strlen(buf);
> +	size_t len = strlen(buf) + 1;
>  	bool early = !slab_is_available();
>  
>  	if (!strcmp(buf, "all")) {
