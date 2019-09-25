From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 25 Sep 2019 13:07:31 +0000
Subject: Re: [PATCH] mm, vmpressure: Fix a signedness bug in vmpressure_register_event()
Message-Id: <20190925130731.GL5933@smile.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925110449.GO3264@mwanda>
In-Reply-To: <20190925110449.GO3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, tglx@linutronix.de, Enrico Weigelt <info@metux.net>, Kate Stewart <kstewart@linuxfoundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 25, 2019 at 02:04:49PM +0300, Dan Carpenter wrote:
> The "mode" and "level" variables are enums and in this context GCC will
> treat them as unsigned ints so the error handling is never triggered.
> 
> I also removed the bogus initializer because it isn't required any more
> and it's sort of confusing.
> 

Indeed, assembly code is different.
Thank you for catching this!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 3cadfa2b9497 ("mm/vmpressure.c: convert to use match_string() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  mm/vmpressure.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmpressure.c b/mm/vmpressure.c
> index f3b50811497a..fe077500cf20 100644
> --- a/mm/vmpressure.c
> +++ b/mm/vmpressure.c
> @@ -362,7 +362,7 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
>  	struct vmpressure *vmpr = memcg_to_vmpressure(memcg);
>  	struct vmpressure_event *ev;
>  	enum vmpressure_modes mode = VMPRESSURE_NO_PASSTHROUGH;
> -	enum vmpressure_levels level = -1;
> +	enum vmpressure_levels level;
>  	char *spec, *spec_orig;
>  	char *token;
>  	int ret = 0;
> @@ -376,7 +376,7 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
>  	/* Find required level */
>  	token = strsep(&spec, ",");
>  	level = match_string(vmpressure_str_levels, VMPRESSURE_NUM_LEVELS, token);
> -	if (level < 0) {
> +	if ((int)level < 0) {
>  		ret = level;
>  		goto out;
>  	}
> @@ -385,7 +385,7 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
>  	token = strsep(&spec, ",");
>  	if (token) {
>  		mode = match_string(vmpressure_str_modes, VMPRESSURE_NUM_MODES, token);
> -		if (mode < 0) {
> +		if ((int)mode < 0) {
>  			ret = mode;
>  			goto out;
>  		}
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko
