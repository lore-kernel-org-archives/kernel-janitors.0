From: "tom hisch" <t.hisch@gmail.com>
Date: Sun, 13 Aug 2006 11:00:58 +0000
Subject: [KJ] [PATCH] Use kzalloc
Message-Id: <8ef77f2e0608130400g98bdec1pbcd478cf8147a0db@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11546380282929-git-send-email-tom_hisch@gmx.at>
In-Reply-To: <11546380282929-git-send-email-tom_hisch@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

walter harms wrote:
>hi thomas,
>this patch results in:
>
>#ifdef CONFIG_DEBUG_STACK_USAGE
>#define alloc_thread_info(tsk) kzalloc(THREAD_SIZE, GFP_KERNEL)
>#else
>#define alloc_thread_info(tsk) kmalloc(THREAD_SIZE, GFP_KERNEL)
>#endif
>
>does it make sense to have two case ? the performance penalty should not
>matter if this is reduced to
>#define alloc_thread_info(tsk) kzalloc(THREAD_SIZE, GFP_KERNEL)
>in any case. opinions ?

yes, we could reduce it to kzalloc but why should we reduce it when a
zeroed allocation is not really needed in case of
CONFIG_DEBUG_STACK_USAGE is not set.  look at
include/asm-powerpc/thread_info.h there is the same defined
alloc_thread_info function (if THREAD_SHIFT < PAGE_SHIFT) as in my
patch.

maybe I'm totally wrong with my point of view, so please let me hear
your opinions.

thomas

>
>just my 2 cents,
>  walter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
