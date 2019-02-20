From: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 20 Feb 2019 15:46:36 +0000
Subject: Re: [PATCH] tracing: fix spelling mistake: "analagous" -> "analogous"
Message-Id: <20190220104636.19dbcb8e@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190217223222.16479-1-colin.king@canonical.com>
In-Reply-To: <20190217223222.16479-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 17 Feb 2019 22:32:22 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the mini-howto help text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied. Thanks!

-- Steve

> ---
>  kernel/trace/trace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index f380139e972c..4dd8a52a71e0 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -4740,7 +4740,7 @@ static const char readme_msg[] >  	"\t    unchanged.\n\n"
>  	"\t    The enable_hist and disable_hist triggers can be used to\n"
>  	"\t    have one event conditionally start and stop another event's\n"
> -	"\t    already-attached hist trigger.  The syntax is analagous to\n"
> +	"\t    already-attached hist trigger.  The syntax is analogous to\n"
>  	"\t    the enable_event and disable_event triggers.\n"
>  #endif
>  ;
