From: Jon Smirl <jonsmirl@gmail.com>
Date: Fri, 17 Sep 2004 04:38:40 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 11/33] char/i830_irq:
Message-Id: <9e473391040916213843c2d78e@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28484336842180791=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============28484336842180791==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

schedule_timeout() is also used in DRM_WAIT_ON() in drm_os_linux.h 
Does it need to be adjusted too?

#define DRM_WAIT_ON( ret, queue, timeout, condition )		\
do {								\
	DECLARE_WAITQUEUE(entry, current);			\
	unsigned long end = jiffies + (timeout);		\
	add_wait_queue(&(queue), &entry);			\
								\
	for (;;) {						\
		__set_current_state(TASK_INTERRUPTIBLE);	\
		if (condition)					\
			break;					\
		if (time_after_eq(jiffies, end)) {		\
			ret = -EBUSY;				\
			break;					\
		}						\
		schedule_timeout((HZ/100 > 1) ? HZ/100 : 1);	\
		if (signal_pending(current)) {			\
			ret = -EINTR;				\
			break;					\
		}						\
	}							\
	__set_current_state(TASK_RUNNING);				\
	remove_wait_queue(&(queue), &entry);			\
} while (0)




On Thu, 16 Sep 2004 09:43:49 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of schedule_timeout() to
> guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.9-rc1-mm4-vanilla/drivers/char/drm/i830_irq.c   2004-09-09 23:05:37.000000000 -0700
> +++ 2.6.9-rc1-mm4/drivers/char/drm/i830_irq.c   2004-09-10 10:34:30.000000000 -0700
> @@ -105,7 +105,7 @@ int i830_wait_irq(drm_device_t *dev, int
>                         ret = -EBUSY;   /* Lockup?  Missed irq? */
>                         break;
>                 }
> -               schedule_timeout(HZ*3);
> +               msleep_interruptible(3000);
>                 if (signal_pending(current)) {
>                         ret = -EINTR;
>                         break;
> 
> -------------------------------------------------------
> This SF.Net email is sponsored by: YOU BE THE JUDGE. Be one of 170
> Project Admins to receive an Apple iPod Mini FREE for your judgement on
> who ports your project to Linux PPC the best. Sponsored by IBM.
> Deadline: Sept. 24. Go here: http://sf.net/ppc_contest.php
> --
> _______________________________________________
> Dri-devel mailing list
> Dri-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/dri-devel
> 



-- 
Jon Smirl
jonsmirl@gmail.com

--===============28484336842180791==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28484336842180791==--
