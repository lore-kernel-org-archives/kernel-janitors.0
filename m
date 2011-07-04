From: Liam Girdwood <lrg@kernel.org>
Date: Mon, 04 Jul 2011 16:06:58 +0000
Subject: Re: [patch] regulator/tps65912: storing error codes in u8
Message-Id: <1309795618.3272.9.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110623055715.GM14591@shale.localdomain>
In-Reply-To: <20110623055715.GM14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>
Cc: Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 2011-06-23 at 08:57 +0300, Dan Carpenter wrote:
> get_ctrl_reg() returns -EINVAL so the error handling won't work here
> if reg is a u8.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/regulator/tps65912-regulator.c b/drivers/regulator/tps65912-regulator.c
> index d2c6542..3a9313e 100644
> --- a/drivers/regulator/tps65912-regulator.c
> +++ b/drivers/regulator/tps65912-regulator.c
> @@ -417,7 +417,7 @@ static int tps65912_reg_enable(struct regulator_dev *dev)
>  	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>  	struct tps65912 *mfd = pmic->mfd;
>  	int id = rdev_get_id(dev);
> -	u8 reg;
> +	int reg;
>  
>  	if (id < TPS65912_REG_DCDC1 || id > TPS65912_REG_LDO10)
>  		return -EINVAL;

Samuel, would you mind taking this since tps65912 is upstreaming via
mfd.

Thanks !

Liam

