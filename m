From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Mon, 09 Apr 2007 20:08:26 +0000
Subject: Re: [KJ] [PATCH] include KERN_* constant in printk() calls in
Message-Id: <20070409200826.GH4262@traven>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070409194151.GG4262@traven>
In-Reply-To: <20070409194151.GG4262@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

El Mon, Apr 09, 2007 at 04:02:09PM -0400 Dave Jones ha dit:

> On Mon, Apr 09, 2007 at 09:41:51PM +0200, Matthias Kaehlcke wrote:
>  > hi,
>  > 
>  > this is my first janitorial. please let me know your suggestions if
>  > you notice something incorrect or improvable.
>  > 
>  > the patch is against v2.6.21-rc6
>  > 
>  > ---
>  > 
>  > include KERN_* constant in printk() calls in mm/slab.c
>  > 
>  > Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
>  > 
>  > ---
>  > 
>  > diff --git a/mm/slab.c b/mm/slab.c
>  > index 4cbac24..616c240 100644
>  > --- a/mm/slab.c
>  > +++ b/mm/slab.c
>  > @@ -1732,9 +1732,9 @@ static void dump_line(char *data, int offset, int limit)
>  >  			error = data[offset + i];
>  >  			bad_count++;
>  >  		}
>  > -		printk(" %02x", (unsigned char)data[offset + i]);
>  > +		printk(KERN_ERR " %02x", (unsigned char)data[offset + i]);
>  >  	}
> 
> This one is wrong.  It's printing a bunch of numbers in a loop, so with your change
> it'll print for example...
> 
> KERN_ERR 00 KERN_ERR 01 KERN_ERR 02 KERN_ERR etc etc..
> 
> you only want the KERN_ERR at the beginning of each line.

thanks for the information, i didn't realize printk works this way
 
>  > -	printk("\n");
>  > +	printk(KERN_ERR "\n");
> 
> Likewise, only needed at the beginning of a line.
> 
>  >  	if (bad_count = 1) {
>  >  		error ^= POISON_FREE;
>  > @@ -1770,7 +1770,7 @@ static void print_objinfo(struct kmem_cache *cachep, void *objp, int lines)
>  >  			*dbg_userword(cachep, objp));
>  >  		print_symbol("(%s)",
>  >  				(unsigned long)*dbg_userword(cachep, objp));
>  > -		printk("\n");
>  > +		printk(KERN_ERR "\n");
> 
> same.
> 
>  >  	realobj = (char *)objp + obj_offset(cachep);
>  >  	size = obj_size(cachep);
>  > @@ -2151,13 +2151,13 @@ kmem_cache_create (const char *name, size_t size, size_t align,
>  >  		 */
>  >  		res = probe_kernel_address(pc->name, tmp);
>  >  		if (res) {
>  > -			printk("SLAB: cache with size %d has lost its name\n",
>  > +			printk(KERN_WARNING "SLAB: cache with size %d has lost its name\n",
>  >  			       pc->buffer_size);
>  >  			continue;
>  >  		}
>  
> this one looks ok, though KERN_ERR imo.

i was in doubt also and finally put KERN_WARNING cause it's the
current default. but i agree, will change it to KERN_ERR 

>  >  		if (!strcmp(pc->name, name)) {
>  > -			printk("kmem_cache_create: duplicate cache %s\n", name);
>  > +			printk(KERN_WARNING "kmem_cache_create: duplicate cache %s\n", name);
>  >  			dump_stack();
>  >  			goto oops;
>  >  		}
> 
> ditto
> 
>  > @@ -2294,7 +2294,7 @@ kmem_cache_create (const char *name, size_t size, size_t align,
>  >  	left_over = calculate_slab_order(cachep, size, align, flags);
>  >  
>  >  	if (!cachep->num) {
>  > -		printk("kmem_cache_create: couldn't create cache %s.\n", name);
>  > +		printk(KERN_WARNING "kmem_cache_create: couldn't create cache %s.\n", name);
>  >  		kmem_cache_free(&cache_cache, cachep);
>  >  		cachep = NULL;
>  >  		goto oops;
> 
> ditto
> 
>  > @@ -2929,10 +2929,10 @@ bad:
>  >  		     i < sizeof(*slabp) + cachep->num * sizeof(kmem_bufctl_t);
>  >  		     i++) {
>  >  			if (i % 16 = 0)
>  > -				printk("\n%03x:", i);
>  > -			printk(" %02x", ((unsigned char *)slabp)[i]);
>  > +				printk(KERN_ERR "\n%03x:", i);
>  > +			printk(KERN_ERR " %02x", ((unsigned char *)slabp)[i]);
>  >  		}
>  > -		printk("\n");
>  > +		printk(KERN_ERR "\n");
>  >  		BUG();
> 
> In a loop again, so not ok.

thanks a lot for your comments

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona


  The salvation of mankind lies only in making everything the concern of all
                         (Alexander Solzhenitsyn)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
