From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 01 May 2016 19:04:32 +0000
Subject: Re: [patch] iio: dac: ad5592r: Off by one bug in ad5592r_alloc_channels()
Message-Id: <dd84eb1c-277e-78f0-24b1-8a170e4d8730@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160429090330.GB18656@mwanda>
In-Reply-To: <20160429090330.GB18656@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 29/04/16 10:03, Dan Carpenter wrote:
> The > here should be >= or we go beyond the end for the array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Good spot - marked it to pick up when I am back on the internet soonish....
(though perhaps not when I my computer manages to sneak this lot out!)
> 
> diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
> index 948f600..69bde59 100644
> --- a/drivers/iio/dac/ad5592r-base.c
> +++ b/drivers/iio/dac/ad5592r-base.c
> @@ -525,7 +525,7 @@ static int ad5592r_alloc_channels(struct ad5592r_state *st)
>  
>  	device_for_each_child_node(st->dev, child) {
>  		ret = fwnode_property_read_u32(child, "reg", &reg);
> -		if (ret || reg > ARRAY_SIZE(st->channel_modes))
> +		if (ret || reg >= ARRAY_SIZE(st->channel_modes))
>  			continue;
>  
>  		ret = fwnode_property_read_u32(child, "adi,mode", &tmp);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

