From: Mark Hollomon <markhollomon@comcast.net>
Date: Wed, 28 Jul 2004 15:57:21 +0000
Subject: Re: [Kernel-janitors] [PATCH] parport/ieee1284:
Message-Id: <4107CCE1.8050004@comcast.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55014656468447409=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727210821.GL3471@us.ibm.com>
In-Reply-To: <20040727210821.GL3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============55014656468447409==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I think TASK_INTERRUPTIBLE is needed here. The top of the loop the 
schedule_timeout is in looks for signals.


Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch. 
> 
> Thanks,
> Nish
> 
> 
> 
> Applys-to: 2.6.7
> 
> Description: Uses msleep() instead of schedule_timeout() to guarantee
> the task delays the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- linux-vanilla/drivers/parport/ieee1284.c	2004-06-16 05:18:57.000000000 +0000
> +++ linux-dev/drivers/parport/ieee1284.c	2004-07-12 21:46:18.000000000 +0000
> @@ -212,13 +212,11 @@ int parport_wait_peripheral(struct parpo
>  		if ((status & mask) == result)
>  			return 0;
>  
> -		if (!ret) {
> +		if (!ret) 
>  			/* parport_wait_event didn't time out, but the
>  			 * peripheral wasn't actually ready either.
>  			 * Wait for another 10ms. */
> -			__set_current_state (TASK_INTERRUPTIBLE);
> -			schedule_timeout ((HZ+ 99) / 100);
> -		}
> +			msleep(10);
>  	}
>  
>  	return 1;
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


-- 
--------------------------
Mark Hollomon

--===============55014656468447409==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55014656468447409==--
