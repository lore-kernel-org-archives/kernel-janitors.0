From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 03:39:09 +0000
Subject: Re: [Kernel-janitors] [PATCH] Minor cleanup in mm/mremap.c
Message-Id: <20040104033909.GE20458@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132855.GD21909@eugeneteo.net>
In-Reply-To: <20040103132855.GD21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<quote sender="Matthew Wilcox">
> On Sat, Jan 03, 2004 at 09:28:55PM +0800, Eugene Teo wrote:
> > http://www.anomalistic.org/patches/mremap-remove-allocated_vma-fix-2.6.1-rc1-mm1.patch
> > 
> > diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/mremap.c 2.6.1-rc1-mm1-fix/mm/mremap.c
> > --- 2.6.1-rc1-mm1/mm/mremap.c	2003-12-18 10:58:56.000000000 +0800
> > +++ 2.6.1-rc1-mm1-fix/mm/mremap.c	2004-01-03 20:17:18.000000000 +0800
> > @@ -232,18 +234,16 @@
> >  		}
> >  	}
> >  
> > -	allocated_vma = 0;
> >  	if (!new_vma) {
> >  		new_vma = kmem_cache_alloc(vm_area_cachep, SLAB_KERNEL);
> >  		if (!new_vma)
> >  			goto out;
> > -		allocated_vma = 1;
> >  	}
> 
> Incorrect.  If new_vma already was non-NULL, allocated_vma will be 0.

You are right. The following code only works on a newly allocated vma
if it wasn't initialised prior to allocated_vma = 0.

Thanks.

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
