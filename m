From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Mon, 23 Jan 2017 22:48:09 +0000
Subject: Re: [PATCH 1/4] perf probe: Delete an unnecessary check in try_to_find_absolute_address()
Message-Id: <20170124074809.abaea0687a22933344af0926@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
        <a3f2473b-6383-a326-bce0-b826423608b8@users.sourceforge.net>
In-Reply-To: <a3f2473b-6383-a326-bce0-b826423608b8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, He Kuang <hekuang@huawei.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Milian Wolff <milian.wolff@kdab.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 23 Jan 2017 16:22:22 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 23 Jan 2017 14:54:26 +0100
> 
> Remove a condition check which is unnecessary at the end
> because this source code place should usually only be reached
> with a non-zero pointer.

Looks good to me :)

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thanks!

> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  tools/perf/util/probe-event.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
> index d281ae2b54e8..6c7508337fe8 100644
> --- a/tools/perf/util/probe-event.c
> +++ b/tools/perf/util/probe-event.c
> @@ -2966,10 +2966,8 @@ static int try_to_find_absolute_address(struct perf_probe_event *pev,
>  	return 1;
>  
>  errout:
> -	if (*tevs) {
> -		clear_probe_trace_events(*tevs, 1);
> -		*tevs = NULL;
> -	}
> +	clear_probe_trace_events(*tevs, 1);
> +	*tevs = NULL;
>  	return err;
>  }
>  
> -- 
> 2.11.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
