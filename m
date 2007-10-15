From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 15 Oct 2007 18:23:16 +0000
Subject: Re: removing lock_kernel() from fs/fat
Message-Id: <20071015182316.GE25488@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2886DD596C4DC74CB5F37646863CD63501A7256D@S99XCHNG3.okdhs.int>
In-Reply-To: <2886DD596C4DC74CB5F37646863CD63501A7256D@S99XCHNG3.okdhs.int>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 15, 2007 at 11:39:42AM -0500, Little, Chris wrote:
> > Another mistake you've made is using an rwlock.  This is a 
> > classic beginners mistake, as the problem with it is highly 
> > non-obvious.  The trouble with rwlocks is that they're unfair 
> > to writers.  A storm of readers can prevent a writer from 
> > ever getting the lock.  It's normally a good thing to use a 
> > plain spinlock and only convert to an rwlock if you're sure 
> > it's a good idea.
> 
> Question:  Are there appropriate times to use rwlock, then? Doesn't it
> imply that there are writers?

There definitely are appropriate times to use rwlock.  This might even
be one of them.  But it's a non-obvious risk that needs to be born in
mind, and it's rarely a win.

Here's a good example:
include/linux/netdevice.h:extern rwlock_t dev_base_lock;          /* Device list lock */

So when we're adding a new network device or removing an old one
(infrequent operation, can afford to wait for a long time), we take it
for write.  All kinds of places in the network layer require the list
of network devices don't change while they look things up, so they all
take it for read, and there's no need to exclude them against each other.

It's possible that a situation like this obtains in fat.  I haven't
looked into it.  But anyone who wants to change a lock type really needs
to provide a good argument for why it should be changed.  Back when we
had a BKL brigade, they posted a patch to fs/locks.c which I was able
to show would actually increase contention.

> Many thanks for your comments.  Things to file away.  Pardon me if I
> keep throwing stuff up.  One day I might just get good at this.

It takes a while.  Keep reading code, it's the best way to learn.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
