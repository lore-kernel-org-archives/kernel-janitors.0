From: Bernd Petrovitsch <bernd@firmix.at>
Date: Thu, 03 Aug 2006 21:29:36 +0000
Subject: Re: [KJ] [PATCH] Use kzalloc
Message-Id: <1154640576.3231.3.camel@gimli.at.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11546380282929-git-send-email-tom_hisch@gmx.at>
In-Reply-To: <11546380282929-git-send-email-tom_hisch@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2006-08-03 at 22:47 +0200, tom_hisch@gmx.at wrote:
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

which leaves
----  snip  ----
#define alloc_thread_info(tsk)				
 	({							\
		struct thread_info *ret;			\
								\
		ret = kzalloc(THREAD_SIZE, GFP_KERNEL);		\
		ret;						\
 	})
----  snip  ----
which is AFAICS equivalent to 
----  snip  ----
#define alloc_thread_info(tsk) kzalloc(THREAD_SIZE, GFP_KERNEL)
----  snip  ----

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
