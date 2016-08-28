From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 28 Aug 2016 10:24:40 +0000
Subject: Re: [PATCH 5/8] cris-cryptocop: Move an assignment for the variable "nooutpages" in cryptocop_ioctl_
Message-Id: <alpine.DEB.2.10.1608281218130.3321@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net> <2a70980b-54e3-812c-b76e-6b64640c469c@users.sourceforge.net> <alpine.DEB.2.10.1608272107070.3363@hadrien>
 <02c343e7-a7ac-26d1-4e79-ae50d3ec6dbb@users.sourceforge.net>
In-Reply-To: <02c343e7-a7ac-26d1-4e79-ae50d3ec6dbb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-cris-kernel@axis.com, Adam Buchbinder <adam.buchbinder@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Jiri Kosina <jkosina@suse.cz>, Mikael Starvik <starvik@axis.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>



On Sun, 28 Aug 2016, SF Markus Elfring wrote:

> >> +++ b/arch/cris/arch-v32/drivers/cryptocop.c
> >> @@ -2469,7 +2469,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
> >>  	struct page                     **inpages = NULL;
> >>  	struct page                     **outpages = NULL;
> >>  	int                             noinpages = 0;
> >> -	int                             nooutpages = 0;
> >> +	int                             nooutpages;
> >>
> >>  	struct cryptocop_desc           descs[5]; /* Max 5 descriptors are needed, there are three transforms that
> >>  						   * can get connected/disconnected on different places in the indata. */
> >> @@ -2695,6 +2695,8 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
> >>  			err = -ENOMEM;
> >>  			goto free_inpages;
> >>  		}
> >> +	} else {
> >> +		nooutpages = 0;
> >
> > Why is it better?  4 characters have becomes 2 lines.
>
> I suggest to express in a more precise way where this variable is needed
> actually.

The variable is used in the cleanup code at the end of the function.
Thus it conceptually has global scope, and it is completely reasonable to
initialize it at the beginning of its function, along with noinpages.

This code is horrible in so many ways: no space before {, lots of 0
initializations instead of kzalloc, random use of local cleanup code and
a label at the end of the function, the use of DEBUG, the use of printk,
the use of the very long function name in strings instead of __func__,
constants on the left of a != test, etc.  On the other hand there are also
very few commits on this code, and even fewer that are specific to this
code, so perhaps no one cares about it.

julia


>
> * It would also be an update candidate for the refactoring "Reduce the scope of a variable", wouldn't it?
>
> * Or would the refactoring "Split the implementation of a function into further functions" more appropriate here?
>
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
