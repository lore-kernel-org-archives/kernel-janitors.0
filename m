From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Wed, 12 Aug 2020 12:10:40 +0000
Subject: Re: [PATCH] perf bench: fix a couple of spelling mistakes in options text
Message-Id: <20200812121040.GD13995@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200812064647.200132-1-colin.king@canonical.com>
In-Reply-To: <20200812064647.200132-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Em Wed, Aug 12, 2020 at 07:46:47AM +0100, Colin King escreveu:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a couple of spelling mistakes in the text. Fix these.

Thanks, applied.

- Arnaldo
 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/perf/bench/find-bit-bench.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/bench/find-bit-bench.c b/tools/perf/bench/find-bit-bench.c
> index fa90f3e9d368..73b5bcc5946a 100644
> --- a/tools/perf/bench/find-bit-bench.c
> +++ b/tools/perf/bench/find-bit-bench.c
> @@ -17,9 +17,9 @@ static unsigned int inner_iterations = 100000;
>  
>  static const struct option options[] = {
>  	OPT_UINTEGER('i', "outer-iterations", &outer_iterations,
> -		"Number of outerer iterations used"),
> +		"Number of outer iterations used"),
>  	OPT_UINTEGER('j', "inner-iterations", &inner_iterations,
> -		"Number of outerer iterations used"),
> +		"Number of inner iterations used"),
>  	OPT_END()
>  };
>  
> -- 
> 2.27.0
> 

-- 

- Arnaldo
