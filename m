From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Fri, 14 Jan 2005 11:16:30 +0000
Subject: [KJ] Re: [UPDATE PATCH] ieee1394/sbp2: use ssleep() instead
Message-Id: <41E7AA0E.4030103@s5r6.in-berlin.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74621932889733245=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050107213400.GD2924@us.ibm.com>	 <17a9eec54394ded0a28295a6548a5c65@localhost>	 <20050110173945.GB3099@us.ibm.com> <1105678375.7830.81.camel@kino.dennedy.org>
In-Reply-To: <1105678375.7830.81.camel@kino.dennedy.org>
To: Linux1394-Devel <linux1394-devel@lists.sourceforge.net>
Cc: Nishanth Aravamudan <nacc@us.ibm.com>, kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============74621932889733245==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dan Dennedy wrote:
> On Mon, 2005-01-10 at 09:39 -0800, Nishanth Aravamudan wrote:
>> On Sun, Jan 09, 2005 at 10:01:21AM +0100, Stefan Richter wrote:
>> > Nishanth Aravamudan wrote:
>> > >@@ -902,8 +902,7 @@ alloc_fail:
>> > >	 * connected to the sbp2 device being removed. That host would
>> > >	 * have a certain amount of time to relogin before the sbp2 device
>> > >	 * allows someone else to login instead. One second makes sense. */
>> > >-	set_current_state(TASK_INTERRUPTIBLE);
>> > >-	schedule_timeout(HZ);
>> > >+	ssleep(1);
>> > 
>> > Maybe the current code is _deliberately_ accepting interruption by 
>> > signals but trying to complete sbp2_probe() anyway. However it seems 
>> > more plausible to me to abort the device probe, for example like this:
>> > if (msleep_interruptible(1000)) {
>> > 	sbp2_remove_device(scsi_id);
>> > 	return -EINTR;
>> > }
[...]
>> I am trying to audit all usage of schedule_timeout() and the
>> semantic interpretation (to me) of using TASK_INTERRUPTIBLE is that you wish to
>> sleep a certain amount of time, but also are prepared for an early return on
>> either signals or wait-queue events. [...]
> 
> Sounds like a sign-off. Any other input before I request Stefan to make
> the final decision?

Don't count on me here. I do not even know /which/ situations might
introduce signals or wait queue events at this point. The only one that
occurred to me is when nodemgr is about to be killed. In this situation,
it is hardly beneficial to continue with the login. But there may be
other events I do not know about which should not result in sbp2 giving
up. Sorry, I should have been clear about this in my previous post.

>> > Anyway, signal handling does not appear to be critical there.

Or rather, it is not that important (although desirable) to always wait
for 1000ms. This is just necessary for when another initiator was logged
in into the target but did not reconnect or login again immediately
after a bus reset. (Assuming the other initiator or the local host or
the target require exclusive login, which is more common than concurrent
login.)

>> Just out of curiousity, doesn't that run the risk, though, of
>> signal_pending(current) being true for quite a bit of time following the
>> timeout?
> 
> How much of this is "curiosity" vs a real risk?

Well, what might those events be? May we hold them off for one second?
(Or perhaps even longer if we are about to login to several targets.)
Should sbp2 proceeed to login when such events occur? I can't answer
this for sure. Sorry,
-- 
Stefan Richter
-=====-=-=-= ---= -===-
http://arcgraph.de/sr/

--===============74621932889733245==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74621932889733245==--
