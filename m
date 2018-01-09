From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 09 Jan 2018 13:35:02 +0000
Subject: Re: [PATCH] tee: shm: Potential NULL dereference calling tee_shm_register()
Message-Id: <CAHUa44HDn2Hxnzeo3WgE1W5YMDwYm0pA4VC6zuWhLksBXdDNeQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180106092230.kwoztytj555muqg6@mwanda>
In-Reply-To: <20180106092230.kwoztytj555muqg6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jan 6, 2018 at 10:22 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> get_user_pages_fast() can return zero in certain error paths.  We should
> handle that or else it means we accidentally return ERR_PTR(0) which is
> NULL instead of an error pointer.  The callers are not expecting that
> and will crash with a NULL dereference.
>
> Fixes: 033ddf12bcf5 ("tee: add register user memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 04e1b8b37046..cdeb4156acda 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -283,7 +283,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
>         if (rc > 0)
>                 shm->num_pages = rc;
>         if (rc != num_pages) {
> -               if (rc > 0)
> +               if (rc >= 0)
>                         rc = -ENOMEM;
>                 ret = ERR_PTR(rc);
>                 goto err;

Looks good. Thanks.

/Jens
