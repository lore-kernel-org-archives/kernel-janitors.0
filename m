From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 03 Mar 2019 16:16:10 +0000
Subject: Re: [PATCH][next] iio: st_accel: remove redundant unsigned less than zero check
Message-Id: <20190303161610.43a03ffa@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221104636.1922-1-colin.king@canonical.com>
In-Reply-To: <20190221104636.1922-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 21 Feb 2019 10:46:36 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The check that variable val is less than zero is redundant since val
> is an unsigned int and hence can never be less than zero. Remove it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Applied.

Thanks,

Jonathan

> ---
>  drivers/iio/accel/st_accel_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/st_accel_core.c b/drivers/iio/accel/st_accel_core.c
> index a3c0916479fa..9930edf423bf 100644
> --- a/drivers/iio/accel/st_accel_core.c
> +++ b/drivers/iio/accel/st_accel_core.c
> @@ -992,7 +992,7 @@ static int apply_acpi_orientation(struct iio_dev *indio_dev,
>  			goto out;
>  
>  		val = elements[i].integer.value;
> -		if (val < 0 || val > 2)
> +		if (val > 2)
>  			goto out;
>  
>  		/* Avoiding full matrix multiplication, we simply reorder the
