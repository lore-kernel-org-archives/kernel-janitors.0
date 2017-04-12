From: Rodolfo Giometti <giometti@enneenne.com>
Date: Wed, 12 Apr 2017 09:18:56 +0000
Subject: Re: [PATCH] c2port: checking for NULL instead of IS_ERR()
Message-Id: <aeae847b-12c5-9bdf-ece6-76e86f16b76c@enneenne.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170412083321.GC3250@mwanda>
In-Reply-To: <20170412083321.GC3250@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, Rodolfo Giometti <giometti@linux.it>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On 04/12/17 10:33, Dan Carpenter wrote:
> c2port_device_register() never returns NULL, it uses error pointers.
>
> Fixes: 65131cd52b9e ("c2port: add c2port support for Eurotech Duramar 2150")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Rodolfo Giometti <giometti@linux.it>

> diff --git a/drivers/misc/c2port/c2port-duramar2150.c b/drivers/misc/c2port/c2port-duramar2150.c
> index 5484301d57d9..3dc61ea7dc64 100644
> --- a/drivers/misc/c2port/c2port-duramar2150.c
> +++ b/drivers/misc/c2port/c2port-duramar2150.c
> @@ -129,8 +129,8 @@ static int __init duramar2150_c2port_init(void)
>
>  	duramar2150_c2port_dev = c2port_device_register("uc",
>  					&duramar2150_c2port_ops, NULL);
> -	if (!duramar2150_c2port_dev) {
> -		ret = -ENODEV;
> +	if (IS_ERR(duramar2150_c2port_dev)) {
> +		ret = PTR_ERR(duramar2150_c2port_dev);
>  		goto free_region;
>  	}
>
>

-- 

HCE Engineering                      e-mail: giometti@hce-engineering.com
GNU/Linux Solutions                          giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
Cosino Project - the quick prototyping embedded system - www.cosino.io
Freelance ICT Italia - Consulente ICT Italia - www.consulenti-ict.it
