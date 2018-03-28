From: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Wed, 28 Mar 2018 14:04:40 +0000
Subject: Re: [PATCH] tracing: Uninitialized variable in create_tracing_map_fields()
Message-Id: <1522245880.520.1.camel@tzanussi-mobl.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328114815.GC29050@mwanda>
In-Reply-To: <20180328114815.GC29050@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, 2018-03-28 at 14:48 +0300, Dan Carpenter wrote:
> Smatch complains that idx can be used uninitialized when we check if
> (idx < 0).  It has to be the first iteration through the loop and the
> HIST_FIELD_FL_STACKTRACE bit has to be clear and the HIST_FIELD_FL_VAR
> bit has to be set to reach the bug.
> 
> Fixes: 30350d65ac56 ("tracing: Add variable support to hist triggers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
> index 4f027642ceef..6aceee287d07 100644
> --- a/kernel/trace/trace_events_hist.c
> +++ b/kernel/trace/trace_events_hist.c
> @@ -4411,7 +4411,7 @@ static int create_tracing_map_fields(struct hist_trigger_data *hist_data)
>  	struct tracing_map *map = hist_data->map;
>  	struct ftrace_event_field *field;
>  	struct hist_field *hist_field;
> -	int i, idx;
> +	int i, idx = 0;
>  
>  	for_each_hist_field(i, hist_data) {
>  		hist_field = hist_data->fields[i];

Yes, this should definitely be initialized to 0, thanks for the patch!

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>


