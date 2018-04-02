From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Mon, 02 Apr 2018 06:58:49 +0000
Subject: Re: [PATCH] selftests/ftrace: fix spelling mistake: "tiggers" -> "triggers"
Message-Id: <20180402155849.109fcb9c5d4653fc7adcddf1@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180329172431.8171-1-colin.king@canonical.com>
In-Reply-To: <20180329172431.8171-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 29 Mar 2018 18:24:31 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in message text
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Oops, thanks!

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

> ---
>  tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
> index c5ef8b9d02b3..1b8faf4c318c 100644
> --- a/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
> +++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
> @@ -35,7 +35,7 @@ do_reset
>  
>  reset_trigger
>  
> -echo "Test histogram multiple tiggers"
> +echo "Test histogram multiple triggers"
>  
>  echo 'hist:keys=parent_pid:vals=child_pid' > events/sched/sched_process_fork/trigger
>  echo 'hist:keys=parent_comm:vals=child_pid' >> events/sched/sched_process_fork/trigger
> -- 
> 2.15.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
