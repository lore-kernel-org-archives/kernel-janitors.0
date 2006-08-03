From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Aug 2006 21:12:16 +0000
Subject: Re: [KJ] [PATCH] Use kzalloc
Message-Id: <20060803211216.GB6253@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11546380282929-git-send-email-tom_hisch@gmx.at>
In-Reply-To: <11546380282929-git-send-email-tom_hisch@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 03.08.2006 [22:47:08 +0200], tom_hisch@gmx.at wrote:
> From: Thomas Hisch <t.hisch@gmail.com>
> 
> use kzalloc in include/asm-i386/thread_info.h instead of kmalloc + memset
> 
> Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
> ---
>  include/asm-i386/thread_info.h |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)
> 
> diff --git a/include/asm-i386/thread_info.h b/include/asm-i386/thread_info.h
> index 54d6d7a..a8f37f2 100644
> --- a/include/asm-i386/thread_info.h
> +++ b/include/asm-i386/thread_info.h
> @@ -32,7 +32,6 @@ struct thread_info {
>  	__u32			cpu;		/* current CPU */
>  	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
>  
> -
Looks like an unrelated change sneaked in.

Thanks,
Nish

>  	mm_segment_t		addr_limit;	/* thread address space:
>  					 	   0-0xBFFFFFFF for user-thead
>  						   0-0xFFFFFFFF for kernel-thread
> @@ -99,9 +98,7 @@ #define alloc_thread_info(tsk)					\
>  	({							\
>  		struct thread_info *ret;			\
>  								\
> -		ret = kmalloc(THREAD_SIZE, GFP_KERNEL);		\
> -		if (ret)					\
> -			memset(ret, 0, THREAD_SIZE);		\
> +		ret = kzalloc(THREAD_SIZE, GFP_KERNEL);		\
>  		ret;						\
>  	})
>  #else
> -- 
> 1.4.2.rc1.gbc9e-dirty
> 
> 
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
