From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 11 Jul 2004 13:05:57 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/char/synclink.c MIN/MAX removal
Message-Id: <20040711130557.GE1828@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3310900834509416=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E81A6A.5060904@gmx.net>
In-Reply-To: <40E81A6A.5060904@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============3310900834509416==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 04 Jul 2004, Michael Veeck wrote:

> Patch (against 2.6.7) removes unnecessary min/max macros and changes
> calls to use kernel.h macros instead.
> 
> Feedback is always welcome
> Michael
> 
> 
> 
> 
> 
> 
> 

> --- linux-2.6.7-old/drivers/char/synclink.c	2004-07-04 11:04:14.000000000 +0200
> +++ linux-2.6.7-new/drivers/char/synclink.c	2004-07-04 15:39:15.339423416 +0200
> @@ -942,10 +942,6 @@
>  static void mgsl_change_params(struct mgsl_struct *info);
>  static void mgsl_wait_until_sent(struct tty_struct *tty, int timeout);
>  
> -#ifndef MIN
> -#define MIN(a,b)	((a) < (b) ? (a) : (b))
> -#endif
> -
>  /*
>   * 1st function defined in .text section. Calling this function in
>   * init_module() followed by a breakpoint allows a remote debugger
> @@ -2258,8 +2254,8 @@
>  		if (from_user) {
>  			down(&tmp_buf_sem);
>  			while (1) {
> -				c = MIN(count,
> -					MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
> +				c = min_t(int, count,
> +					min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
>  					    SERIAL_XMIT_SIZE - info->xmit_head));
>  				if (c <= 0)
>  					break;
> @@ -2272,7 +2268,7 @@
>  					break;
>  				}
>  				spin_lock_irqsave(&info->irq_spinlock,flags);
> -				c = MIN(c, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
> +				c = min_t(int, c, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
>  					       SERIAL_XMIT_SIZE - info->xmit_head));
>  				memcpy(info->xmit_buf + info->xmit_head, tmp_buf, c);
>  				info->xmit_head = ((info->xmit_head + c) &
> @@ -2287,8 +2283,8 @@
>  		} else {
>  			while (1) {
>  				spin_lock_irqsave(&info->irq_spinlock,flags);
> -				c = MIN(count,
> -					MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
> +				c = min_t(int, count,
> +					min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
>  					    SERIAL_XMIT_SIZE - info->xmit_head));
>  				if (c <= 0) {
>  					spin_unlock_irqrestore(&info->irq_spinlock,flags);
> @@ -3326,7 +3322,7 @@
>  		char_time = 1;
>  		
>  	if (timeout)
> -		char_time = MIN(char_time, timeout);
> +		char_time = min_t(unsigned long, char_time, timeout);
>  		
>  	if ( info->params.mode == MGSL_MODE_HDLC ||
>  		info->params.mode == MGSL_MODE_RAW ) {
> @@ -6779,7 +6775,7 @@
>  			
>  	if ( debug_level >= DEBUG_LEVEL_DATA )
>  		mgsl_trace_block(info,info->rx_buffer_list[StartIndex].virt_addr,
> -			MIN(framesize,DMABUFFERSIZE),0);	
> +			min_t(int, framesize, DMABUFFERSIZE),0);	
trailing space
>  		
>  	if (framesize) {
>  		if ( ( (info->params.crc_type & HDLC_CRC_RETURN_EX) &&
> @@ -6996,7 +6992,7 @@
>  
>  		if ( debug_level >= DEBUG_LEVEL_DATA )
>  			mgsl_trace_block(info,info->rx_buffer_list[CurrentIndex].virt_addr,
> -				MIN(framesize,DMABUFFERSIZE),0);
> +				min_t(int, framesize, DMABUFFERSIZE),0);
>  
>  		if (framesize) {
>  			/* copy dma buffer(s) to contiguous intermediate buffer */
> @@ -7056,7 +7052,7 @@
>  	DMABUFFERENTRY *pBufEntry;
>  	
>  	if ( debug_level >= DEBUG_LEVEL_DATA )
> -		mgsl_trace_block(info,Buffer, MIN(BufferSize,DMABUFFERSIZE), 1);	
> +		mgsl_trace_block(info,Buffer, min_t(int, BufferSize, DMABUFFERSIZE), 1);	
ditto
>  
>  	if (info->params.flags & HDLC_FLAG_HDLC_LOOPMODE) {
>  		/* set CMR:13 to start transmit when

corrected for the coming kjt, but please take care.


--===============3310900834509416==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3310900834509416==--
