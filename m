From: Jens Axboe <axboe@suse.de>
Date: Fri, 07 Jan 2005 19:47:41 +0000
Subject: [KJ] Re: [UPDATE PATCH] ide/ide-cd: use ssleep() instead of
Message-Id: <20050107194741.GG7387@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65796168564629498=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041225004846.GA19373@nd47.coderock.org> <20050107194013.GB2924@us.ibm.com>
In-Reply-To: <20050107194013.GB2924@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============65796168564629498==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 07 2005, Nishanth Aravamudan wrote:
> On Sat, Dec 25, 2004 at 01:48:46AM +0100, Domen Puncer wrote:
> > Hi.
> > 
> > Santa brought another present :-)
> > 
> > I'll start mailing new patches these days, and after external trees get
> > merged, I'll be bugging you with the old ones.
> > 
> > 
> > Patchset is at http://coderock.org/kj/2.6.10-kj/
> 
> <snip>
> 
> > msleep-drivers_ide_ide-cd.patch
> 
> Please consider updating to the following patch:
> 
> Description: Uses ssleep() in place of cdrom_sleep() to guarantee the task
> delays as expected. Remove cdrom_sleep() definition, as this is the only place
> where it is called.
> 
> Signed-off-by: Nishanth Aravamudan

Looks fine.

Acked-by: Jens Axboe <axboe@suse.de>

> --- 2.6.10-v/drivers/ide/ide-cd.c	2004-12-24 13:34:33.000000000 -0800
> +++ 2.6.10/drivers/ide/ide-cd.c	2005-01-05 14:23:05.000000000 -0800
> @@ -1520,19 +1520,6 @@ static ide_startstop_t cdrom_do_packet_c
>  }
>  
>  
> -/* Sleep for TIME jiffies.
> -   Not to be called from an interrupt handler. */
> -static
> -void cdrom_sleep (int time)
> -{
> -	int sleep = time;
> -
> -	do {
> -		set_current_state(TASK_INTERRUPTIBLE);
> -		sleep = schedule_timeout(sleep);
> -	} while (sleep);
> -}
> -
>  static
>  int cdrom_queue_packet_command(ide_drive_t *drive, struct request *rq)
>  {
> @@ -1567,7 +1554,7 @@ int cdrom_queue_packet_command(ide_drive
>  				/* The drive is in the process of loading
>  				   a disk.  Retry, but wait a little to give
>  				   the drive time to complete the load. */
> -				cdrom_sleep(2 * HZ);
> +				ssleep(2);
>  			} else {
>  				/* Otherwise, don't retry. */
>  				retries = 0;
> 

-- 
Jens Axboe


--===============65796168564629498==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65796168564629498==--
