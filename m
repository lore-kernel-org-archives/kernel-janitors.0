From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 28 Dec 2017 21:19:22 +0000
Subject: Re: [PATCH] tee: shm: make function __tee_shm_alloc static
Message-Id: <CAHUa44GJie-vYy4Vzuyaj4fHORBCKAWBdXvmBJc5RqyVhFok7w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171222170122.30477-1-colin.king@canonical.com>
In-Reply-To: <20171222170122.30477-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Dec 22, 2017 at 6:01 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The function __tee_shm_alloc is local to the source and does
> not need to be in global scope, so make it static.
>
> Cleans up sparse warning:
> symbol '__tee_shm_alloc' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/tee/tee_shm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 04e1b8b37046..13b4de1157c7 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -112,9 +112,9 @@ static const struct dma_buf_ops tee_shm_dma_buf_ops = {
>         .mmap = tee_shm_op_mmap,
>  };
>
> -struct tee_shm *__tee_shm_alloc(struct tee_context *ctx,
> -                               struct tee_device *teedev,
> -                               size_t size, u32 flags)
> +static struct tee_shm *__tee_shm_alloc(struct tee_context *ctx,
> +                                      struct tee_device *teedev,
> +                                      size_t size, u32 flags)
>  {
>         struct tee_shm_pool_mgr *poolm = NULL;
>         struct tee_shm *shm;
> --
> 2.14.1
>

Looks good. Thanks.

/Jens
