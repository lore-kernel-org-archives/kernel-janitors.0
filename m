From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 22:35:31 +0000
Subject: [KJ] Re: [PATCH 3/22] block/cciss: replace schedule_timeout() with
Message-Id: <20050117223531.GM24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10409500738476751=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <D4CFB69C345C394284E4B78B876C1CF107DC01A4@cceexc23.americas.cpqcorp.net>
In-Reply-To: <D4CFB69C345C394284E4B78B876C1CF107DC01A4@cceexc23.americas.cpqcorp.net>
To: kernel-janitors@vger.kernel.org

--===============10409500738476751==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 04:14:10PM -0600, Miller, Mike (OS Dev) wrote:
> > From: Nishanth Aravamudan [mailto:nacc@us.ibm.com]
> > Hi,
> > 
> > Please consider applying.
> > 
> > I used msleep(10) here under the presumption that the 
> > schedule_timeout(1) was
> > written assuming that HZ=100 (as it used to be), which is
> > equivalent to 10 milliseconds. If the desire is actually for 
> > 1 ms or the minimal
> > sleep interval, then the patch can be changed appropriately. 
> > A similar assumption
> > as to the constant delay value was made in the other 
> > replacement, which can also
> > be appropriately adjusted.
> > 
> > Description: Change the delay logic in pollcomplete() to use 
> > msleep() and
> > time_before(). Instead of assuming schedule_timeout() will 
> > sleep exactly as
> > requested, use msleep(10) to guarantee minimally 10 
> > millisecond increments and
> > time_before() to guarantee stopping the loop as close to 20 
> > seconds as possible.
> > Also changes another occurrence of schedule_timeout() to msleep().
> > TASK_INTERRUPTIBLE is used in this case, but signals are not handled. 
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> I still fail to see the benefits of this patch.

There is a clear benefit (IMO) to use actual time units for sleeps (msleep()
and co. use milliseconds or seconds) as opposed to jiffy-relative units (as
in schedule_timeout() where you are requesting a delay in jiffies, which
varies from arch to arch).

This becomes very important with dynamic HZ, for instance. Clearly if HZ
changes, then the delay caused by schedule_timeout(1) will change, which is not
necessarily desired and may be confusing the user. A time specified in real
time units will be adjusted with the change in HZ.

If it is not important how long (as long as it is not too long) the driver
sleeps, then I believe msleep() should be preferred in effectively all cases
(depending on whether wait-queue events or signals may be important early
triggers, of course). Milliseconds indicate a clear delay, independent of
HZ's value. Jiffy delays have a clear reliance on the value of HZ, but using
constant delays with schedule_timeout (1, 10, etc., i.e. values that are
independent of the value of HZ (examples of the latter would be HZ/2, HZ/4,
etc.)) masks this dependancy which may be confusing to the user who sees
dramatic changes in the delay of particular drivers as HZ is altered.

I am open to other suggestions, but I think these are good reasons. Another
basic one is that it will lead to consistency across the board. HZ is not a
measure of time, it should not be used as a measure of time. Instead,
milliseconds should be used and, when/if the facility has been added,
microseconds and nanoseconds.

Thanks,
Nish

--===============10409500738476751==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10409500738476751==--
