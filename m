From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Thu, 19 Oct 2017 12:37:30 +0000
Subject: Re: [PATCH] perf kmem: Perform some cleanup if '--time' is given an invalid value
Message-Id: <20171019123730.GJ3707@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170916060936.28199-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170916060936.28199-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: peterz@infradead.org, mingo@redhat.com, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Sat, Sep 16, 2017 at 08:09:36AM +0200, Christophe JAILLET escreveu:
> If the string passed in '--time' is invalid, we must do some cleanup
> before leaving. As in the other error handling paths of this function.

Thanks, applied.

- Arnaldo
 
> Fixes: 2a865bd8dddd ("perf kmem: Add option to specify time window of interest")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  tools/perf/builtin-kmem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/builtin-kmem.c b/tools/perf/builtin-kmem.c
> index 24ee68ecdd42..d8f25ef8157b 100644
> --- a/tools/perf/builtin-kmem.c
> +++ b/tools/perf/builtin-kmem.c
> @@ -1983,7 +1983,8 @@ int cmd_kmem(int argc, const char **argv)
>  
>  	if (perf_time__parse_str(&ptime, time_str) != 0) {
>  		pr_err("Invalid time string\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto out_delete;
>  	}
>  
>  	if (!strcmp(argv[0], "stat")) {
> -- 
> 2.11.0
