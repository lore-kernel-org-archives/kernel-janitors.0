From: Sean Young <sean@mess.org>
Date: Sun, 01 Nov 2020 11:04:52 +0000
Subject: Re: [PATCH] media: rc: validate that "rc_proto" is reasonable
Message-Id: <20201101110452.GA8281@gofer.mess.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201030115230.GF3251003@mwanda>
In-Reply-To: <20201030115230.GF3251003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Oct 30, 2020 at 02:52:30PM +0300, Dan Carpenter wrote:
> Smatch complains that "rc_proto" comes from the user and it can result
> in shift wrapping in ir_raw_encode_scancode()
> 
>     drivers/media/rc/rc-ir-raw.c:526 ir_raw_encode_scancode()
>     error: undefined (user controlled) shift '1 << protocol'
> 
> This is true, but I reviewed the surrounding code and it appears
> harmless.  Anyway, let's verify that "rc_proto" is valid as a kernel
> hardenning measure.

It would mean that suddenly an invalid rc proto could become valid; also
like you say, this is a good hardening measure.

Good catch, thank you.

Regards,

Sean

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/rc/lirc_dev.c | 3 ++-
>  include/uapi/linux/lirc.h   | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
> index f99d9dcae667..c1eb960adde3 100644
> --- a/include/uapi/linux/lirc.h
> +++ b/include/uapi/linux/lirc.h
> @@ -226,6 +226,7 @@ enum rc_proto {
>  	RC_PROTO_RCMM24		= 25,
>  	RC_PROTO_RCMM32		= 26,
>  	RC_PROTO_XBOX_DVD	= 27,
> +	RC_PROTO_MAX		= RC_PROTO_XBOX_DVD,
>  };
>  
>  #endif
> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> index 220363b9a868..116daf90c858 100644
> --- a/drivers/media/rc/lirc_dev.c
> +++ b/drivers/media/rc/lirc_dev.c
> @@ -263,7 +263,8 @@ static ssize_t lirc_transmit(struct file *file, const char __user *buf,
>  			goto out_unlock;
>  		}
>  
> -		if (scan.flags || scan.keycode || scan.timestamp) {
> +		if (scan.flags || scan.keycode || scan.timestamp ||
> +		    scan.rc_proto > RC_PROTO_MAX) {
>  			ret = -EINVAL;
>  			goto out_unlock;
>  		}
> -- 
> 2.28.0
