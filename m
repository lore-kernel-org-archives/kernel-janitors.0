From: Pavel Begunkov <asml.silence@gmail.com>
Date: Wed, 08 Jul 2020 19:01:16 +0000
Subject: Re: [PATCH] io_uring: fix a use after free in io_async_task_func()
Message-Id: <4ea3c931-1738-14e2-aac6-55ef9b3dedeb@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708184711.GA31157@mwanda>
In-Reply-To: <20200708184711.GA31157@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/07/2020 21:47, Dan Carpenter wrote:
> The "apoll" variable is freed and then used on the next line.  We need
> to move the free down a few lines.

My bad, thanks for spotting that!
A comment below

> 
> Fixes: 0be0b0e33b0b ("io_uring: simplify io_async_task_func()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/io_uring.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index 70828e2470e2..f2993070a9e8 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -4652,12 +4652,13 @@ static void io_async_task_func(struct callback_head *cb)
>  	/* restore ->work in case we need to retry again */
>  	if (req->flags & REQ_F_WORK_INITIALIZED)
>  		memcpy(&req->work, &apoll->work, sizeof(req->work));
> -	kfree(apoll);

__io_req_task_submit() can take some time, e.g. waiting for a mutex, so
I'd rather free it before, but save req->poll.canceled in a local var.

>  
>  	if (!READ_ONCE(apoll->poll.canceled))
>  		__io_req_task_submit(req);
>  	else
>  		__io_req_task_cancel(req, -ECANCELED);
> +
> +	kfree(apoll);
>  }
>  
>  static int io_async_wake(struct wait_queue_entry *wait, unsigned mode, int sync,
> 

-- 
Pavel Begunkov
