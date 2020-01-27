From: Michal Simek <michal.simek@xilinx.com>
Date: Mon, 27 Jan 2020 11:03:02 +0000
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
Message-Id: <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200127102303.44133-1-colin.king@canonical.com>
In-Reply-To: <20200127102303.44133-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 27. 01. 20 11:23, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a statement that is indented one level too deeply, remove
> the extraneous tab.
> 
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
>  		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
>  		if (time_after(jiffies, timeout)) {
>  			dev_err(i2c->dev, "Failed to clear rx fifo\n");
> -				return -ETIMEDOUT;
> +			return -ETIMEDOUT;
>  		}
>  	}
>  
> 

As was suggested by Peter you should also add Fixes: <sha1> ("patch
subject")

Thanks,
Michal
