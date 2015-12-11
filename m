From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 11 Dec 2015 18:12:56 +0000
Subject: Re: [PATCH] bpf: constify bpf_verifier_ops structure
Message-Id: <20151211131256.41097162@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449855359-13724-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449855359-13724-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org

On Fri, 11 Dec 2015 18:35:59 +0100
Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> This bpf_verifier_ops structure is never modified, like the other
> bpf_verifier_ops structures, so declare it as const.
> 
> Done with the help of Coccinelle.

Thanks, I'll add this to my 4.5 queue.

-- Steve

> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  kernel/trace/bpf_trace.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 4228fd3..45dd798 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -316,7 +316,7 @@ static bool kprobe_prog_is_valid_access(int off, int size, enum bpf_access_type
>  	return true;
>  }
>  
> -static struct bpf_verifier_ops kprobe_prog_ops = {
> +static const struct bpf_verifier_ops kprobe_prog_ops = {
>  	.get_func_proto  = kprobe_prog_func_proto,
>  	.is_valid_access = kprobe_prog_is_valid_access,
>  };

