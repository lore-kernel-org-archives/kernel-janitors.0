From: Johannes Weiner <hannes@cmpxchg.org>
Date: Thu, 30 Jul 2009 19:12:14 +0000
Subject: Re: [PATCH 3/5] mm: Add kmalloc NULL tests
Message-Id: <20090730191213.GA9471@cmpxchg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907301608350.8734@ask.diku.dk> <20090730153658.GA22986@cmpxchg.org> <20090730183558.GA11763@logfs.org>
In-Reply-To: <20090730183558.GA11763@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Cc: Julia Lawall <julia@diku.dk>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 30, 2009 at 08:35:59PM +0200, J=C3=B6rn Engel wrote:
> On Thu, 30 July 2009 17:36:58 +0200, Johannes Weiner wrote:
> > On Thu, Jul 30, 2009 at 04:10:22PM +0200, Julia Lawall wrote:
> >=20
> > > diff --git a/mm/slab.c b/mm/slab.c
> > > index 7b5d4de..972e427 100644
> > > --- a/mm/slab.c
> > > +++ b/mm/slab.c
> > > @@ -1502,6 +1502,7 @@ void __init kmem_cache_init(void)
> > > =20
> > >  		ptr =3D kmalloc(sizeof(struct arraycache_init), GFP_NOWAIT);
> > > =20
> > > +		BUG_ON(!ptr);
> > >  		BUG_ON(cpu_cache_get(&cache_cache) !=3D &initarray_cache.cache);
> > >  		memcpy(ptr, cpu_cache_get(&cache_cache),
> > >  		       sizeof(struct arraycache_init));
> >=20
> > This does not change the end result when the allocation fails: you get
> > a stacktrace and a kernel panic.  Leaving it as is saves a line of
> > code.
>=20
> According to http://lwn.net/Articles/342420/, there may be a subtle
> difference.

You will probably have a hard time establishing a userspace mapping
before slab is initializied :)
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
