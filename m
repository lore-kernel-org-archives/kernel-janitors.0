From: Jeff Layton <jlayton@redhat.com>
Date: Fri, 18 Aug 2017 16:04:09 +0000
Subject: Re: [PATCH 2/2] lockd: Adjust 61 checks for null pointers
Message-Id: <1503072249.4719.22.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e53b2d3a-239a-268c-5674-3c50b02c966f@users.sourceforge.net>
         <e76e873f-f18e-5bdd-cc93-255321b3d98f@users.sourceforge.net>
         <1503071631.44656.4.camel@primarydata.com>
In-Reply-To: <1503071631.44656.4.camel@primarydata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Trond Myklebust <trondmy@primarydata.com>, "colin.king@canonical.com" <colin.king@canonical.com>, "bfields@fieldses.org" <bfields@fieldses.org>, hch <hch@lst.de>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "elfring@users.sourceforge.net" <elfring@users.sourceforge.net>, bcodding redhat <bcodding@redhat.com>, "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, 2017-08-18 at 15:53 +0000, Trond Myklebust wrote:
> On Thu, 2017-08-17 at 16:34 +0200, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 17 Aug 2017 16:00:18 +0200
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=UTF-8
> > Content-Transfer-Encoding: 8bit
> > 
> > The script “checkpatch.pl” pointed information out like the
> > following.
> > 
> > Comparison to NULL could be written …
> > 
> > Thus fix the affected source code places.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  fs/lockd/clnt4xdr.c | 12 ++++++------
> >  fs/lockd/clntlock.c | 10 +++++-----
> >  fs/lockd/clntproc.c | 12 ++++++------
> >  fs/lockd/clntxdr.c  | 12 ++++++------
> >  fs/lockd/host.c     | 22 +++++++++++-----------
> >  fs/lockd/mon.c      | 16 ++++++++--------
> >  fs/lockd/svc.c      |  4 ++--
> >  fs/lockd/svc4proc.c |  6 +++---
> >  fs/lockd/svclock.c  | 14 +++++++-------
> >  fs/lockd/svcproc.c  |  6 +++---
> >  fs/lockd/svcshare.c |  2 +-
> >  fs/lockd/svcsubs.c  |  3 +--
> >  12 files changed, 59 insertions(+), 60 deletions(-)
> > 
> > diff --git a/fs/lockd/clnt4xdr.c b/fs/lockd/clnt4xdr.c
> > index c349fc0f9b80..ec6473d194fd 100644
> > --- a/fs/lockd/clnt4xdr.c
> > +++ b/fs/lockd/clnt4xdr.c
> > @@ -131,7 +131,7 @@ static int decode_netobj(struct xdr_stream *xdr,
> >  	__be32 *p;
> >  
> >  	p = xdr_inline_decode(xdr, 4);
> > -	if (unlikely(p = NULL))
> > +	if (unlikely(!p))
> 
> Oh STOP with the checkpatch wankfest!
> 

:)

To elaborate: these kinds of patches are particularly unwelcome. In
particular, these sorts of changes make it difficult to backport later
patches to earlier kernels.

If you're doing meaningful work in these areas of code, then feel free
to change the style at the same time. If not though, it's best to leave
them alone.

Cheers,
-- 
Jeff Layton <jlayton@redhat.com>
