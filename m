From: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 28 Feb 2012 14:16:31 +0000
Subject: Re: [PATCH] Trace: initialize variable to clear warning
Message-Id: <1330438591.25686.214.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330420174-20537-1-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1330420174-20537-1-git-send-email-ruan.zhengwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Cc: fweisbec@gmail.com, mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2012-02-28 at 17:09 +0800, Zhengwang Ruan wrote:
> GCC warns that 'page2' is used without being initialized previously before
> being used, this is to clear it.
> 

This is a bug in gcc that's fixed in 4.6 and beyond. I don't want to
remove this warning because it will hide a real bug if page2 really does
become uninitialized. If 4.6 gives a warning here, then I'll fix it.

Note, we can't just initialize it here either, because it is initialized
in the code, and if it gets used later without that initialization then
it will break. No default will work.

Thanks,

-- Steve

> Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
> ---
>  kernel/trace/trace.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index a3f1bc5..47376ba 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -3694,7 +3694,7 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
>  	int nr_pages = 1;
>  	ssize_t written;
>  	void *page1;
> -	void *page2;
> +	void *uninitialized_var(page2);
>  	int offset;
>  	int size;
>  	int len;


