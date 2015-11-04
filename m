From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 04 Nov 2015 15:28:27 +0000
Subject: Re: [patch] bus: sunxi-rsb: unlock on error in sunxi_rsb_read()
Message-Id: <CAGb2v65nxJfszKUyOMb7sjLTtvvBTGy=FLwysLt5t_9xa1BcfQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151103220244.GA19280@mwanda>
In-Reply-To: <20151103220244.GA19280@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Nov 4, 2015 at 6:02 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Don't forget to unlock before returning an error code.
>
> Fixes: d787dcdb9c8f ('bus: sunxi-rsb: Add driver for Allwinner Reduced Serial Bus')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

>
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index 846bc29c..0cfcb39 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -342,13 +342,13 @@ static int sunxi_rsb_read(struct sunxi_rsb *rsb, u8 rtaddr, u8 addr,
>
>         ret = _sunxi_rsb_run_xfer(rsb);
>         if (ret)
> -               goto out;
> +               goto unlock;
>
>         *buf = readl(rsb->regs + RSB_DATA);
>
> +unlock:
>         mutex_unlock(&rsb->lock);
>
> -out:
>         return ret;
>  }
>
