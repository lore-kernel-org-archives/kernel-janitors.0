From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 15 Feb 2005 00:32:09 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050215003209.GB2403@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90106327747848503=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050215002049.GH9231@conscoop.ottawa.on.ca>
In-Reply-To: <20050215002049.GH9231@conscoop.ottawa.on.ca>
To: kernel-janitors@vger.kernel.org

--===============90106327747848503==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 07:20:49PM -0500, Jody McIntyre wrote:
> /me finally gets time to review this...
> 
> This doesn't apply to anything I can find.  Patches against 1394 svn
> ( svn://svn.linux1394.org/libraw1394/ ) or development bk
> ( http://linux-1394.bkbits.net/1394-dev ) are most useful, but I can
> deal with others.

OK, I will add that to my notes for ieee1394. Thanks!

> On Tue, Jan 25, 2005 at 04:10:44PM -0800, Nishanth Aravamudan wrote:
> > Hi,
> > 
> > I mistakenly sent to the wrong address for the list. Please reply in CC to
> > bcollins@debian.org and kernel-janitors@lists.osdl.org. Thanks!
> > 
> > Please consider applying.
> > 
> > Description: Use wait_event_interruptible() instead of the deprecated
> > interruptible_sleep_on(). The first change is simply to clean up the code a
> > little to make it clearer. The second actually does a replacement, mimicking
> > exactly the first. I removed the #if 1/#else/endif logic, as it duplicated the
> > same code. Patch is compile-tested.
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> > 
> > --- 2.6.11-rc2-kj-v/drivers/ieee1394/video1394.c	2005-01-24 09:34:07.000000000 -0800
> > +++ 2.6.11-rc2-kj/drivers/ieee1394/video1394.c	2005-01-24 15:06:16.000000000 -0800
> > @@ -964,10 +964,9 @@ static int __video1394_ioctl(struct file
> >  				}
> >  			}
> >  #else
> > -			if (wait_event_interruptible(d->waitq,
> > -						     d->buffer_status[v.buffer]
> > -						     == VIDEO1394_BUFFER_READY)
> > -			    == -ERESTARTSYS)
> > +			wait_event_interruptible(d->waitq,
> > +					(d->buffer_status[v.buffer] == VIDEO1394_BUFFER_READY));
> > +			if (signal_pending(current))
> >  				return -EINTR;
> 
> Fine, but that only touches the #else of an #if 1 and leaves an
> interruptible_sleep_on in the part that's actually executed.
> 
> Can you change this to be more like hunk 2?
> 
> For what it's worth, the #if 1 has been there since 2002 so it's
> probably safe to remove by now :)

I will look into it, but from a cursory glance, the #if 1 case uses
locking around the sleep, which is currently not supported by
wait_event*(). I have sent a patch to LKML regarding this issue and the
need, perhaps, for alternative wait_event*() style functions, such as
ones that accept locks as parameters.

Any suggestions?

Thanks,
Nish

--===============90106327747848503==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90106327747848503==--
