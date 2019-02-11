From: David Sterba <dsterba@suse.cz>
Date: Mon, 11 Feb 2019 16:36:13 +0000
Subject: Re: [PATCH] btrfs: Silence a static checker locking warning
Message-Id: <20190211163612.GW2900@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190209090254.GC4865@kadam>
In-Reply-To: <20190209090254.GC4865@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Jeff Mahoney <jeffm@suse.com>, Josef Bacik <josef@toxicpanda.com>, kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org

On Sat, Feb 09, 2019 at 12:02:55PM +0300, Dan Carpenter wrote:
> Back in the day, before commit 0b246afa62b0 ("btrfs: root->fs_info
> cleanup, add fs_info convenience variables") then we used to take
> different locks.

Nope, it's the same per-filesystem lock, just the old code got there
in two different ways (ie. two subvolume roots).

> But now it's just one lock and the static checkers
> think we can call down_read(&fs_info->subvol_sem); twice in a row which
> would lead to a deadlock.

Why? It's read side of a semaphore.

> That code is several years old now so presumably both (old_ino =
> BTRFS_FIRST_FREE_OBJECTID) and (new_ino = BTRFS_FIRST_FREE_OBJECTID)
> conditions can't be true at the same time or the bug would have showed
> up in testing.

Why do you think it's a bug? If you are sure that there's a bug we've
overlooked, please state it in the changelog, the rationale you've
provided is very vague.

And I believe also wrong. The rename-exchange cannot work between two
subvolumes, but we still can cross-rename two subvolumes. In this
example hierarchy:

/
- subvol1 (inode number 256, ie. BTRFS_FIRST_FREE_OBJECTID)
  - file1
- subvol2 (inode number 256, ie. BTRFS_FIRST_FREE_OBJECTID)
  - file2

btrfs_rename_exchange leads to this:

/
- subvol1
  - file2
- subvol2
  - file1

There's no common tool that supports renameat2, so I'm using the one
from fstests/src/renameat2.c to verify that, and it does indeed work as
expected.

> I have re-written the code though to make it cleaner and
> to silence the static checkers.

Maybe there's something new the static checker needs to learn.
