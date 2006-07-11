From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 11 Jul 2006 17:09:41 +0000
Subject: Re: [KJ] thread_info.h use kzalloc
Message-Id: <20060711170834.GA6833@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607110947j6fd6ec3fgb180f05ca8654eb8@mail.gmail.com>
In-Reply-To: <8ef77f2e0607110947j6fd6ec3fgb180f05ca8654eb8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 11, 2006 at 06:47:14PM +0200, tom hisch wrote:
> i have some questions about the alloc_thread_info(tsk) macro in
> asm-i386/thread_info.h

> /* thread information allocation */
> #ifdef CONFIG_DEBUG_STACK_USAGE
> #define alloc_thread_info(tsk)                                  \
>        ({                                                      \
>                struct thread_info *ret;                        \
>                                                                \
> ------>      ret = kmalloc(THREAD_SIZE, GFP_KERNEL);         \  //  what
> about the use of kzalloc ??
>                if (ret)                                        \
>                        memset(ret, 0, THREAD_SIZE);            \

Indeed it should be kzalloc.

> ------>      ret;                                            \    // whats
> the meaning of this instruction ??
>        })

That's GNU extension meaning that value of this block equals to "ret" at
that point. It should be more or less equivalent to

static inline struct thread_info *alloc_thread_info(struct task_struct *task)
{
	return kzalloc(THREAD_SIZE, GFP_KERNEL);
}

> #else
> #define alloc_thread_info(tsk) kmalloc(THREAD_SIZE, GFP_KERNEL)
> #endif

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
