From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 16:35:02 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <20040720163502.GC1983@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32692146434254288=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============32692146434254288==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2004 at 06:24:48PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > > >I'm not sure it makes sense.... so it will just spin once more? Exact
> > > > >timeout does not seem too critical here.
> > > > 
> > > > 	So why not use HZ instead of 1000?
> > > 
> > > Hm, using constant like 1000 probably is not good idea.
> > 
> > Well, I thought it would be better than adding a #define for the number
> > of milliseconds in one second. Also, any rounding conditions or what-not
> > are taken care of within msleep() by the call to msecs_to_jiffies().
> 
> Sorry, I did not check back the sources. mdelay(1000) is okay.
> 
> But I believe replacing schedule-timeout() with mdelay is not good
> idea as it is okay to sleep shorter time at this particular place.

First, just to make sure we are on the same page, the replacement is
with msleep(), not mdelay(). The difference between the two is that
msleep() uses schedule_timeout() to give up the CPU while mdelay() busy
waits.

Second, according to the description at
kernel/timer.c::schedule_timeout(), I am just making the desired outcome
guaranteed:

 * %TASK_UNINTERRUPTIBLE - at least @timeout jiffies are guaranteed to
 * pass before the routine returns. The routine will return 0

As I said before, msleep() *guarantees* this behavior.

Also, I am following one of the TODO tasks:

  Addendum From:  Greg KH

  -> most of the longer delays in the kernel can be converted to use
   msleep() as it will work properly. drivers should it  instead of 
    creating their own (incorrect) function. 
     (example: sony_sleep(void) in drivers/cdrom/sonycd535.c)

After discussing with Greg, longer delays were considered those
measurable in milliseconds. I think msleep() helps add a layer of
consistency across the board. It also is (IMO) easier to think of times
and delays in terms of seconds / milliseconds rather than jiffies (this
becomes very apparent in later patches, where all sorts of crazy
conversions are replaced with simple numbers).

-Nish
  

--===============32692146434254288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32692146434254288==--
