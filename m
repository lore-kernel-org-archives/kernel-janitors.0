From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Date: Wed, 21 Aug 2019 16:20:24 +0000
Subject: Re: [PATCH] tools/power: intel-speed-select:  Fix a read overflow in isst_set_tdp_level_msr()
Message-Id: <1b68045227e852fb2f250d0ec858ae006490123f.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821071403.GG26957@mwanda>
In-Reply-To: <20190821071403.GG26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Wed, 2019-08-21 at 10:14 +0300, Dan Carpenter wrote:
> The isst_send_msr_command() function will read 8 bytes but we are
> passing an address to an int (4 bytes) so it results in a read
> overflow.
> 
> Fixes: 3fb4f7cd472c ("tools/power/x86: A tool to validate Intel Speed
> Select commands")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  tools/power/x86/intel-speed-select/isst-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/isst-core.c
> b/tools/power/x86/intel-speed-select/isst-core.c
> index 8de4ac39a008..f724322856ed 100644
> --- a/tools/power/x86/intel-speed-select/isst-core.c
> +++ b/tools/power/x86/intel-speed-select/isst-core.c
> @@ -190,6 +190,7 @@ int isst_get_get_trl(int cpu, int level, int
> avx_level, int *trl)
>  
>  int isst_set_tdp_level_msr(int cpu, int tdp_level)
>  {
> +	unsigned long long level = tdp_level;
>  	int ret;
>  
>  	debug_printf("cpu: tdp_level via MSR %d\n", cpu, tdp_level);
> @@ -202,8 +203,7 @@ int isst_set_tdp_level_msr(int cpu, int
> tdp_level)
>  	if (tdp_level > 2)
>  		return -1; /* invalid value */
>  
> -	ret = isst_send_msr_command(cpu, 0x64b, 1,
> -				    (unsigned long long *)&tdp_level);
> +	ret = isst_send_msr_command(cpu, 0x64b, 1, &level);
>  	if (ret)
>  		return ret;
>  
