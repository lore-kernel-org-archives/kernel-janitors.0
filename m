From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 17 Jan 2020 23:59:07 +0000
Subject: Re: [PATCH] tracing/boot: Fix an IS_ERR() vs NULL bug
Message-Id: <20200118085907.639cd8d683f961bb9310239d@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200117053007.5h2juv272pokqhtq@kili.mountain>
In-Reply-To: <20200117053007.5h2juv272pokqhtq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 17 Jan 2020 08:30:07 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The trace_array_get_by_name() function doesn't return error pointers,
> it returns NULL on error.

Good catch! It used to use trace_array_create() which returns err_ptr,
but trace_array_get_by_name() doesn't anymore.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you!


> 
> Fixes: 4f712a4d04a4 ("tracing/boot: Add instance node support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  kernel/trace/trace_boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace_boot.c b/kernel/trace/trace_boot.c
> index fa9603dc6469..cd541ac1cbc1 100644
> --- a/kernel/trace/trace_boot.c
> +++ b/kernel/trace/trace_boot.c
> @@ -322,7 +322,7 @@ trace_boot_init_instances(struct xbc_node *node)
>  			continue;
>  
>  		tr = trace_array_get_by_name(p);
> -		if (IS_ERR(tr)) {
> +		if (!tr) {
>  			pr_err("Failed to get trace instance %s\n", p);
>  			continue;
>  		}
> -- 
> 2.11.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
