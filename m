From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 09 Aug 2018 14:18:42 +0000
Subject: Re: [PATCH] ftrace: remove unused pointer ftrace_swapper_pid
Message-Id: <20180809101842.5994fd21@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180809125609.13142-1-colin.king@canonical.com>
In-Reply-To: <20180809125609.13142-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu,  9 Aug 2018 13:56:09 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer ftrace_swapper_pid is defined but is never used hence it is
> redundant and can be removed. The use of this variable was removed
> in commit 345ddcc882d8 ("ftrace: Have set_ftrace_pid use the bitmap
> like events do").
> 
> Cleans up clang warning:
> warning: 'ftrace_swapper_pid' defined but not used [-Wunused-const-variable=]

Thanks, applied!

-- Steve

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/trace/ftrace.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index caf9cbf35816..2cc008cfbd4f 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -1049,8 +1049,6 @@ static __init void ftrace_profile_tracefs(struct dentry *d_tracer)
>  }
>  #endif /* CONFIG_FUNCTION_PROFILER */
>  
> -static struct pid * const ftrace_swapper_pid = &init_struct_pid;
> -
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  static int ftrace_graph_active;
>  #else

