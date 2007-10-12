From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 12 Oct 2007 19:28:28 +0000
Subject: Re: removing lock_kernel() from fs/fat
Message-Id: <20071012192827.GA29934@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2886DD596C4DC74CB5F37646863CD63501A7256D@S99XCHNG3.okdhs.int>
In-Reply-To: <2886DD596C4DC74CB5F37646863CD63501A7256D@S99XCHNG3.okdhs.int>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 12, 2007 at 12:18:23PM -0500, Little, Chris wrote:
> 1.  In file.c, line 304:
> 	lock_kernel();
> 	fat_free(inode, nr_clusters);
> 	unlock_kernel();
> 
> 	Why wrap fat_free with lock_kernel and not lock in the function
> itself?

Probably no good reason.  You should be able to push it down into the
function.

> 2.  In inode.c, starting at lines 439 and 570, the two functions
> fat_clear_inode() and fat_write_inode() lock_kernel and then spin lock.
> Why the spin lock if it already has the bkl?

Because you have to protect against other CPUs reading this inode, some
of which may have the BKL and others may have the inode_hash_lock.

> In fact I'm almost positive I'm missing something, but
> I'm here to learn.  So here it is:
> 
> --- linux-2.6.23/fs/fat/dir.c   2007-10-09 15:31:38.000000000 -0500
> +++ linux-2.6.23-jcl/fs/fat/dir.c     2007-10-12 11:02:17.000000000
> -0500
> @@ -459,8 +459,9 @@
>         int chi, chl, i, i2, j, last, last_u, dotoffset = 0;
>         loff_t cpos;
>         int ret = 0;
> +       rwlock_t mr_rwlock = RW_LOCK_UNLOCKED;
>  
> -       lock_kernel();
> +       read_lock(&mr_rwlock);
>  
>         cpos = filp->f_pos;
>         /* Fake . and .. for the root directory. */
> @@ -642,7 +643,7 @@
>         if (unicode)
>                 free_page((unsigned long)unicode);
>  out:
> -       unlock_kernel();
> +       read_unlock(&mr_rwlock);
>         return ret;
>  }
>  

Basically, you should never put a spinlock on the stack.  You can't
exclude any other caller because they'll have their own copy of this
spinlock.  If it were static, that would be one thing, but I think you
intend for it to be shared with the function below ...

Another mistake you've made is using an rwlock.  This is a classic
beginners mistake, as the problem with it is highly non-obvious.  The
trouble with rwlocks is that they're unfair to writers.  A storm of
readers can prevent a writer from ever getting the lock.  It's normally
a good thing to use a plain spinlock and only convert to an rwlock if
you're sure it's a good idea.

A further mistake is picking a filesystem as a good candidate for BKL
removal.  Take a look at Documentation/filesystems/Locking.  You'll see
there's a lot of places where the VFS takes the BKL on behalf of the
filesystem.  So taking the BKL inside a filesystem implicitly locks out
a lot of places that might call into the filesystem.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
