From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 15 Feb 2005 00:50:47 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050215005047.GC2403@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10538476436774724=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050215002049.GH9231@conscoop.ottawa.on.ca>
In-Reply-To: <20050215002049.GH9231@conscoop.ottawa.on.ca>
To: kernel-janitors@vger.kernel.org

--===============10538476436774724==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 07:42:37PM -0500, Jody McIntyre wrote:
> On Mon, Feb 14, 2005 at 04:32:09PM -0800, Nishanth Aravamudan wrote:
> > [...]
> > 
> > I will look into it, but from a cursory glance, the #if 1 case uses
> > locking around the sleep, which is currently not supported by
> > wait_event*(). I have sent a patch to LKML regarding this issue and the
> > need, perhaps, for alternative wait_event*() style functions, such as
> > ones that accept locks as parameters.
> 
> In my copy, it _unlocks_ around the sleep.  I don't see why this
> couldn't be done with wait_event_interruptible (unlock, wait, lock).
> Can you produce a patch with that?  I'll find a video1394 user to test
> it.

Sorry for my mis-statement/lack of clarity. In my copy, it also unlocks
around the sleep... The problem is that wait_event*() should be used in
such a way that the while-loop is not at all necessary (ideally).
Instead, we'll have a while-loop around the unlock-wait_event-lock code,
which is just ugly to me, as wait_event is just a macro around another
while loop. The real solution is wait_event_interruptible_lock().
Hopefully I can get such a macro accepted into mainline sooner or
later...

I'm assuming the locking is done this way so that other variables protected by
the same lock can be changed while this one sleeps?

Thanks,
Nish

--===============10538476436774724==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10538476436774724==--
