From: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 26 Mar 2019 01:36:07 +0000
Subject: Re: [PATCH -next] ring-buffer: Fix ring buffer size in rb_write_something
Message-Id: <20190325213607.74a62138@oasis.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537704693-184237-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537704693-184237-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 23 Sep 2018 12:11:33 +0000
YueHaibing <yuehaibing@huawei.com> wrote:

> 'cnt' should be used to calculate ring buffer size rather than data->cnt

I just found this patch in my inbox (was traveling at the time. But now
I have patchwork attached to my INBOX so patches like these shouldn't
be missed anymore!)

Yes, you are correct, this should be fixed. But as it is just for a
startup test, I'll queue it for the next merge window.

Thanks and sorry for the delay.

-- Steve

> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  kernel/trace/ring_buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 65bd461..53538c3 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -4924,7 +4924,7 @@ static __init int rb_write_something(struct
> rb_test_data *data, bool nested) cnt = data->cnt + (nested ? 27 : 0);
>  
>  	/* Multiply cnt by ~e, to make some unique increment */
> -	size = (data->cnt * 68 / 25) % (sizeof(rb_string) - 1);
> +	size = (cnt * 68 / 25) % (sizeof(rb_string) - 1);
>  
>  	len = size + sizeof(struct rb_item);
>  
> 
> 
