From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Mon, 16 Apr 2007 18:53:57 +0000
Subject: Re: [KJ] [PATCH]Rocket port:use mutex instead of binary  semaphore
Message-Id: <20070416184157.GC9314@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070416174155.GA9314@arun.site> <adabqho8b65.fsf@cisco.com>
In-Reply-To: <adabqho8b65.fsf@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: Kernel Janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>, Andrw Morton <akpm@linux-foundation.org>

On 10:46 Mon 16 Apr     , Roland Dreier wrote:
>  > -	down_interruptible(&info->write_sem);
>  > +	if(mutex_lock_interruptible(&info->write_lock)){
>  > +		return -ERESTARTSYS;
>  > +	}
> 
> 1) This is a semantic change.  Of course using down_interruptible()
> without checking the return value is almost certainly a bug, but have
> you thought about whether returning ERESTARTSYS is correct here?  If
> you have, then please include the reasoning in your patch description.
> (Another possibility would be to just use an uninterruptible mutex_lock())
no,frankly not much..
and something which i didn't understand is
why a down  in one control path & an down_interruptible in other?

but i had in mind,which you rightly pointed out 
handling the return from _interruptible.

i have some bits and pieces of information regarding thie,
searching for more, and correction to my current understanding,
  so that i can make something meaningfull out of it.

earlier kernels used to return in EINTR & it was up to the use space to 
handle the interrupted system call. ..reissue..


then ERESTARTSYS mechanism was added and the kernel could restart the 
syscall on its own

so its up to us whether we want the interruption to be taken care by 
the userspace or kernel.
i.e return EINTR or ERESTARTSYS respectively.
CMIIW.


also i read somewhere that
ERESTARTSYS should never be seen by user space code.  The kernel should
either restart the current syscall or convert the code to EINTR before
returning to user space.  If you are seeing ERESTARTSYS in user space
then it is a kernel bug.


> 2) The coding style for the if statement is not quite right.  The
> correct way is to do
> 
> 	if (condition)
> 		one_liner;
> 
> (note the space between the 'if' and the '(', and no braces used)
> 
ok.. got it..

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
