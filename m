From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 08 Sep 2014 12:05:02 +0000
Subject: Re: [patch] [media] firewire: firedtv-avc: potential buffer overflow
Message-Id: <20140908140502.20d6f864@kant>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140908111843.GC6947@mwanda>
In-Reply-To: <20140908111843.GC6947@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

On Sep 08 Dan Carpenter wrote:
> "program_info_length" is user controlled and can go up to 4095.  The
> operand[] array has 509 bytes so we need to add a limit here to prevent
> buffer overflows.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Stefan Richter <stefanr@s5r6.in-berlin.de>

Thank you.

> 
> diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
> index d1a1a13..ac17567 100644
> --- a/drivers/media/firewire/firedtv-avc.c
> +++ b/drivers/media/firewire/firedtv-avc.c
> @@ -1157,6 +1157,10 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
>  		if (pmt_cmd_id != 1 && pmt_cmd_id != 4)
>  			dev_err(fdtv->device,
>  				"invalid pmt_cmd_id %d\n", pmt_cmd_id);
> +		if (program_info_length > sizeof(c->operand) - write_pos) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>  
>  		memcpy(&c->operand[write_pos], &msg[read_pos],
>  		       program_info_length);
> @@ -1180,6 +1184,11 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
>  				dev_err(fdtv->device, "invalid pmt_cmd_id %d "
>  					"at stream level\n", pmt_cmd_id);
>  
> +			if (es_info_length > sizeof(c->operand) - write_pos) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +
>  			memcpy(&c->operand[write_pos], &msg[read_pos],
>  			       es_info_length);
>  			read_pos += es_info_length;

-- 
Stefan Richter
-===-==- =--= -=---
http://arcgraph.de/sr/
