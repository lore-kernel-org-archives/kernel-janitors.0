From: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 12 Jul 2017 13:45:01 +0000
Subject: Re: [PATCH 2/2] ftrace: silence uninitialized variable warning
Message-Id: <20170712094501.4579732f@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170712073340.4enzeojeoupuds5a@mwanda>
        <20170712073556.h6tkpjcdzjaozozs@mwanda>
In-Reply-To: <20170712073556.h6tkpjcdzjaozozs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 12 Jul 2017 10:35:57 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> My static checker complains that if "func" is NULL then "clear_filter"
> is uninitialized.  This seems like it could be true, although it's
> possible something subtle is happening that I haven't seen.
> 
>     kernel/trace/ftrace.c:3844 match_records()
>     error: uninitialized symbol 'clear_filter'.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> It does occur to me that I could initialize it to 1 instead of 0 but my
> guess is that zero is intended.  Please review this one carefully.

Looks like it broke with f0a3b154bd7 ("ftrace: Clarify code for mod
command"). Yeah, clear_filter = 0 is the correct default.

Thanks!

-- Steve

> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 2a3c45743f54..5e658da91912 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -3816,7 +3816,7 @@ match_records(struct ftrace_hash *hash, char *func, int len, char *mod)
>  	int exclude_mod = 0;
>  	int found = 0;
>  	int ret;
> -	int clear_filter;
> +	int clear_filter = 0;
>  
>  	if (func) {
>  		func_g.type = filter_parse_regex(func, len, &func_g.search,

