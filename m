From: Andy Walls <awalls@radix.net>
Date: Thu, 18 Mar 2010 11:37:22 +0000
Subject: Re: [patch] ivtv: sizeof() => ARRAY_SIZE()
Message-Id: <1268912242.3084.7.camel@palomino.walls.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100317151156.GG5331@bicker>
In-Reply-To: <20100317151156.GG5331@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2010-03-17 at 18:11 +0300, Dan Carpenter wrote:
> This fixes a smatch warning:
> drivers/media/video/ivtv/ivtv-vbi.c +138 ivtv_write_vbi(43) 
> 	error: buffer overflow 'vi->cc_payload' 256 <= 1023
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Looks good.

Reviewed-by: Andy Walls <awalls@radix.net>

And, if needed

Signed-off-by: Andy Walls <awalls@radix.net>

Regards,
Andy

> diff --git a/drivers/media/video/ivtv/ivtv-vbi.c b/drivers/media/video/ivtv/ivtv-vbi.c
> index f420d31..d73af45 100644
> --- a/drivers/media/video/ivtv/ivtv-vbi.c
> +++ b/drivers/media/video/ivtv/ivtv-vbi.c
> @@ -134,7 +134,7 @@ void ivtv_write_vbi(struct ivtv *itv, const struct v4l2_sliced_vbi_data *sliced,
>  			}
>  		}
>  	}
> -	if (found_cc && vi->cc_payload_idx < sizeof(vi->cc_payload)) {
> +	if (found_cc && vi->cc_payload_idx < ARRAY_SIZE(vi->cc_payload)) {
>  		vi->cc_payload[vi->cc_payload_idx++] = cc;
>  		set_bit(IVTV_F_I_UPDATE_CC, &itv->i_flags);
>  	}
> 

