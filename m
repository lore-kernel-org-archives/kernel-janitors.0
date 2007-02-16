From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 16 Feb 2007 07:47:06 +0000
Subject: Re: [KJ] [PATCH 1/5] moving to is_power_of_2
Message-Id: <45D5617A.7070106@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vignesh Babu BM wrote:
> Removing instances of (n&(n-1)) for power of 2 
> check with is_power_of_2 from linux/log.h.
>   
As has been stated in this m-l before: is_power_of_2 is also non-zero.
>
>
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
> ---
>   
[snip]
> diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
> index 0c7e94e..4fc6887 100644
> --- a/arch/ia64/mm/hugetlbpage.c
> +++ b/arch/ia64/mm/hugetlbpage.c
> @@ -16,6 +16,7 @@
>  #include <linux/smp_lock.h>
>  #include <linux/slab.h>
>  #include <linux/sysctl.h>
> +#include <linux/log2.h>
>  #include <asm/mman.h>
>  #include <asm/pgalloc.h>
>  #include <asm/tlb.h>
> @@ -175,7 +176,8 @@ static int __init hugetlb_setup_sz(char *str)
>  		tr_pages = 0x15557000UL;
>  
>  	size = memparse(str, &str);
> -	if (*str || (size & (size-1)) || !(tr_pages & size) ||
> +	//if (*str || (size & (size-1)) || !(tr_pages & size) ||
> +	if (*str || !is_power_of_2(size) || !(tr_pages & size) ||
>  		size <= PAGE_SIZE ||
>  		size >= (1UL << PAGE_SHIFT << MAX_ORDER)) {
>  		printk(KERN_WARNING "Invalid huge page size specified\n");
>   

I don't think this line is correct by the reason said above and what is 
the deal with the _C++_ commentary?
One of the "golden rules" with patches is: it should only doing one 
thing and do it right. You are only doing one thing but why comment out 
the line that you later delete? If I understand it correctly, you 
patch-serie of 5 only need to be 2. (Makes it simpler to add/remove).

cu :)
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
