From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 28 Dec 2017 21:10:28 +0000
Subject: Re: [PATCH] tee: shm: don't put_page on null shm->pages
Message-Id: <CAHUa44EN8iibPU=j3nWqvPONONop8mBXtwowbqb3i_XGYppUmg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171222175150.3691-1-colin.king@canonical.com>
In-Reply-To: <20171222175150.3691-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Dec 22, 2017 at 6:51 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> In the case that shm->pages fails to allocate, the current exit
> error path will try to put_page on a null shm->pages and cause
> a null pointer dereference when accessing shm->pages[n]. Fix this
> by only performing the put_page and kfree on shm->pages if it
> is not null.
>
> Detected by CoverityScan, CID#1463283 ("Dereference after null check")
>
> Fixes: 033ddf12bcf5 ("tee: add register user memory")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/tee/tee_shm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 13b4de1157c7..6890c8aaef8c 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -335,9 +335,11 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
>                         idr_remove(&teedev->idr, shm->id);
>                         mutex_unlock(&teedev->mutex);
>                 }
> -               for (n = 0; n < shm->num_pages; n++)
> -                       put_page(shm->pages[n]);
> -               kfree(shm->pages);
> +               if (shm->pages) {
> +                       for (n = 0; n < shm->num_pages; n++)
> +                               put_page(shm->pages[n]);
> +                       kfree(shm->pages);
> +               }
>         }
>         kfree(shm);
>         teedev_ctx_put(ctx);
> --
> 2.14.1
>

Looks good. Thanks.

/Jens
