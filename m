From: grant.guenther@maptuit.com
Date: Wed, 21 Jul 2004 12:26:32 +0000
Subject: [Kernel-janitors] Re: [PATCH] paride: replace schedule_timeout()
Message-Id: <Pine.LNX.4.44.0407210824410.25045-100000@saturn.tor.maptuit.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5512332319764488=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5512332319764488==
Content-Type: TEXT/PLAIN; charset=US-ASCII


FYI, I have not touched that code since 1999 - and no longer have the 
hardware (or time) to work on it. If action is required, please address
this to the linux-parport mailing list.

Grant

On Tue, 20 Jul 2004, Nishanth Aravamudan wrote:

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
> --- linux-vanilla/drivers/block/paride/pcd.c	2004-06-16 05:20:04.000000000 +0000
> +++ linux-dev/drivers/block/paride/pcd.c	2004-07-08 23:21:38.000000000 +0000
> @@ -534,12 +534,6 @@ static int pcd_tray_move(struct cdrom_de
>  			 position ? "eject" : "close tray");
>  }
>  
> -static void pcd_sleep(int cs)
> -{
> -	current->state = TASK_INTERRUPTIBLE;
> -	schedule_timeout(cs);
> -}
> -
>  static int pcd_reset(struct pcd_unit *cd)
>  {
>  	int i, k, flg;
> @@ -549,11 +543,11 @@ static int pcd_reset(struct pcd_unit *cd
>  	write_reg(cd, 6, 0xa0 + 0x10 * cd->drive);
>  	write_reg(cd, 7, 8);
>  
> -	pcd_sleep(20 * HZ / 1000);	/* delay a bit */
> +	msleep(20);
>  
>  	k = 0;
>  	while ((k++ < PCD_RESET_TMO) && (status_reg(cd) & IDE_BUSY))
> -		pcd_sleep(HZ / 10);
> +		msleep(100);
>  
>  	flg = 1;
>  	for (i = 0; i < 5; i++)
> @@ -592,7 +586,7 @@ static int pcd_ready_wait(struct pcd_uni
>  		if (!(((p & 0xffff) == 0x0402) || ((p & 0xff) == 6)))
>  			return p;
>  		k++;
> -		pcd_sleep(HZ);
> +		msleep(1000);
>  	}
>  	return 0x000020;	/* timeout */
>  }
> 

-- 

------------------------------------------------------------------------------
Grant Guenther, Vice-president, Core Services       grant.guenther@maptuit.com
Maptuit Corporation                                               416-367-7313
133 King St. E.                                            (fax)  416-367-7333
Toronto, Ontario, Canada, M5C 1G6                          (cell) 416-712-1189
------------------------------------------------------------------------------


--===============5512332319764488==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5512332319764488==--
