From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Fri, 22 May 2015 08:04:39 +0000
Subject: Re: [PATCH v4 10/13] staging: lustre: lnet: lnet: checkpatch.pl fixes
Message-Id: <5A9267C2-39F8-423C-967B-80055F6070AC@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
 <1432237849-53947-11-git-send-email-shuey@purdue.edu>
 <1432242004.20840.68.camel@perches.com>
 <CABqvwjs=S1VrCHe7M4JnDikGBVN3yqjNMrtSA=UvftGmxSasRQ@mail.gmail.com>
In-Reply-To: <CABqvwjs=S1VrCHe7M4JnDikGBVN3yqjNMrtSA=UvftGmxSasRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Shuey <shuey@purdue.edu>
Cc: Joe Perches <joe@perches.com>, "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, "<gregkh@linuxfoundation.org>" <gregkh@linuxfoundation.org>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "hpdd-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>, "<lustre-deve@lists.lustre.org>" <lustre-deve@lists.lustre.org>

Removal of lustre-added typedefs is worthwhile, actually.
I scraped the surface some time ago, but could not complete it back then.

On May 21, 2015, at 5:47 PM, Michael Shuey wrote:

> I've been killing off a *lot* of checkpatch warnings, and I'm probably getting a tad overzealous.  I'll drop these from the patch series next time I rebase, and avoid doing this in the future.  Thanks for the input.
> 
> Any suggestions on other checkpatch warnings?  Most of what remains are "don't introduce new typedefs" warnings - should these be removed as well, or am I safe to leave these?  I ask because these changes will be huge, and are unlikely to improve readability (but I don't know where the kernel community stands on having billions of typedefs everywhere.
> 
> --
> Mike Shuey
> 
> On Thu, May 21, 2015 at 5:00 PM, Joe Perches <joe@perches.com> wrote:
> On Thu, 2015-05-21 at 15:50 -0400, Mike Shuey wrote:
> > Fix many checkpatch.pl warnings.
> []
> > diff --git a/drivers/staging/lustre/lnet/lnet/acceptor.c b/drivers/staging/lustre/lnet/lnet/acceptor.c
> []
> > @@ -99,38 +99,42 @@ lnet_connect_console_error(int rc, lnet_nid_t peer_nid,
> >       switch (rc) {
> >       /* "normal" errors */
> >       case -ECONNREFUSED:
> > -             CNETERR("Connection to %s at host %pI4h on port %d was refused: check that Lustre is running on that node.\n",
> > -                     libcfs_nid2str(peer_nid),
> > -                     &peer_ip, peer_port);
> > +             CNETERR(
> > +                     "Connection to %s at host %pI4h on port %d was refused: check that Lustre is running on that node.\n",
> > +                     libcfs_nid2str(peer_nid), &peer_ip, peer_port);
> 
> These are not improvements and checkpatch messages aren't dicta.
> 
> Please don't convert code unless the conversion makes it better
> for a human reader.
> 
> These don't.
> 
> 
> 

