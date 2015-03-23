From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Mon, 23 Mar 2015 01:49:56 +0000
Subject: Re: [patch 2/2] extcon: max77843: fix an error code in max77843_init_muic_regmap()
Message-Id: <550F7144.9050608@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150315105604.GE20691@mwanda>
In-Reply-To: <20150315105604.GE20691@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 03/15/2015 07:56 PM, Dan Carpenter wrote:
> "max77843->i2c_muic" is NULL, not an error code.  Let's return -ENODEV
> here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
> index a3f80ca..6f0ed5a 100644
> --- a/drivers/extcon/extcon-max77843.c
> +++ b/drivers/extcon/extcon-max77843.c
> @@ -715,7 +715,7 @@ static int max77843_init_muic_regmap(struct max77843 *max77843)
>  	if (!max77843->i2c_muic) {
>  		dev_err(&max77843->i2c->dev,
>  				"Cannot allocate I2C device for MUIC\n");
> -		return PTR_ERR(max77843->i2c_muic);
> +		return -ENODEV;

I think that -ENOMEM is more proper error than -ENODEV.
So, I'll use -ENOMEM value and applied it on extcon-next branch.

Thanks,
Chanwoo Choi


>  	}
>  
>  	i2c_set_clientdata(max77843->i2c_muic, max77843);
> 

