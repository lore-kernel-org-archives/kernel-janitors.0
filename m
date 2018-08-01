From: Jonathan Cameron <jic23@kernel.org>
Date: Wed, 01 Aug 2018 17:59:07 +0000
Subject: Re: [PATCH] iio: light: si1133: fix an && vs || typo
Message-Id: <20180801185907.3dd0cc81@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180731181134.rp57ywlshwqm4onu@kili.mountain>
In-Reply-To: <20180731181134.rp57ywlshwqm4onu@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime =?UTF-8?B?Um91c3Npbi1Cw6lsYW5nZXI=?= <maxime.roussinbelanger@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Jean-Francois Dagenais <jeff.dagenais@gmail.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 31 Jul 2018 21:11:34 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "val" variable can't be both 0 and 1 at the same time so this will
> always return -EINVAL.
> 
> Fixes: e01e7eaf37d8 ("iio: light: introduce si1133")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thanks.  This time Colin King beat you to it.

Jonathan

> 
> diff --git a/drivers/iio/light/si1133.c b/drivers/iio/light/si1133.c
> index d3fbeb3bc463..5ac22c46da1f 100644
> --- a/drivers/iio/light/si1133.c
> +++ b/drivers/iio/light/si1133.c
> @@ -838,7 +838,7 @@ static int si1133_write_raw(struct iio_dev *iio_dev,
>  		switch (chan->type) {
>  		case IIO_INTENSITY:
>  		case IIO_UVINDEX:
> -			if (val != 0 || val != 1)
> +			if (val != 0 && val != 1)
>  				return -EINVAL;
>  
>  			return si1133_update_adcsens(data,

