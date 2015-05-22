From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 22 May 2015 05:06:47 +0000
Subject: Re: [PATCH v4 10/13] staging: lustre: lnet: lnet: checkpatch.pl fixes
Message-Id: <alpine.DEB.2.10.1505220704541.2672@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-55890910-1432271212=:2672"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu> <1432237849-53947-11-git-send-email-shuey@purdue.edu> <1432242004.20840.68.camel@perches.com> <alpine.DEB.2.10.1505212328500.5370@hadrien>
 <CABqvwjuKypiacf3336j-q450FGKaO4wh0Ld7PF8MGz0VPsYBbw@mail.gmail.com>
In-Reply-To: <CABqvwjuKypiacf3336j-q450FGKaO4wh0Ld7PF8MGz0VPsYBbw@mail.gmail.com>
To: Michael Shuey <shuey@purdue.edu>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Joe Perches <joe@perches.com>, "Drokin, Oleg" <oleg.drokin@intel.com>, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-devel@lists.lustre.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-55890910-1432271212=:2672
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 May 2015, Michael Shuey wrote:

> That's a task (of many) I've been putting on the back burner until the code
> is cleaner.  It's also a HUGE change, since there are debug macros
> everywhere, and they all check a #define'd mask to see if they should fire,
> and the behavior is likely governed by parts of the lustre user land tools
> as well.
>
> Suggestions are welcome.  Do other parts of the linux kernel define complex
> debugging macros like these, or is this a lustre-ism?  Any suggestions on
> how to handle this more in line with existing drivers?

Once you decide what to do, you can use Coccinelle to make the changes for
you.  So you shouldn't be put off by the number of code sites to change.

The normal functions are pr_err, pr_warn, etc.  Perhaps you can follow
Joe's suggestions if you really need something more complicated.

julia
>
> --
> Mike Shuey
>
> On Thu, May 21, 2015 at 5:29 PM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> >
> >
> >
> > On Thu, 21 May 2015, Joe Perches wrote:
> >
> > > On Thu, 2015-05-21 at 15:50 -0400, Mike Shuey wrote:
> > > > Fix many checkpatch.pl warnings.
> > > []
> > > > diff --git a/drivers/staging/lustre/lnet/lnet/acceptor.c
> b/drivers/staging/lustre/lnet/lnet/acceptor.c
> > > []
> > > > @@ -99,38 +99,42 @@ lnet_connect_console_error(int rc, lnet_nid_t
> peer_nid,
> > > >     switch (rc) {
> > > >     /* "normal" errors */
> > > >     case -ECONNREFUSED:
> > > > -           CNETERR("Connection to %s at host %pI4h on port %d was
> refused: check that Lustre is running on that node.\n",
> > > > -                   libcfs_nid2str(peer_nid),
> > > > -                   &peer_ip, peer_port);
> > > > +           CNETERR(
> > > > +                   "Connection to %s at host %pI4h on port %d was
> refused: check that Lustre is running on that node.\n",
> > > > +                   libcfs_nid2str(peer_nid), &peer_ip, peer_port);
> > >
> > > These are not improvements and checkpatch messages aren't dicta.
> > >
> > > Please don't convert code unless the conversion makes it better
> > > for a human reader.
> > >
> > > These don't.
> >
> > I haven't looked into it, but perhaps there is a standard kernel printing
> > function that these could be converted to directly?
> >
> > julia
>
>
--8323329-55890910-1432271212=:2672--
