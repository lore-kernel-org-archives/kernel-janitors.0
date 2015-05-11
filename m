From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 11 May 2015 08:29:29 +0000
Subject: Re: type mismatch
Message-Id: <20150511082929.GA24018@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1505101517100.2645@hadrien>
In-Reply-To: <alpine.DEB.2.10.1505101517100.2645@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 11 May 2015, Julia Lawall wrote:

> 
> 
> On Mon, 11 May 2015, Nicholas Mc Guire wrote:
> 
> > On Sun, 10 May 2015, Dan Carpenter wrote:
> > 
> > > I don't really have a strong opinion either way...  It's unlikely that
> > > we will introduce a bug here and if we did, I think it would be caught
> > > immediately in testing.
> > > 
> > > It's pretty common to treat the first member of a struct as special.
> > > What annoys me is when people do
> > > 
> > > struct foo {
> > > 	int one, two, three;
> > > 	whatever;
> > > };
> > > 
> > > memcpy(&foo.one, src, sizoef(struct foo));
> > > 
> > > Argh!?  These triger buffer overflows warnings in Smatch and I don't
> > > see the point since &foo.one is less readable than &foo!  Oh well, I
> > > think these were common enough, I had to treat it as idiomatic and add a
> > > special case for them.
> > >
> > just ran a naive scanner for that pattern but only could find this one instance
> > 
> > ./net/sctp/sm_make_chunk.c:3103 ugly memset 
> > 3102          if (af->is_any(&addr))
> > 3103                  memcpy(&addr.v4, sctp_source(asconf), sizeof(addr));
> > 
> > my scanner ist:
> > 
> > @uses_first@
> > identifier f;
> > idexpression s;
> 
> Maybe generalize s (ie expression) and the size (ie, don't specify 
> anything)?  The sizeof could be a type also.
>
yup - adding the type check case finds two additional cases
but generalizing s to an expression did not change results

@uses_first@
identifier f;
type T;
idexpression T s;
identifier e;
position p;
@@

f(...){
<+...
(
* memcpy@p(&s.e,...,sizeof(s));
|
* memcpy@p(&s.e,...,sizeof(T));
)
...+>
}

./drivers/infiniband/hw/ehca/ehca_mcast.c:80 ugly memset
./drivers/infiniband/hw/ehca/ehca_mcast.c:117 ugly memset
./net/sctp/sm_make_chunk.c:3103 ugly memset

thx!
hofrat
