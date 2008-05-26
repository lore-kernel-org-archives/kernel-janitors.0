From: "Iwan Budi Kusnanto" <iwanbk@gmail.com>
Date: Mon, 26 May 2008 04:33:28 +0000
Subject: Re: sema_init fail in 2.6
Message-Id: <41f748550805252133q568a2f9ah38743d51e6cf47d4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
In-Reply-To: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello, i forget to mention that i have some dirty hack in build process.
In compilation, there is error message.

/data/maribaya/kernel_src/include/asm/processor.h:80: error:
`CONFIG_X86_L1_CACHE_SHIFT' undeclared here (not in a function)
/data/maribaya/kernel_src/include/asm/processor.h:80: error: requested
alignment is not a constant
In file included from /data/maribaya/kernel_src/include/linux/list.h:8,
                 from /data/maribaya/kernel_src/include/linux/lockdep.h:12,
                 from
/data/maribaya/kernel_src/include/linux/spinlock_types.h:12,
                 from /data/maribaya/src/include/linux/spinlock.h:78,
                 from /data/maribaya/kernel_src/include/linux/mmzone.h:7,
                 from /data/maribaya/kernel_src/include/linux/gfp.h:4,
                 from /data/maribaya/kernel_src/include/linux/slab.h:14,

It seems strange for me , because kernel build is successfull & my PC
running with this kernel. I build my kernel from clean kernel.
So, in makefile i add :
   CFLAGS += -DCONFIG_X86_L1_CACHE_SHIFT=7

Thx

On Mon, May 26, 2008 at 4:56 AM, Matthew Wilcox <matthew@wil.cx> wrote:
> On Mon, May 26, 2008 at 03:13:43AM +0700, Iwan Budi Kusnanto wrote:
>> Hello, i recently porting my driver from 2.4.35 to 2.6.X kernel.
>> I meet some strange behaviour with sema_init. This is the code snippet
>>
>> /**
>>  * this code is compiled & working in 2.4 kernel.
>>  * Compiled in 2.6 but fail in module initialization.
>
> How does it fail?  What error messages do you get?
>
>>  */
>> static struct semaphore sem_fail;
>>
>> static init __init my_module_init_fail(void)
>> {
>>         sema_init (&sem_fail, 1);
>> }
>>
>> /**
>>  * this code compiled & work in 2.6
>>  */
>> struct semaphore *sem;
>>
>> static init __init my_module_init(void)
>> {
>>         sem = (struct semaphore *) kmalloc (sizeof (struct semaphore
>> ), GFP_KERNEL);
>>         sema_init (sem, 1);
>> }
>>
>> Any idea?
>> Thx
>>
>> --
>> Iwan Budi Kusnanto
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> Intel are signing my paycheques ... these opinions are still mine
> "Bill, look, we understand that you're interested in selling us this
> operating system, but compare it to ours.  We can't possibly take such
> a retrograde step."
>



--
Iwan Budi Kusnanto
