From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 15:43:02 +0000
Subject: [Kernel-janitors] Re: [PATCH] video/bttv-driver: replace
Message-Id: <20040727154301.GB1937@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19435466040739691=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727062650.GG8798@bytesex>
In-Reply-To: <20040727062650.GG8798@bytesex>
To: kernel-janitors@vger.kernel.org

--===============19435466040739691==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 08:26:50AM +0200, Gerd Knorr wrote:
> On Mon, Jul 26, 2004 at 03:47:30PM -0700, Nishanth Aravamudan wrote:
> > I would appreciate any comments from the janitors list. This is one (of
> > many) cases where I made a decision about replacing
> > 
> > set_current_state(TASK_INTERRUPTIBLE);
> > schedule_timeout(some_time);
> > 
> > with
> > 
> > msleep(jiffies_to_msecs(some_time));
> > 
> > msleep() is not exactly the same as the previous code,
> 
> How does it differ?  And what exactly is the point in replacing it?

From a previous post to kernel-janitors:

Well, there are two things to consider here:

As a reference, the way the code was written before:
-               set_current_state(TASK_INTERRUPTIBLE);
-               schedule_timeout(HZ / 10); /* wait 100ms */

1) Since the state is set to TASK_INTERRUPTIBLE, although a 100ms
delay is requested, if a signal is received, then the delay ends
prematurely and the task will resume after the schedule_timeout()
call. Now, if this was the desired effect, then the the patch should
not be applied.

2) However, if a true delay was desired, then TASK_INTERRUPTIBLE
should not have been the set state, but TASK_UNINTERRUPTIBLE should
have been. This would have made the code:
		set_current_state(TASK_UNINTERRUPTIBLE);
		schedule_timeout(HZ / 10);
msleep() achieves this exact purpose, but also:
	 a) allows the parameter time to be in msecs, which is far
	 clearer IMO; and
	 b) guarantees that the task will not continue execution
	 until after the timeout has expired.
Confusingly (at least to me), there are certain conditions -- the details
of which I will have to defer to Greg Kroah-Hartman -- in which
TASK_UNINTERRUPTIBLE'd schedule_timeout()s may still return before the
timeout. The desired delay is achieved by wrapping the
schedule_timeout(timeout) with a while(timeout) loop. Thus, as long as
timeout is non-zero, the task is deferred. (see msleep() definition for
more details).

Hope that clears up the differences.

-Nish

--===============19435466040739691==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19435466040739691==--
