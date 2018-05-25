From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Fri, 25 May 2018 13:16:21 +0000
Subject: Re: [PATCH v2] media: davinci vpbe: array underflow in vpbe_enum_outputs()
Message-Id: <a322043a-5b45-b695-4302-173c5111896b@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180525131239.45exrwgxr2f3kb57@kili.mountain>
In-Reply-To: <20180525131239.45exrwgxr2f3kb57@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Manjunath Hadli <manjunath.hadli@ti.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On 25/05/18 15:12, Dan Carpenter wrote:
> In vpbe_enum_outputs() we check if (temp_index >= cfg->num_outputs) but
> the problem is that temp_index can be negative.  I've made
> cgf->num_outputs unsigned to fix this issue.

Shouldn't temp_index also be made unsigned? It certainly would make a lot of
sense to do that.

Regards,

	Hans

> 
> Fixes: 66715cdc3224 ("[media] davinci vpbe: VPBE display driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fix it a different way
> 
> diff --git a/include/media/davinci/vpbe.h b/include/media/davinci/vpbe.h
> index 79a566d7defd..180a05e91497 100644
> --- a/include/media/davinci/vpbe.h
> +++ b/include/media/davinci/vpbe.h
> @@ -92,7 +92,7 @@ struct vpbe_config {
>  	struct encoder_config_info *ext_encoders;
>  	/* amplifier information goes here */
>  	struct amp_config_info *amp;
> -	int num_outputs;
> +	unsigned int num_outputs;
>  	/* Order is venc outputs followed by LCD and then external encoders */
>  	struct vpbe_output *outputs;
>  };
> 

