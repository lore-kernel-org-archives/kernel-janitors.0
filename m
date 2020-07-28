From: Frank van der Linden <fllinden@amazon.com>
Date: Tue, 28 Jul 2020 16:09:53 +0000
Subject: Re: [PATCH] NFSv4.2: Fix an error code in nfs4_xattr_cache_init()
Message-Id: <20200728160953.GA1208@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727112344.GH389488@mwanda>
 <20200727163423.GA7563@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
 <4bb93c1413151ccbd918cc371c67555042763e11.camel@hammerspace.com>
In-Reply-To: <4bb93c1413151ccbd918cc371c67555042763e11.camel@hammerspace.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trondmy@hammerspace.com>
Cc: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>

Hi Trond,

On Tue, Jul 28, 2020 at 03:17:12PM +0000, Trond Myklebust wrote:
> 
> On Mon, 2020-07-27 at 16:34 +0000, Frank van der Linden wrote:
> > Hi Dan,
> >
> > On Mon, Jul 27, 2020 at 02:23:44PM +0300, Dan Carpenter wrote:
> > >
> > > This should return -ENOMEM on failure instead of success.
> > >
> > > Fixes: 95ad37f90c33 ("NFSv4.2: add client side xattr caching.")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > ---
> > >  fs/nfs/nfs42xattr.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/nfs/nfs42xattr.c b/fs/nfs/nfs42xattr.c
> > > index 23fdab977a2a..e75c4bb70266 100644
> > > --- a/fs/nfs/nfs42xattr.c
> > > +++ b/fs/nfs/nfs42xattr.c
> > > @@ -1040,8 +1040,10 @@ int __init nfs4_xattr_cache_init(void)
> > >                 goto out2;
> > >
> > >         nfs4_xattr_cache_wq = alloc_workqueue("nfs4_xattr",
> > > WQ_MEM_RECLAIM, 0);
> > > -       if (nfs4_xattr_cache_wq = NULL)
> > > +       if (nfs4_xattr_cache_wq = NULL) {
> > > +               ret = -ENOMEM;
> > >                 goto out1;
> > > +       }
> > >
> > >         ret = register_shrinker(&nfs4_xattr_cache_shrinker);
> > >         if (ret)
> > > --
> > > 2.27.0
> > >
> >
> > Thanks for catching that one. Since this is against linux-next via
> > Trond,
> > I assume Trond will add it to his tree (right?)
> >
> > In any case:
> >
> >
> > Reviewed-by: Frank van der Linden <fllinden@amazon.com>
> >
> >
> > - Frank
> 
> Frank, why do we need a workqueue here at all?

The xattr caches are per-inode, and get created on demand. Invalidating
a cache is done by setting the invalidate flag (as it is for other
cached attribues and data).

When nfs4_xattr_get_cache() sees an invalidated cache, it will just unlink it
from the inode, and create a new one if needed.

The old cache then still needs to be freed. Theoretically, there can be
quite a few entries in it, and nfs4_xattr_get_cache() will be called in
the get/setxattr systemcall path. So my reasoning here was that it's better
to use a workqueue to free the old invalidated cache instead of wasting
cycles in the I/O path.

- Frank
