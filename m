From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 11 Jul 2006 17:05:16 +0000
Subject: Re: [KJ] thread_info.h use kzalloc
Message-Id: <20060711170516.GG4250@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607110947j6fd6ec3fgb180f05ca8654eb8@mail.gmail.com>
In-Reply-To: <8ef77f2e0607110947j6fd6ec3fgb180f05ca8654eb8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11.07.2006 [18:47:14 +0200], tom hisch wrote:
> hello,
> 
> i have some questions about the alloc_thread_info(tsk) macro in
> asm-i386/thread_info.h
> 
> 
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

Probably a reasonable change.

> ------>      ret;                                            \    // whats
> the meaning of this instruction ??
>        })

I think it's part of the magic of the ({ }) gcc'ism, which allows the
macro to effectively have a return value (that's how I think of it, at
least) without a return statement (in this case, the value of ret will
be stored in the corresponding lhs). I'm sure the real explanation can
be found in the gcc manual in the ({ }) section.

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
