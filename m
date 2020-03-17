From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Tue, 17 Mar 2020 14:16:13 +0000
Subject: Re: [PATCH] perf probe: Fix an error handling path in 'parse_perf_probe_command()'
Message-Id: <20200317231613.af181e378e7c09ea97097314@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200315201259.29190-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200315201259.29190-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, allison@lohutok.net, rostedt@goodmis.org, tglx@linutronix.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 15 Mar 2020 21:12:59 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> If a memory allocation fail, we should branch to the error handling path in
> order to free some resources allocated a few lines above.
> 

Good catch!

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you,

> Fixes: 15354d546986 ("perf probe: Generate event name with line number")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  tools/perf/util/probe-event.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
> index eea132f512b0..65a615ee4b4c 100644
> --- a/tools/perf/util/probe-event.c
> +++ b/tools/perf/util/probe-event.c
> @@ -1683,8 +1683,10 @@ int parse_perf_probe_command(const char *cmd, struct perf_probe_event *pev)
>  	if (!pev->event && pev->point.function && pev->point.line
>  			&& !pev->point.lazy_line && !pev->point.offset) {
>  		if (asprintf(&pev->event, "%s_L%d", pev->point.function,
> -			pev->point.line) < 0)
> -			return -ENOMEM;
> +			pev->point.line) < 0) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
>  	}
>  
>  	/* Copy arguments and ensure return probe has no C argument */
> -- 
> 2.20.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
