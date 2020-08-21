From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 21 Aug 2020 13:03:39 +0000
Subject: Re: [PATCH] ms_block: fix spelling mistake "doesn'" -> "doesn't"
Message-Id: <CAPDyKFrS0798_ftgBti+hJY3F2UpSFmDkTQcPzRNXtFAALfDVA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200810080247.47024-1-colin.king@canonical.com>
In-Reply-To: <20200810080247.47024-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 10 Aug 2020 at 10:02, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a debug message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index d9ee8e3dc72d..ad1c6f2db089 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -1223,7 +1223,7 @@ static int msb_read_boot_blocks(struct msb_data *msb)
>                 }
>
>                 if (be16_to_cpu(page->header.block_id) != MS_BLOCK_BOOT_ID) {
> -                       dbg("the pba at %d doesn' contain boot block ID", pba);
> +                       dbg("the pba at %d doesn't contain boot block ID", pba);
>                         continue;
>                 }
>
> --
> 2.27.0
>
