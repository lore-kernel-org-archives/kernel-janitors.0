From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 15 Feb 2005 18:18:11 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050215181811.GA2377@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73252629707131645=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050215002049.GH9231@conscoop.ottawa.on.ca>
In-Reply-To: <20050215002049.GH9231@conscoop.ottawa.on.ca>
To: kernel-janitors@vger.kernel.org

--===============73252629707131645==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 08:34:20PM -0500, Jody McIntyre wrote:
> On Mon, Feb 14, 2005 at 04:50:47PM -0800, Nishanth Aravamudan wrote:
> 
> > > In my copy, it _unlocks_ around the sleep.  I don't see why this
> > > couldn't be done with wait_event_interruptible (unlock, wait, lock).
> > > Can you produce a patch with that?  I'll find a video1394 user to test
> > > it.
> > 
> > Sorry for my mis-statement/lack of clarity. In my copy, it also unlocks
> > around the sleep... The problem is that wait_event*() should be used in
> > such a way that the while-loop is not at all necessary (ideally).
> > Instead, we'll have a while-loop around the unlock-wait_event-lock code,
> > which is just ugly to me, as wait_event is just a macro around another
> > while loop. The real solution is wait_event_interruptible_lock().
> > Hopefully I can get such a macro accepted into mainline sooner or
> > later...
> 
> So you want to leave tho old code in until then?  Fair enough.
> 
> > I'm assuming the locking is done this way so that other variables protected by
> > the same lock can be changed while this one sleeps?
> 
> Correct.  See, for example, wakeup_dma_ir_ctx() .

I am not sure if you have seen some of the discussion (under the
subject: "[RFC UPDATE PATCH] add wait_event_*_lock() functions and
comments") on LKML regarding these macros. Does Arnd's proposal to fix
video1394 seem reasonable? I can throw up a patch, if you'd like to
test.

Thanks,
Nish

--===============73252629707131645==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73252629707131645==--
