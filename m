From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2017 21:38:46 +0000
Subject: Re: [PATCH] drm/amd/display: remove unnecessary cast and use kcalloc instead of kzalloc
Message-Id: <CADnq5_P=poTAQkpxY8qwKGMyphbJzYOT8FKF=NnR-LkQP8Z8HQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171115154509.18054-1-colin.king@canonical.com>
In-Reply-To: <20171115154509.18054-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <tony.cheng@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Wed, Nov 15, 2017 at 10:45 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Use kcalloc instead of kzalloc and the cast on the return from kzalloc is
> unnecessary and can be removed.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed and pushed.

Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/basics/logger.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/logger.c b/drivers/gpu/drm/amd/display/dc/basics/logger.c
> index e04e8ecd4874..2ff5b467603d 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/logger.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/logger.c
> @@ -70,9 +70,8 @@ static bool construct(struct dc_context *ctx, struct dal_logger *logger,
>  {
>         /* malloc buffer and init offsets */
>         logger->log_buffer_size = DAL_LOGGER_BUFFER_MAX_SIZE;
> -       logger->log_buffer = (char *)kzalloc(logger->log_buffer_size * sizeof(char),
> -                                            GFP_KERNEL);
> -
> +       logger->log_buffer = kcalloc(logger->log_buffer_size, sizeof(char),
> +                                    GFP_KERNEL);
>         if (!logger->log_buffer)
>                 return false;
>
> --
> 2.14.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
