From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 02 May 2020 18:17:25 +0000
Subject: Re: [PATCH] iio: dac: vf610: Fix an error handling path in 'vf610_dac_probe()'
Message-Id: <20200502191725.10eabc8a@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426194403.41913-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200426194403.41913-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, maitysanchayan@gmail.com, robh@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 26 Apr 2020 21:44:03 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> A call to 'vf610_dac_exit()' is missing in an error handling path.
> 
> Fixes: 1b983bf42fad ("iio: dac: vf610_dac: Add IIO DAC driver for Vybrid SoC")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

I'll count this one as 'obviously' correct, though happy to have input
from sanchayan if possible.

Applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

> ---
> Un-tested.
> Proposal based on function names and functions called in the remove function
> ---
>  drivers/iio/dac/vf610_dac.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/dac/vf610_dac.c b/drivers/iio/dac/vf610_dac.c
> index 71f8a5c471c4..7f1e9317c3f3 100644
> --- a/drivers/iio/dac/vf610_dac.c
> +++ b/drivers/iio/dac/vf610_dac.c
> @@ -223,6 +223,7 @@ static int vf610_dac_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error_iio_device_register:
> +	vf610_dac_exit(info);
>  	clk_disable_unprepare(info->clk);
>  
>  	return ret;
