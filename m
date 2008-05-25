From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 25 May 2008 21:56:53 +0000
Subject: Re: sema_init fail in 2.6
Message-Id: <20080525215653.GB30894@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
In-Reply-To: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 26, 2008 at 03:13:43AM +0700, Iwan Budi Kusnanto wrote:
> Hello, i recently porting my driver from 2.4.35 to 2.6.X kernel.
> I meet some strange behaviour with sema_init. This is the code snippet
> 
> /**
>  * this code is compiled & working in 2.4 kernel.
>  * Compiled in 2.6 but fail in module initialization.

How does it fail?  What error messages do you get?

>  */
> static struct semaphore sem_fail;
> 
> static init __init my_module_init_fail(void)
> {
>         sema_init (&sem_fail, 1);
> }
> 
> /**
>  * this code compiled & work in 2.6
>  */
> struct semaphore *sem;
> 
> static init __init my_module_init(void)
> {
>         sem = (struct semaphore *) kmalloc (sizeof (struct semaphore
> ), GFP_KERNEL);
>         sema_init (sem, 1);
> }
> 
> Any idea?
> Thx
> 
> -- 
> Iwan Budi Kusnanto
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
