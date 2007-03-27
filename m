From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 27 Mar 2007 18:08:36 +0000
Subject: Re: [KJ] [PATCH] aoe, tb0219: fix late spin_lock_init() and friends
Message-Id: <20070327180836.GA5308@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070325190221.GA5308@martell.zuzino.mipt.ru> <20070325143609.75165bf6.akpm@linux-foundation.org>
In-Reply-To: <20070325143609.75165bf6.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ecashin@coraid.com, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Sun, Mar 25, 2007 at 02:36:09PM -0800, Andrew Morton wrote:
> On Sun, 25 Mar 2007 23:02:21 +0400 Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > Some drivers do register_chrdev() before lock or semaphore used in
> > corresponding file_operations is initialized.

> > --- a/drivers/char/tb0219.c
> > +++ b/drivers/char/tb0219.c
> > @@ -287,6 +287,8 @@ static int __devinit tb0219_probe(struct
> >  {
> >  	int retval;
> >
> > +	spin_lock_init(&tb0219_lock);
> > +
> >  	if (request_mem_region(TB0219_START, TB0219_SIZE, "TB0219") = NULL)
> >  		return -EBUSY;
> >
> > @@ -304,8 +306,6 @@ static int __devinit tb0219_probe(struct
> >  		return retval;
> >  	}
> >
> > -	spin_lock_init(&tb0219_lock);
> > -
> >  	old_machine_restart = _machine_restart;
> >  	_machine_restart = tb0219_restart;
> >
>
> These locks can and should be initialised at compile-time.

Documentation mentions that

	- it [dynamic spinlock initialization] hurts automatic lock validators
	- it becomes intrusive for the realtime preemption patches

First reason is clearly bogus, how relevant is the second one?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
