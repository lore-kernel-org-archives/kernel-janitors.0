From: Oliver Endriss <o.endriss@gmx.de>
Date: Tue, 15 Feb 2011 02:00:17 +0000
Subject: Re: [patch] [media] stv090x: handle allocation failures
Message-Id: <201102150300.19650@orion.escape-edv.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110207165650.GF4384@bicker>
In-Reply-To: <20110207165650.GF4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Manu Abraham <manu@linuxtv.org>, Andreas Regel <andreas.regel@gmx.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Monday 07 February 2011 17:56:50 Dan Carpenter wrote:
> kmalloc() can fail so check whether state->internal is NULL.
> append_internal() can return NULL on allocation failures so check that.
> Also if we hit the error condition later in the function then there is
> a memory leak and we need to call remove_dev() to fix it.
> ...

Thanks for the patch. See my comment below.

> --- a/drivers/media/dvb/frontends/stv090x.c
> +++ b/drivers/media/dvb/frontends/stv090x.c
> @@ -4783,7 +4783,13 @@ struct dvb_frontend *stv090x_attach(const struct stv090x_config *config,
>  	} else {
>  		state->internal = kmalloc(sizeof(struct stv090x_internal),
>  					  GFP_KERNEL);
> +		if (!state->internal)
> +			goto error;
>  		temp_int = append_internal(state->internal);
> +		if (!temp_int) {
> +			kfree(state->internal);
> +			goto error;
> +		}
>  		state->internal->num_used = 1;
>  		state->internal->mclk = 0;
>  		state->internal->dev_ver = 0;
> @@ -4796,7 +4802,7 @@ struct dvb_frontend *stv090x_attach(const struct stv090x_config *config,
>  
>  		if (stv090x_setup(&state->frontend) < 0) {
>  			dprintk(FE_ERROR, 1, "Error setting up device");
> -			goto error;
> +			goto err_remove;
>  		}
>  	}
>  
> @@ -4811,6 +4817,8 @@ struct dvb_frontend *stv090x_attach(const struct stv090x_config *config,
>  
>  	return &state->frontend;
>  
> +err_remove:
> +	remove_dev(state->internal);

AFAICS
        kfree(state->internal);
must be added here, as we allocated state->internal, state and temp_int.

>  error:
>  	kfree(state);
>  	return NULL;

CU
Oliver

-- 
----------------------------------------------------------------
VDR Remote Plugin 0.4.0: http://www.escape-edv.de/endriss/vdr/
4 MByte Mod: http://www.escape-edv.de/endriss/dvb-mem-mod/
Full-TS Mod: http://www.escape-edv.de/endriss/dvb-full-ts-mod/
----------------------------------------------------------------
