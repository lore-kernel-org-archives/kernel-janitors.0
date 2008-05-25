From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 25 May 2008 21:59:01 +0000
Subject: Re: sema_init fail in 2.6
Message-Id: <20080525215901.GC30894@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
In-Reply-To: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 26, 2008 at 03:13:43AM +0700, Iwan Budi Kusnanto wrote:
> /**
>  * this code is compiled & working in 2.4 kernel.
>  * Compiled in 2.6 but fail in module initialization.
>  */
> static struct semaphore sem_fail;
> 
> static init __init my_module_init_fail(void)
> {
>         sema_init (&sem_fail, 1);
> }

I forgot to say that the intended way for you to do this in 2.6 is:

static DECLARE_MUTEX(sem_fail);

BTW, have you considered using a struct mutex instead of a struct
semaphore?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
