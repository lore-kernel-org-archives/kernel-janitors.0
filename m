From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 09 Oct 2017 20:13:37 +0000
Subject: Re: [PATCH] kernel/trace: Delete five error messages for a failed memory allocation
Message-Id: <20171009161337.7c35911f@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c0d21fa1-a40f-92e5-821c-66e2596112c9@users.sourceforge.net>
In-Reply-To: <c0d21fa1-a40f-92e5-821c-66e2596112c9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>

On Sat, 7 Oct 2017 16:15:14 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 7 Oct 2017 16:10:06 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.

Does memory allocation failures have printk messages? If not, then I
think this is removing useful information.

-- Steve

> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  kernel/trace/trace_kprobe.c   | 1 -
>  kernel/trace/trace_probe.c    | 5 ++---
>  kernel/trace/trace_selftest.c | 4 +---
>  kernel/trace/trace_uprobe.c   | 2 --
>  4 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> index 8a907e12b6b9..79a2ee2fc1f4 100644
> --- a/kernel/trace/trace_kprobe.c
> +++ b/kernel/trace/trace_kprobe.c
> @@ -776,7 +776,6 @@ static int create_trace_kprobe(int argc, char **argv)
>  		}
>  
>  		if (!parg->name) {
> -			pr_info("Failed to allocate argument[%d] name.\n", i);
>  			ret = -ENOMEM;
>  			goto error;
>  		}
> diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
> index 52478f033f88..cf544d899eaa 100644
> --- a/kernel/trace/trace_probe.c
> +++ b/kernel/trace/trace_probe.c
> @@ -545,10 +545,9 @@ int traceprobe_parse_probe_arg(char *arg, ssize_t *size,
>  		return -ENOSPC;
>  	}
>  	parg->comm = kstrdup(arg, GFP_KERNEL);
> -	if (!parg->comm) {
> -		pr_info("Failed to allocate memory for command '%s'.\n", arg);
> +	if (!parg->comm)
>  		return -ENOMEM;
> -	}
> +
>  	t = strchr(parg->comm, ':');
>  	if (t) {
>  		arg[t - parg->comm] = '\0';
> diff --git a/kernel/trace/trace_selftest.c b/kernel/trace/trace_selftest.c
> index cb917cebae29..6a2a57def182 100644
> --- a/kernel/trace/trace_selftest.c
> +++ b/kernel/trace/trace_selftest.c
> @@ -250,10 +250,8 @@ static int trace_selftest_ops(struct trace_array *tr, int cnt)
>  
>  	/* Add a dynamic probe */
>  	dyn_ops = kzalloc(sizeof(*dyn_ops), GFP_KERNEL);
> -	if (!dyn_ops) {
> -		printk("MEMORY ERROR ");
> +	if (!dyn_ops)
>  		goto out;
> -	}
>  
>  	dyn_ops->func = trace_selftest_test_dyn_func;
>  
> diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
> index 4525e0271a53..9131f7372502 100644
> --- a/kernel/trace/trace_uprobe.c
> +++ b/kernel/trace/trace_uprobe.c
> @@ -492,7 +492,6 @@ static int create_trace_uprobe(int argc, char **argv)
>  	tu->filename = kstrdup(filename, GFP_KERNEL);
>  
>  	if (!tu->filename) {
> -		pr_info("Failed to allocate filename.\n");
>  		ret = -ENOMEM;
>  		goto error;
>  	}
> @@ -518,7 +517,6 @@ static int create_trace_uprobe(int argc, char **argv)
>  		}
>  
>  		if (!parg->name) {
> -			pr_info("Failed to allocate argument[%d] name.\n", i);
>  			ret = -ENOMEM;
>  			goto error;
>  		}

