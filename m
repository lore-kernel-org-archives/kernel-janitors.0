From: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Date: Thu, 30 Sep 2004 16:48:18 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 2/33] char/cyclades: replace
Message-Id: <20040930164818.GA23427@logos.cnet>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45131166859548522=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915212155.GG5778@us.ibm.com>
In-Reply-To: <20040915212155.GG5778@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============45131166859548522==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Nishanth,


Well have to convert from jiffies (char_time) to msecs, just to 
convert it back again to jiffies in msleep_interruptible().

Is this patch actually fixing any problem?

Thanks and sorry for the long delay

> The original patch mistakenly used the msecs_to_jiffies() macro when it
> should have used the jiffies_to_msecs() macro. Please find the corrected
> patch below.
> 
> 
> --- 2.6.9-rc2-vanilla/drivers/char/cyclades.c	2004-09-13 17:15:49.000000000 -0700
> +++ 2.6.9-rc2/drivers/char/cyclades.c	2004-09-24 10:23:05.000000000 -0700
> @@ -2717,8 +2717,7 @@ cy_wait_until_sent(struct tty_struct *tt
>  #ifdef CY_DEBUG_WAIT_UNTIL_SENT
>  	    printk("Not clean (jiff=%lu)...", jiffies);
>  #endif
> -	    current->state = TASK_INTERRUPTIBLE;
> -	    schedule_timeout(char_time);
> +	    msleep_interruptible(jiffies_to_msecs(char_time));
>  	    if (signal_pending(current))
>  		break;
>  	    if (timeout && time_after(jiffies, orig_jiffies + timeout))
> @@ -2729,8 +2728,7 @@ cy_wait_until_sent(struct tty_struct *tt
>  	// Nothing to do!
>      }
>      /* Run one more char cycle */
> -    current->state = TASK_INTERRUPTIBLE;
> -    schedule_timeout(char_time * 5);
> +    msleep_interruptible(jiffies_to_msecs(char_time * 5));
>  #ifdef CY_DEBUG_WAIT_UNTIL_SENT
>      printk("Clean (jiff=%lu)...done\n", jiffies);
>  #endif
> @@ -2860,8 +2858,7 @@ cy_close(struct tty_struct *tty, struct 
>      if (info->blocked_open) {
>  	CY_UNLOCK(info, flags);
>          if (info->close_delay) {
> -            current->state = TASK_INTERRUPTIBLE;
> -            schedule_timeout(info->close_delay);
> +            msleep_interruptible(jiffies_to_msecs(info->close_delay));
>          }
>          wake_up_interruptible(&info->open_wait);
>  	CY_LOCK(info, flags);

--===============45131166859548522==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45131166859548522==--
