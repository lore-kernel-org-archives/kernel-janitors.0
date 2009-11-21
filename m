From: walter harms <wharms@bfs.de>
Date: Sat, 21 Nov 2009 12:44:59 +0000
Subject: Re: [PATCH 3/8] drivers/pcmcia: remove unnecessary kzalloc
Message-Id: <4B07E0CB.6000508@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911211250090.23681@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911211250090.23681@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Julia Lawall schrieb:
> From: Julia Lawall <julia@diku.dk>
> 
> The result of calling kzalloc is never used or freed.
> 
> The semantic match that finds this problem is as follows:
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
>      when != if (...) { <+...x...+> }
> (
> x->f1 = E
> |
>  (x->f1 = NULL || ...)
> |
>  f(...,x->f1,...)
> )
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
>  return@p2 ...;
> )
> 
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
> 
> print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  drivers/pcmcia/sa1111_generic.c     |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pcmcia/sa1111_generic.c b/drivers/pcmcia/sa1111_generic.c
> index deb5036..de6bc33 100644
> --- a/drivers/pcmcia/sa1111_generic.c
> +++ b/drivers/pcmcia/sa1111_generic.c
> @@ -127,10 +127,6 @@ int sa1111_pcmcia_add(struct sa1111_dev *dev, struct pcmcia_low_level *ops,
>  	ops->socket_state = sa1111_pcmcia_socket_state;
>  	ops->socket_suspend = sa1111_pcmcia_socket_suspend;
>  
> -	s = kzalloc(sizeof(*s) * ops->nr, GFP_KERNEL);
> -	if (!s)
> -		return -ENODEV;
> -
>  	for (i = 0; i < ops->nr; i++) {
>  		s = kzalloc(sizeof(*s), GFP_KERNEL);
>  		if (!s)



mmmh, perhaps the original idea was to have an array
and then he moved to a linked list ?

I thing the array idea is better (1. it fails on low mem propperly, 2. no need free()
3. less zmalloc stuff) but requieres that pcmcia_remove()
will release that array propperly

the bug is strange,

just my 2 cents,
       re,
 	wh
