From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 07 Jul 2008 10:19:09 +0000
Subject: Re: mixing interupts and threads.
Message-Id: <20080707101908.GX14894@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <48719C96.6010503@gmail.com>
In-Reply-To: <48719C96.6010503@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 07, 2008 at 10:03:26AM +0530, ravikumar wrote:
> 1. Lets suppose i've some critical section and it is synchronized with 
> locks. A thread came and  it's  execution  is in the middle of critical 
> section, at this time an interrupt was occurred which  also executes 
> critical section. As interrupts can't wait on any lock it will get lock 
> and try to execute the critical section and above thread was not yet 
> completed. So inconsistency . How this was handled in Linux.

I recommend you read the excellent
Documentation/DocBook/kernel-locking.tmpl.  If you run 'make pdfdocs',
you can read it as a pdf (other output formats also available).

The short answer to your question is that interrupts should be disabled
while the thread is holding the spinlock.

> 2.Some process is running in kernel mode, at this a kill was sent to 
> this process, does this signal will delivered to the process while it is 
> in kernel mode.

Yes.  If you examine the implementation of, say,
mutex_lock_interruptible(), you'll see how it checks to see whether
signals are pending.  Other functions ending in _interruptible() will
likely do similar checks.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
