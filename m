From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 18 Feb 2020 12:31:35 +0000
Subject: Re: [PATCH] io_uring: remove unnecessary NULL checks
Message-Id: <20200218123135.5iihagj3lkwx4h52@steredhat>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200217143945.ua4lawkg22ggfihr@kili.mountain>
In-Reply-To: <20200217143945.ua4lawkg22ggfihr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 17, 2020 at 05:39:45PM +0300, Dan Carpenter wrote:
> The "kmsg" pointer can't be NULL and we have already dereferenced it so
> a check here would be useless.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/io_uring.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index 72bc378edebc..e9f339453ddb 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -3065,7 +3065,7 @@ static int io_sendmsg(struct io_kiocb *req, struct io_kiocb **nxt,
>  			if (req->io)
>  				return -EAGAIN;
>  			if (io_alloc_async_ctx(req)) {
> -				if (kmsg && kmsg->iov != kmsg->fast_iov)
> +				if (kmsg->iov != kmsg->fast_iov)
>  					kfree(kmsg->iov);
>  				return -ENOMEM;
>  			}
> @@ -3219,7 +3219,7 @@ static int io_recvmsg(struct io_kiocb *req, struct io_kiocb **nxt,
>  			if (req->io)
>  				return -EAGAIN;
>  			if (io_alloc_async_ctx(req)) {
> -				if (kmsg && kmsg->iov != kmsg->fast_iov)
> +				if (kmsg->iov != kmsg->fast_iov)
>  					kfree(kmsg->iov);
>  				return -ENOMEM;
>  			}

Make sense.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano
