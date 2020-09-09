From: Alain Volmat <alain.volmat@st.com>
Date: Wed, 09 Sep 2020 10:28:23 +0000
Subject: Re: [PATCH] spi: stm32: fix pm_runtime_get_sync() error checking
Message-Id: <20200909102823.GB322@gnbcxd0016.gnb.st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200909094304.GA420136@mwanda>
In-Reply-To: <20200909094304.GA420136@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the patch.

On Wed, Sep 09, 2020 at 12:43:04PM +0300, Dan Carpenter wrote:
> The pm_runtime_get_sync() can return either 0 or 1 on success but this
> code treats 1 as a failure.
> 
> Fixes: db96bf976a4f ("spi: stm32: fixes suspend/resume management")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Alain Volmat <alain.volmat@st.com>

> ---
>  drivers/spi/spi-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index d4b33b358a31..19064df42d25 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -2060,7 +2060,7 @@ static int stm32_spi_resume(struct device *dev)
>  	}
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret) {
> +	if (ret < 0) {
>  		dev_err(dev, "Unable to power device:%d\n", ret);
>  		return ret;
>  	}
> -- 
> 2.28.0
> 
