From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 15:53:00 +0000
Subject: [Kernel-janitors] Re: [PATCH] video/bttv-driver: replace
Message-Id: <20040727155300.GA2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96642119162481666=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727062650.GG8798@bytesex>
In-Reply-To: <20040727062650.GG8798@bytesex>
To: kernel-janitors@vger.kernel.org

--===============96642119162481666==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 08:59:59AM +0200, Gerd Knorr wrote:
> On Tue,  Jul 27, 2004 at 08:26:50AM +0200, Gerd Knorr wrote:
> return -ENOSIG;
> > On Mon, Jul 26, 2004 at 03:47:30PM -0700, Nishanth Aravamudan wrote:
> > > set_current_state(TASK_INTERRUPTIBLE);
> > > schedule_timeout(some_time);
> 
> > > msleep(jiffies_to_msecs(some_time));
> > > 
> > > msleep() is not exactly the same as the previous code,
> > 
> > How does it differ?  And what exactly is the point in replacing it?
> 
> Especially as msleep() does busy waits (unless I've missed something)
> whereas schedule_timeout() doesn't?  I'd like to veto this one, and
> the other ones touching video4linux drivers as well.

msleep() does not busy wait. It in fact uses schedule_timeout() but in a
more reliable way than most code. Also, it allows the drivers to
consider their longer delays in terms of msecs instead of some sort of
conversion on HZ.

kernel/timer.c::msleep():

/**
 * msleep - sleep safely even with waitqueue interruptions
 * @msecs: Time in milliseconds to sleep for
 */
void msleep(unsigned int msecs)
{
	unsigned long timeout = msecs_to_jiffies(msecs);
	while (timeout) {
		set_current_state(TASK_UNINTERRUPTIBLE);
		timeout = schedule_timeout(timeout);
	}
}

-Nish

--===============96642119162481666==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96642119162481666==--
