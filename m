From: Matthew Wilcox <willy@debian.org>
Date: Sat, 03 Jan 2004 22:31:50 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return value in mm/memory.c
Message-Id: <20040103223150.GO6982@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 03, 2004 at 09:29:46PM +0800, Eugene Teo wrote:
> http://www.anomalistic.org/patches/memory-check-ret-find_extend_vma-fix-2.6.1-rc1-mm1.patch
> 
> diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/memory.c 2.6.1-rc1-mm1-fix/mm/memory.c
> --- 2.6.1-rc1-mm1/mm/memory.c	2004-01-03 20:33:39.000000000 +0800
> +++ 2.6.1-rc1-mm1-fix/mm/memory.c	2004-01-03 20:50:13.000000000 +0800
> @@ -34,6 +34,9 @@
>   *
>   * 16.07.99  -  Support of BIGMEM added by Gerhard Wichert, Siemens AG
>   *		(Gerhard.Wichert@pdb.siemens.de)
> + *
> + * 03.01.04  -	Check the return value of find_extend_vma, added by
> + * 		Eugene Teo (eugeneteo@eugeneteo.net)
>   */
>  
>  #include <linux/kernel_stat.h>
> @@ -712,6 +715,8 @@
>  		struct vm_area_struct *	vma;
>  
>  		vma = find_extend_vma(mm, start);
> +		if (unlikely(!vma))
> +			return -EFAULT;

But we already check the return value ...

                vma = find_extend_vma(mm, start);

#ifdef FIXADDR_USER_START
                if (!vma &&
                    start >= FIXADDR_USER_START && start < FIXADDR_USER_END) {
...
#endif

                if (!vma || (pages && (vma->vm_flags & VM_IO))
                                || !(flags & vma->vm_flags))
                        return i ? : -EFAULT;

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
