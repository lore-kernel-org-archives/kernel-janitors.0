From: Mich Lanners <mlan@cpu.lu>
Date: Tue, 27 Jul 2004 20:51:48 +0000
Subject: [Kernel-janitors] Re: [PATCH] video/planb: replace
Message-Id: <E1BpYvN-0000VR-00@piglet.grunz.lu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============010003684430134996=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============010003684430134996==
Content-Type: TEXT/PLAIN; CHARSET=us-ascii
Content-Disposition: INLINE

Hi all,

planb maintainer (sort of..) here.

On  26 Jul, this message from Nishanth Aravamudan echoed through
cyberspace:
> I would appreciate any comments from the janitors list. This is one
> (of many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this
> is not the case here, then just disregard this patch.

No, please do apply. This is in a seldomly used code path, only to get
the status of the hardware. Unprecise delays are of no concern at all at
this point.

Thanks; that's one less to fix for me :-)

Cheers

Michel

> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/media/video/planb.c	2004-06-16 05:19:51.000000000 +0000
> +++ linux-dev/drivers/media/video/planb.c	2004-07-12 18:54:09.000000000 +0000
> @@ -178,8 +178,7 @@ static unsigned char saa_status(int byte
>  	saa_write_reg (SAA7196_STDC, saa_regs[pb->win.norm][SAA7196_STDC]);
>  
>  	/* Let's wait 30msec for this one */
> -	current->state = TASK_INTERRUPTIBLE;
> -	schedule_timeout(30 * HZ / 1000);
> +	msleep(30);
>  
>  	return (unsigned char)in_8 (&planb_regs->saa_status);
>  }
> 
> 
> **********************
> VIRUS CHECKED
> **********************
> 


-------------------------------------------------------------------------
Michel Lanners                 |  " Read Philosophy.  Study Art.
23, Rue Paul Henkes            |    Ask Questions.  Make Mistakes.
L-1710 Luxembourg              |
email   mlan@cpu.lu            |
http://www.cpu.lu/~mlan        |                     Learn Always. "

--===============010003684430134996==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============010003684430134996==--
