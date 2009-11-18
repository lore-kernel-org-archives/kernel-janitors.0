From: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 18 Nov 2009 02:37:12 +0000
Subject: Re: trace/ftrace.c: Fix compile warnings
Message-Id: <1258511832.22249.479.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I just noticed this buried in my Inbox. The first change has already
been fixed. But your second change is indeed a bug.

Thanks!

Note, please add "[PATCH]" in your subject. Those get filtered to an
"urgent" folder, and is more likely to be spotted by others.

-- Steve


On Sat, 2009-10-31 at 02:06 -0300, Javier Martinez Canillas wrote:
> This patch is against linux-next 20091030. 
> 
> It solves two compile warning on kernel/trace/ftrace.c.
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> ---
>  kernel/trace/ftrace.c |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 1ed514f..7f3756d 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -2274,7 +2274,9 @@ void ftrace_set_notrace(unsigned char *buf, int len, int reset)
>  #define FTRACE_FILTER_SIZE		COMMAND_LINE_SIZE
>  static char ftrace_notrace_buf[FTRACE_FILTER_SIZE] __initdata;
>  static char ftrace_filter_buf[FTRACE_FILTER_SIZE] __initdata;
> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  static char ftrace_graph_buf[FTRACE_FILTER_SIZE] __initdata;
> +#endif
>  
>  static int __init set_ftrace_notrace(char *str)
>  {
> @@ -2987,6 +2989,7 @@ ftrace_pid_write(struct file *filp, const char __user *ubuf,
>  {
>  	char buf[64];
>  	long val;
> +	char *bufstr;
>  	int ret;
>  
>  	if (cnt >= sizeof(buf))
> @@ -3001,11 +3004,11 @@ ftrace_pid_write(struct file *filp, const char __user *ubuf,
>  	 * Allow "echo > set_ftrace_pid" or "echo -n '' > set_ftrace_pid"
>  	 * to clean the filter quietly.
>  	 */
> -	strstrip(buf);
> -	if (strlen(buf) = 0)
> +	bufstr = strstrip(buf);
> +	if (strlen(bufstr) = 0)
>  		return 1;
>  
> -	ret = strict_strtol(buf, 10, &val);
> +	ret = strict_strtol(bufstr, 10, &val);
>  	if (ret < 0)
>  		return ret;
>  

