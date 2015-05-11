From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 11 May 2015 07:32:57 +0000
Subject: Re: type mismatch
Message-Id: <alpine.DEB.2.02.1505110931540.2010@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1505101517100.2645@hadrien>
In-Reply-To: <alpine.DEB.2.10.1505101517100.2645@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Mon, 11 May 2015, Nicholas Mc Guire wrote:

> On Sun, 10 May 2015, Dan Carpenter wrote:
> 
> > I don't really have a strong opinion either way...  It's unlikely that
> > we will introduce a bug here and if we did, I think it would be caught
> > immediately in testing.
> > 
> > It's pretty common to treat the first member of a struct as special.
> > What annoys me is when people do
> > 
> > struct foo {
> > 	int one, two, three;
> > 	whatever;
> > };
> > 
> > memcpy(&foo.one, src, sizoef(struct foo));
> > 
> > Argh!?  These triger buffer overflows warnings in Smatch and I don't
> > see the point since &foo.one is less readable than &foo!  Oh well, I
> > think these were common enough, I had to treat it as idiomatic and add a
> > special case for them.
> >
> just ran a naive scanner for that pattern but only could find this one instance
> 
> ./net/sctp/sm_make_chunk.c:3103 ugly memset 
> 3102          if (af->is_any(&addr))
> 3103                  memcpy(&addr.v4, sctp_source(asconf), sizeof(addr));
> 
> my scanner ist:
> 
> @uses_first@
> identifier f;
> idexpression s;

Maybe generalize s (ie expression) and the size (ie, don't specify 
anything)?  The sizeof could be a type also.

julia

> identifier e;
> position p;                                                                     
> @@
> 
> f(...){
> <+...
> * memcpy@p(&s.e,...,sizeof(s));
> ...+>
> }
> 
> @script:python@
> p << uses_first.p;
> @@
> print "%s:%s ugly memset" % (p[0].file,p[0].line)
> 
> so is my scanner broken/incomplete or has this pattern lost its popularity ?
> 
> thx!
> hofrat
> 
