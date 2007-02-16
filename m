From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 16 Feb 2007 08:32:26 +0000
Subject: Re: [KJ] [PATCH 1/5] moving to is_power_of_2
Message-Id: <1171614026.27506.93.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2007-02-16 at 08:47 +0100, Richard Knutsson wrote:
> Vignesh Babu BM wrote:
> > Removing instances of (n&(n-1)) for power of 2 
> > check with is_power_of_2 from linux/log.h.
> >   
> As has been stated in this m-l before: is_power_of_2 is also non-zero.
> >
> >
> > Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
> > ---
> >   
> [snip]
> > diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
> > index 0c7e94e..4fc6887 100644
> > --- a/arch/ia64/mm/hugetlbpage.c
> > +++ b/arch/ia64/mm/hugetlbpage.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/smp_lock.h>
> >  #include <linux/slab.h>
> >  #include <linux/sysctl.h>
> > +#include <linux/log2.h>
> >  #include <asm/mman.h>
> >  #include <asm/pgalloc.h>
> >  #include <asm/tlb.h>
> > @@ -175,7 +176,8 @@ static int __init hugetlb_setup_sz(char *str)
> >  		tr_pages = 0x15557000UL;
> >  
> >  	size = memparse(str, &str);
> > -	if (*str || (size & (size-1)) || !(tr_pages & size) ||
> > +	//if (*str || (size & (size-1)) || !(tr_pages & size) ||
> > +	if (*str || !is_power_of_2(size) || !(tr_pages & size) ||
> >  		size <= PAGE_SIZE ||
> >  		size >= (1UL << PAGE_SHIFT << MAX_ORDER)) {
> >  		printk(KERN_WARNING "Invalid huge page size specified\n");
> >   
> 
> I don't think this line is correct by the reason said above and what is 
> the deal with the _C++_ commentary?
> One of the "golden rules" with patches is: it should only doing one 
> thing and do it right. You are only doing one thing but why comment out 
> the line that you later delete? If I understand it correctly, you 
> patch-serie of 5 only need to be 2. (Makes it simpler to add/remove).
> 
> cu :)
> Richard Knutsson
> 

Working on the cleanup...just a quick clarification....
size <= PAGE_SIZE will result in true when size=0
is that not the same that happens when we run !is_power_of_2(size) when
size=0?

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
