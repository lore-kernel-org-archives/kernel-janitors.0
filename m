From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 04 Jan 2006 22:39:38 +0000
Subject: Re: [KJ] [PATCH] mm: Clean up local variables
Message-Id: <20060104223938.GC1243@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82423387317207153=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060104170119.GB1243@neon.tklauser.home>
In-Reply-To: <20060104170119.GB1243@neon.tklauser.home>
To: kernel-janitors@vger.kernel.org

--===============82423387317207153==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2006-01-04 at 18:18:19 +0100, Matthew Wilcox <matthew@wil.cx> wrote:
> On Wed, Jan 04, 2006 at 06:01:19PM +0100, Tobias Klauser wrote:
> > diff -urpN -X dontdiff linux-2.6.15/mm/slab.c linux-2.6.15~tk/mm/slab.c
> > --- linux-2.6.15/mm/slab.c	2006-01-03 14:41:57.000000000 +0100
> > +++ linux-2.6.15~tk/mm/slab.c	2006-01-04 15:52:41.000000000 +0100
> > @@ -921,7 +921,6 @@ static int __devinit cpuup_callback(stru
> >  		down(&cache_chain_sem);
> >  
> >  		list_for_each_entry(cachep, &cache_chain, next) {
> > -			struct array_cache *nc;
> >  			cpumask_t mask;
> >  
> >  			mask = node_to_cpumask(node);
> 
> While this does work, it's quite bad style.  Much better to move the
> upper level declaration (line 856) into the block it's used in (line
> 893).  BTW, that function is too big at 133 lines and should be split.

Sure. That makes more sense. I'll send a new patch.

Thanks, Tobias

--===============82423387317207153==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82423387317207153==--
