From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 22:31:46 +0000
Subject: [KJ] Re: [PATCH 9/21] char/ipmi_si_intf: replace schedule_timeout()
Message-Id: <20050117223146.GL24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85702176591740065=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41EC332A.8020603@mvista.com>
In-Reply-To: <41EC332A.8020603@mvista.com>
To: kernel-janitors@vger.kernel.org

--===============85702176591740065==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 03:53:12PM -0600, Corey Minyard wrote:
> On my previous question, to be more clear, why was this change 
> necessary?  In this particular instance, it doesn't matter how long it 
> sleeps, it just can't spin waiting for something to happen.  msleep() 
> spins, right?  That would be very bad in this code.  Even if not, the 
> particular timing is not important.

msleep() does not spin. The name itself is intended to indicate this. Delays
(mdelay(), udelay()) spin by looping tightly. Sleeps (msleep(), ssleep(), 
msleep_interruptible()) use schedule_timeout() to give up the CPU for a certain
amount of time.

Given this last comment, there is a clear benefit (IMO) to use actual time
units for sleeps (msleep() and co. use milliseconds or seconds) as opposed to
jiffy-relative units (as in schedule_timeout() where you are requesting a delay
in jiffies, which varies from arch to arch).

This becomes very important with dynamic HZ, for instance. Clearly if HZ
changes, then the delay caused by schedule_timeout(1) will change, which is not
necessarily desired and may be confusing the user. A time specified in real
time units will be adjusted with the change in HZ.

If it is not important how long the driver sleeps, then I believe msleep()
should be preferred in effectively all cases (depending on whether wait-queue
events or signals may be important early triggers, of course). Milliseconds
indicate a clear delay, independent of HZ's value. Jiffy delays have a clear
reliance on the value of HZ.

I am open to other suggestions, but I think these are good reasons. Another
basic one is that it will lead to consistency across the board. HZ is not a
measure of time, it should not be used as a measure of time. Instead,
milliseconds should be used and, when/if the facility has been added,
microseconds and nanoseconds.

Thanks,
Nish

--===============85702176591740065==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85702176591740065==--
