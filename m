From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 23 Jul 2018 08:12:39 +0000
Subject: Re: [PATCH] nfc: fdp: remove redundant pointer 'client'
Message-Id: <cd311a1b46eca9b9238a8071a211a7974154ac31.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180720181643.21340-1-colin.king@canonical.com>
In-Reply-To: <20180720181643.21340-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Samuel Ortiz <sameo@linux.intel.com>, Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2018-07-20 at 19:16 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'client' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'client' set but not used [-Wunused-but-set-
> variable]

Oh, thanks! It seems I had missed this when did a refactoring.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/nfc/fdp/i2c.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
> index 70a970c7375c..5d3ea63e405f 100644
> --- a/drivers/nfc/fdp/i2c.c
> +++ b/drivers/nfc/fdp/i2c.c
> @@ -210,7 +210,6 @@ static int fdp_nci_i2c_read(struct fdp_i2c_phy
> *phy, struct sk_buff **skb)
>  static irqreturn_t fdp_nci_i2c_irq_thread_fn(int irq, void *phy_id)
>  {
>  	struct fdp_i2c_phy *phy = phy_id;
> -	struct i2c_client *client;
>  	struct sk_buff *skb;
>  	int r;
>  
> @@ -219,8 +218,6 @@ static irqreturn_t fdp_nci_i2c_irq_thread_fn(int
> irq, void *phy_id)
>  		return IRQ_NONE;
>  	}
>  
> -	client = phy->i2c_dev;
> -
>  	r = fdp_nci_i2c_read(phy, &skb);
>  
>  	if (r = -EREMOTEIO)

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
