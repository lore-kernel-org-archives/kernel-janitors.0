From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 16:10:48 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 11/33] char/i830_irq:
Message-Id: <20040917161048.GA1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22077202315818356=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============22077202315818356==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 17, 2004 at 12:38:40AM -0400, Jon Smirl wrote:
> schedule_timeout() is also used in DRM_WAIT_ON() in drm_os_linux.h 
> Does it need to be adjusted too?
> 
> #define DRM_WAIT_ON( ret, queue, timeout, condition )		\
> do {								\
> 	DECLARE_WAITQUEUE(entry, current);			\
> 	unsigned long end = jiffies + (timeout);		\
> 	add_wait_queue(&(queue), &entry);			\
> 								\
> 	for (;;) {						\
> 		__set_current_state(TASK_INTERRUPTIBLE);	\
> 		if (condition)					\
> 			break;					\
> 		if (time_after_eq(jiffies, end)) {		\
> 			ret = -EBUSY;				\
> 			break;					\
> 		}						\
> 		schedule_timeout((HZ/100 > 1) ? HZ/100 : 1);	\
> 		if (signal_pending(current)) {			\
> 			ret = -EINTR;				\
> 			break;					\
> 		}						\
> 	}							\
> 	__set_current_state(TASK_RUNNING);				\
> 	remove_wait_queue(&(queue), &entry);			\
> } while (0)

I did notice this other occurrence, but since the timeout is not
necessarily a long one (measurable in msecs), i.e. in system's where
HZ < 100, I didn't want to make the code more complicated than it is.

But, if some of the DRM people who are more familiar with the hardware
are ok with there always being a 10 ms delay (which it would be for all
system's with HZ > 100 anyways), I could make that change.

Thanks,
Nish

--===============22077202315818356==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22077202315818356==--
