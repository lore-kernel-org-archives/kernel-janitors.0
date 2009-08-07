From: Kumar Gala <galak@kernel.crashing.org>
Date: Fri, 07 Aug 2009 02:26:38 +0000
Subject: Re: [PATCH 2/10] arch/powerpc: introduce missing kfree
Message-Id: <44DC26BA-29CF-4DBA-8D9F-1AB950F8B861@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908021044330.15557@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908021044330.15557@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, paulus@samba.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org


On Aug 2, 2009, at 3:44 AM, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
>
> Error handling code following a kzalloc should free the allocated  
> data.
>
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,f1,l;
> position p1,p2;
> expression *ptr != NULL;
> @@
>
> x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x = NULL) S
> <... when != x
>     when != if (...) { <+...x...+> }
> (
> x->f1 = E
> |
> (x->f1 = NULL || ...)
> |
> f(...,x->f1,...)
> )
> ...>
> (
> return \(0\|<+...x...+>\|ptr\);
> |
> return@p2 ...;
> )
>
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
>
> print "* file: %s kmalloc %s return %s" %  
> (p1[0].file,p1[0].line,p2[0].line)
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
> arch/powerpc/sysdev/ipic.c          |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)


applied to next

- k

