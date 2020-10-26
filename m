From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
Date: Mon, 26 Oct 2020 07:31:34 +0000
Subject: RE: [PATCH] Input: adxl34x - clean up a data type in adxl34x_probe()
Message-Id: <BN6PR03MB25968C0FF47F64CF580887B18E190@BN6PR03MB2596.namprd03.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201026072824.GA1620546@mwanda>
In-Reply-To: <20201026072824.GA1620546@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Montag, 26. Oktober 2020 08:28
> To: Hennerich, Michael <Michael.Hennerich@analog.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; linux-
> input@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] Input: adxl34x - clean up a data type in adxl34x_probe()
> 
> The "revid" is used to store negative error codes so it should be an int type.
> 
> Fixes: e27c729219ad ("Input: add driver for ADXL345/346 Digital
> Accelerometers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/input/misc/adxl34x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c index
> 5fe92d4ba3f0..4cc4e8ff42b3 100644
> --- a/drivers/input/misc/adxl34x.c
> +++ b/drivers/input/misc/adxl34x.c
> @@ -696,7 +696,7 @@ struct adxl34x *adxl34x_probe(struct device *dev, int
> irq,
>  	struct input_dev *input_dev;
>  	const struct adxl34x_platform_data *pdata;
>  	int err, range, i;
> -	unsigned char revid;
> +	int revid;
> 
>  	if (!irq) {
>  		dev_err(dev, "no IRQ?\n");
> --
> 2.28.0
