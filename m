From: "Little, Chris" <Chris.Little@okdhs.org>
Date: Mon, 15 Oct 2007 16:39:42 +0000
Subject: RE: removing lock_kernel() from fs/fat
Message-Id: <2886DD596C4DC74CB5F37646863CD63501A725BD@S99XCHNG3.okdhs.int>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2886DD596C4DC74CB5F37646863CD63501A7256D@S99XCHNG3.okdhs.int>
In-Reply-To: <2886DD596C4DC74CB5F37646863CD63501A7256D@S99XCHNG3.okdhs.int>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Crap.  Hit send before I was done. 

> -----Original Message-----
> From: Matthew Wilcox [mailto:matthew@wil.cx] 
> Sent: Friday, October 12, 2007 2:28 PM
> To: Little, Chris
> Cc: kernel-janitors@vger.kernel.org
> Subject: Re: removing lock_kernel() from fs/fat
>
> > Why the spin lock if it already has the bkl?
> 
> Because you have to protect against other CPUs reading this 
> inode, some of which may have the BKL and others may have the 
> inode_hash_lock.

That makes sense.

> Another mistake you've made is using an rwlock.  This is a 
> classic beginners mistake, as the problem with it is highly 
> non-obvious.  The trouble with rwlocks is that they're unfair 
> to writers.  A storm of readers can prevent a writer from 
> ever getting the lock.  It's normally a good thing to use a 
> plain spinlock and only convert to an rwlock if you're sure 
> it's a good idea.
> 
> A further mistake is picking a filesystem as a good candidate 
> for BKL removal.  Take a look at 
> Documentation/filesystems/Locking.  You'll see there's a lot 
> of places where the VFS takes the BKL on behalf of the 
> filesystem.  So taking the BKL inside a filesystem implicitly 
> locks out a lot of places that might call into the filesystem.

Question:  Are there appropriate times to use rwlock, then? Doesn't it
imply that there are writers?

Many thanks for your comments.  Things to file away.  Pardon me if I
keep throwing stuff up.  One day I might just get good at this.

:)
