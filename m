From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 20:55:22 +0000
Subject: [Kernel-janitors] [PATCH] mdc: replace schedule_timeout() with
Message-Id: <20040720205522.GD2959@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68203178971732958=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68203178971732958==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch applies to mcd.c not cdu31a.c. Sorry for the error.

On Tue, Jul 20, 2004 at 08:51:42PM +0000, Nishanth Aravamudan wrote:
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
> the task delays at least the desired time amount.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/cdrom/mcd.c	2004-06-16 05:19:37.000000000 +0000
> +++ linux-dev/drivers/cdrom/mcd.c	2004-07-10 18:24:17.000000000 +0000
> @@ -1021,10 +1021,9 @@ static int mcd_open(struct cdrom_device_
>  		st = statusCmd();	/* check drive status */
>  		if (st == -1)
>  			goto err_out;	/* drive doesn't respond */
> -		if ((st & MST_READY) == 0) {	/* no disk? wait a sec... */
> -			current->state = TASK_INTERRUPTIBLE;
> -			schedule_timeout(HZ);
> -		}
> +		if ((st & MST_READY) == 0) 	/* no disk? wait a sec... */
> +			msleep(1000);
> +		
>  	} while (((st & MST_READY) == 0) && count++ < MCD_RETRY_ATTEMPTS);
>  
>  	if (updateToc() < 0)

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============68203178971732958==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68203178971732958==--
