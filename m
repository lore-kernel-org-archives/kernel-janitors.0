From: Jiri Olsa <jolsa@redhat.com>
Date: Sun, 14 Oct 2018 14:04:46 +0000
Subject: Re: [PATCH] perf stat: Potential NULL dereference in print_aggr()
Message-Id: <20181014140446.GA24104@krava>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181013101940.GA16086@mwanda>
In-Reply-To: <20181013101940.GA16086@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Oct 13, 2018 at 01:19:40PM +0300, Dan Carpenter wrote:
> Smatch complains that:
> 
>     ./tools/perf/util/stat-display.c:616 print_aggr()
>     error: we previously assumed 'config->aggr_map' could be null (see line 607)
> 
> Not only that, but it looks like aggr_update_shadow() can Oops if
> "config->aggr_get_id" is NULL.  The intent seems to have been to return
> if either of these pointers is NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Fixes: 86ee6e18f6cb ("perf stat: Refactor aggregation code")

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

> ---
>  tools/perf/util/stat-display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> index e7b4c44ebb62..db635c01d3a3 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -604,7 +604,7 @@ static void print_aggr(struct perf_stat_config *config,
>  	u64 ena, run, val;
>  	bool first;
>  
> -	if (!(config->aggr_map || config->aggr_get_id))
> +	if (!config->aggr_map || !config->aggr_get_id)
>  		return;
>  
>  	aggr_update_shadow(config, evlist);
> -- 
> 2.18.0
> 
