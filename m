From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 28 Mar 2019 00:37:43 +0000
Subject: Re: [PATCH] tracing: fix potential null pointer dereference on rctr_end
Message-Id: <20190327203743.751ce68b@oasis.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180927224700.13739-1-colin.king@canonical.com>
In-Reply-To: <20180927224700.13739-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


I just found this in the depths of my inbox (which is now managed by a
local Patchwork system, so no more lost patches!)

On Thu, 27 Sep 2018 23:47:00 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently rctr_end may assigned null if strchr() fails leading to
> a null pointer dereference in the following check on *(rctr_end + 1).
> Fix this by also adding a null pointer check before the dereference.
> 
> Detected by CoverityScan, CID#1473700 ("Dereference null return value")
> 
> Fixes: 1cc33161a83d ("uprobes: Support SDT markers having reference count (semaphore)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/trace/trace_uprobe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
> index 3a7c73c40007..c5514651e61f 100644
> --- a/kernel/trace/trace_uprobe.c
> +++ b/kernel/trace/trace_uprobe.c
> @@ -477,7 +477,7 @@ static int create_trace_uprobe(int argc, char **argv)
>  	rctr = strchr(arg, '(');
>  	if (rctr) {
>  		rctr_end = strchr(rctr, ')');
> -		if (rctr > rctr_end || *(rctr_end + 1) != 0) {
> +		if (!rctr_end || rctr > rctr_end || *(rctr_end + 1) != 0) {

I think this is a false positive.

rctr and rctr_end are pointers. Thus, they are compared as unsigned.

To get into this code, rctr must be non NULL (greater than zero)

The first compare of the if conditional is:

	rctr > rctr_end

If rctr_end is NULL, then that is guaranteed to be true!

Which means, the rctr_end will not be access, and we exit out safely.

-- Steve

>  			ret = -EINVAL;
>  			pr_info("Invalid reference counter offset.\n");
>  			goto fail_address_parse;
