From: Marc Zyngier <maz@kernel.org>
Date: Wed, 20 May 2020 12:13:41 +0000
Subject: Re: [PATCH] iio: dummy_evgen: Fix use after free on error in iio_dummy_evgen_create()
Message-Id: <000f28ab442759baf6b6251b207aeabb@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520120306.GD172354@mwanda>
In-Reply-To: <20200520120306.GD172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kate Stewart <kstewart@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, Linus Walleij <linus.walleij@linaro.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 2020-05-20 13:03, Dan Carpenter wrote:
> We need to preserve the "iio_evgen->irq_sim_domain" error code before
> we free "iio_evgen" otherwise it leads to a use after free.
> 
> Fixes: 337cbeb2c13e ("genirq/irq_sim: Simplify the API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iio/dummy/iio_dummy_evgen.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dummy/iio_dummy_evgen.c
> b/drivers/iio/dummy/iio_dummy_evgen.c
> index 409fe0f7df1c..ee85d596e528 100644
> --- a/drivers/iio/dummy/iio_dummy_evgen.c
> +++ b/drivers/iio/dummy/iio_dummy_evgen.c
> @@ -45,6 +45,8 @@ static struct iio_dummy_eventgen *iio_evgen;
> 
>  static int iio_dummy_evgen_create(void)
>  {
> +	int ret;
> +
>  	iio_evgen = kzalloc(sizeof(*iio_evgen), GFP_KERNEL);
>  	if (!iio_evgen)
>  		return -ENOMEM;
> @@ -52,8 +54,9 @@ static int iio_dummy_evgen_create(void)
>  	iio_evgen->irq_sim_domain = irq_domain_create_sim(NULL,
>  							  IIO_EVENTGEN_NO);
>  	if (IS_ERR(iio_evgen->irq_sim_domain)) {
> +		ret = PTR_ERR(iio_evgen->irq_sim_domain);
>  		kfree(iio_evgen);
> -		return PTR_ERR(iio_evgen->irq_sim_domain);
> +		return ret;
>  	}
> 
>  	mutex_init(&iio_evgen->lock);

Nice catch. I've applied it to irq/irqchip-next, since
the offending patch is queued there.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
