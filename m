From: Hartley Sweeten <HartleyS@visionengravers.com>
Date: Wed, 29 Jul 2015 23:06:52 +0000
Subject: RE: [patch] staging: comedi: das16: remove a duplicate condition
Message-Id: <BN3PR0101MB10576026D2A46EA48B84AB28D08C0@BN3PR0101MB1057.prod.exchangelabs.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150729213632.GE21784@mwanda>
In-Reply-To: <20150729213632.GE21784@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday, July 29, 2015 2:37 PM, Dan Carpenter wrote:
> We checked that "it->options[3]" was non-zero on the line before so
> there is no need to check again.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
v
> diff --git a/drivers/staging/comedi/drivers/das16.c b/drivers/staging/comedi/drivers/das16.c
> index d7cf4b1..056bca9 100644
> --- a/drivers/staging/comedi/drivers/das16.c
> +++ b/drivers/staging/comedi/drivers/das16.c
> @@ -1032,8 +1032,7 @@ static int das16_attach(struct comedi_device *dev, struct comedi_devconfig *it)
>  
>  	/*  check that clock setting is valid */
>  	if (it->options[3]) {
> -		if (it->options[3] != 0 &&
> -		    it->options[3] != 1 && it->options[3] != 10) {
> +		if (it->options[3] != 1 && it->options[3] != 10) {
>  			dev_err(dev->class_dev,
>  				"Invalid option. Master clock must be set to 1 or 10 (MHz)\n");
>  			return -EINVAL;

Thanks,

Reviewed-by: H Hartley Sweeten <hsweeten@visionengravers.com>

