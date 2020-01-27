From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 27 Jan 2020 11:29:33 +0000
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
Message-Id: <CAKfKVtHMbOvwppZcLN=J+2VvJ1GOFgZ2-DDAfav5w9zf1EjZKQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200127102303.44133-1-colin.king@canonical.com>
In-Reply-To: <20200127102303.44133-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-i2c <linux-i2c@vger.kernel.org>

On Mon, Jan 27, 2020 at 4:46 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a statement that is indented one level too deeply, remove
> the extraneous tab.
>
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: fix type in commit message
> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index b17d30c9ab40..90c1c362394d 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -261,7 +261,7 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
>                 xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
>                 if (time_after(jiffies, timeout)) {
>                         dev_err(i2c->dev, "Failed to clear rx fifo\n");
> -                               return -ETIMEDOUT;
> +                       return -ETIMEDOUT;
>                 }
>         }
>
> --
> 2.24.0
>
