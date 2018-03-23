From: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Fri, 23 Mar 2018 13:23:13 +0000
Subject: Re: [PATCH] tracing: Fix a potential NULL dereference
Message-Id: <1521811393.27781.2.camel@tzanussi-mobl.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323113735.GC28518@mwanda>
In-Reply-To: <20180323113735.GC28518@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, 2018-03-23 at 14:37 +0300, Dan Carpenter wrote:
> We forgot to set the error code on this path so we return ERR_PTR(0)
> which is NULL.  It results in a NULL dereference in the caller.
> 
> Fixes: 100719dcef44 ("tracing: Add simple expression support to hist triggers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
> index 4f027642ceef..a02bc09d765a 100644
> --- a/kernel/trace/trace_events_hist.c
> +++ b/kernel/trace/trace_events_hist.c
> @@ -2776,6 +2776,7 @@ static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
>  		expr->fn = hist_field_plus;
>  		break;
>  	default:
> +		ret = -EINVAL;
>  		goto free;
>  	}
>  

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

Thanks for catching this!

Tom

