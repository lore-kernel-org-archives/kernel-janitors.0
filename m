From: Rusty Russell <rusty@rustcorp.com.au>
Date: Mon, 21 Jan 2013 01:32:00 +0000
Subject: Re: [patch] module: potential deadlock in error path
Message-Id: <87ip6rwcvz.fsf@rustcorp.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130118074309.GB31793@elgon.mountain>
In-Reply-To: <20130118074309.GB31793@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

Dan Carpenter <dan.carpenter@oracle.com> writes:
> We take the lock twice if we hit this goto.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Damn, just pushed that to Linus: should have read mail first.

I've added this, thanks.

The following changes since commit a7f2a366f62319dfebf8d4dfe8b211f631c78457:

  ima: fallback to MODULE_SIG_ENFORCE for existing kernel module syscall (2012-12-24 09:35:48 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux.git tags/fixes-for-linus

for you to fetch changes up to 8f82d479da05bd7df8cca3a5fbc0273f73b601c0:

  module: potential deadlock in error path (2013-01-21 11:29:33 +1030)

----------------------------------------------------------------
Various minor fixes, but a slightly more complex one to fix the per-cpu overload
problem introduced recently by kvm id changes.

(Now with an error path fix from Dan, thanks)

----------------------------------------------------------------
Alexander Graf (1):
      virtio-blk: Don't free ida when disk is in use

Dan Carpenter (1):
      module: potential deadlock in error path

Rusty Russell (2):
      module: add new state MODULE_STATE_UNFORMED.
      module: put modules in list much earlier.

Sasha Levin (1):
      module: prevent warning when finit_module a 0 sized file

 drivers/block/virtio_blk.c  |    7 +-
 include/linux/module.h      |   10 +--
 kernel/debug/kdb/kdb_main.c |    2 +
 kernel/module.c             |  156 ++++++++++++++++++++++++++++++-------------
 lib/bug.c                   |    1 +
 5 files changed, 124 insertions(+), 52 deletions(-)
