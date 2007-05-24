From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 24 May 2007 15:41:14 +0000
Subject: [KJ] Re: [PATCH] indentation fixes, potential parse error,
Message-Id: <873b1mns9x.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Yoann Padioleau <padator@wanadoo.fr> writes:

Sorry, one of my fix fails with  make allyesconfig

> diff --git a/drivers/scsi/3w-9xxx.c b/drivers/scsi/3w-9xxx.c
> index eb766c3..70b47a6 100644
> --- a/drivers/scsi/3w-9xxx.c
> +++ b/drivers/scsi/3w-9xxx.c
> @@ -1060,7 +1060,7 @@ static void *twa_get_param(TW_Device_Ext
>  
>  	/* Poll for completion */
>  	if (twa_poll_response(tw_dev, request_id, 30))
> -		TW_PRINTK(tw_dev->host, TW_DRIVER, 0x13, "No valid response during get param")
> +		TW_PRINTK(tw_dev->host, TW_DRIVER, 0x13, "No valid response during get param");
>  	else
>  		retval = (void *)&(param->data[0]);
>  

But it seems ugly that on this particular case the call to the
TW_PRINTK must not have a trailing ';'. Maybe the macro is fragile
and should be changed.

In the same way I found this in drivers/cdrom/cm206.c

static uch receive_byte(int timeout)
{
	uch ret;
	cli();
	debug(("cli\n"));
	ret = cd->ur[cd->ur_r];
	if (cd->ur_r != cd->ur_w) {
		sti();
		debug(("returning #%d: 0x%x\n", cd->ur_r,
		       cd->ur[cd->ur_r]));
		cd->ur_r++;
		cd->ur_r %= UR_SIZE;
		return ret;
	} else if (sleep_or_timeout(&cd->uart, timeout)) {	/* does sti() */
		debug(("Time out on receive-buffer\n"));
#ifdef STATISTICS
		if (timeout = UART_TIMEOUT)
			stats(receive_timeout)	/* no `;'! */
			    else
			stats(dsb_timeout);
#endif
		return 0xda;
	}
	ret = cd->ur[cd->ur_r];
	debug(("slept; returning #%d: 0x%x\n", cd->ur_r,
	       cd->ur[cd->ur_r]));
	cd->ur_r++;
	cd->ur_r %= UR_SIZE;
	return ret;
}

The /* no `;'! */ comment looks very ugly. Wouldn't it be  possible
to change the stats macro to make it less fragile ? 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
