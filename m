From: Matthew Wilcox <willy@debian.org>
Date: Sat, 03 Jan 2004 22:29:40 +0000
Subject: Re: [Kernel-janitors] [PATCH] Minor cleanup in mm/mremap.c
Message-Id: <20040103222940.GN6982@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132855.GD21909@eugeneteo.net>
In-Reply-To: <20040103132855.GD21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 03, 2004 at 09:28:55PM +0800, Eugene Teo wrote:
> http://www.anomalistic.org/patches/mremap-remove-allocated_vma-fix-2.6.1-rc1-mm1.patch
> 
> diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/mremap.c 2.6.1-rc1-mm1-fix/mm/mremap.c
> --- 2.6.1-rc1-mm1/mm/mremap.c	2003-12-18 10:58:56.000000000 +0800
> +++ 2.6.1-rc1-mm1-fix/mm/mremap.c	2004-01-03 20:17:18.000000000 +0800
> @@ -232,18 +234,16 @@
>  		}
>  	}
>  
> -	allocated_vma = 0;
>  	if (!new_vma) {
>  		new_vma = kmem_cache_alloc(vm_area_cachep, SLAB_KERNEL);
>  		if (!new_vma)
>  			goto out;
> -		allocated_vma = 1;
>  	}

Incorrect.  If new_vma already was non-NULL, allocated_vma will be 0.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
