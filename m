From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sun, 24 Jun 2012 09:37:53 +0000
Subject: Re: [PATCH] vfs: Release semaphore before returning in lock_mount().
Message-Id: <20120624093753.GQ14083@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1340529515-23436-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1340529515-23436-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jun 24, 2012 at 02:48:35PM +0530, santosh nayak wrote:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> There is a missing "up_write()" here. Semaphore should be released
> before returning.

Even in a function called lock_<something> with the main effect being
to grab that semaphore (and a mutex, while we are at it)? ;-)

The whole point of lock_mount() is to get us the situation when
	1) path->{mnt,dentry} isn't overmounted by anything
	2) path->dentry is known to be alive
	3) we are guaranteed that these conditions will hold until
we do unlock_mount().
(1) is preserved by ->i_mutex; (2) - by namespace_sem.  Retry loop in
there is for handling the case when someone has raced with us and
mounted something on top of path after we'd looked it up and before
we got namespace_sem.  unlock_mount() right next to it drops both
->i_mutex and namespace_sem; these two are paired in all callers
(easily verified, since they are static in file; only 4 callers
of each in there), so we are OK.

IOW, NAK.
