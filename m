From: Jeff Moyer <jmoyer@redhat.com>
Date: Thu, 22 Aug 2019 13:33:28 +0000
Subject: Re: [PATCH] aio: remove redundant assignment to variable ret
Message-Id: <x49h8699vfb.fsf@segfault.boston.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822110705.19065-1-colin.king@canonical.com>
In-Reply-To: <20190822110705.19065-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 22 Aug 2019 12:07:05 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being set to -EINVAL however this is never read
> and later it is being reassigned to a new value. The assignment is
> redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/aio.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/aio.c b/fs/aio.c
> index f9f441b59966..3e290dfac10a 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -1528,7 +1528,6 @@ static int aio_read(struct kiocb *req, const struct iocb *iocb,
>  	file = req->ki_filp;
>  	if (unlikely(!(file->f_mode & FMODE_READ)))
>  		return -EBADF;
> -	ret = -EINVAL;
>  	if (unlikely(!file->f_op->read_iter))
>  		return -EINVAL;

Acked-by: Jeff Moyer <jmoyer@redhat.com>
