From: Vinod Koul <vinod.koul@intel.com>
Date: Tue, 05 May 2015 03:44:26 +0000
Subject: Re: [PATCH] drivers: dma: amba-pl08x: Supress spaces in indentation
Message-Id: <20150505033226.GK3521@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150505013227.GA11053@leo-Inspiron-N5110>
In-Reply-To: <20150505013227.GA11053@leo-Inspiron-N5110>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Carreras <leocarreras89@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, May 04, 2015 at 09:32:27PM -0400, Leonardo Carreras wrote:
> Removed checkpatch reported spaces in indentation.
> 
You should look at git log to come up with patch tags for a subsystem, if
you had done that you would have noticed that we use dmaengine:....

Also you should have run checkpatch and that would have told you a typo in
changelog

Lastly, you should mention which error/warn your are fixing in log.

I have fixed first two and applied this

-- 
~Vinod

> Signed-off-by: Leonardo Carreras <leocarreras89@gmail.com>
> ---
>  drivers/dma/amba-pl08x.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 49d396e..a76df61 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
> @@ -474,7 +474,7 @@ static void pl08x_terminate_phy_chan(struct pl08x_driver_data *pl08x,
>  	u32 val = readl(ch->reg_config);
>  
>  	val &= ~(PL080_CONFIG_ENABLE | PL080_CONFIG_ERR_IRQ_MASK |
> -	         PL080_CONFIG_TC_IRQ_MASK);
> +		PL080_CONFIG_TC_IRQ_MASK);
>  
>  	writel(val, ch->reg_config);
>  
> -- 
> 1.7.9.5
> 

-- 
