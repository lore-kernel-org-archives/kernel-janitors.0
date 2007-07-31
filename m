From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 31 Jul 2007 22:05:05 +0000
Subject: A change of approach
Message-Id: <20070731220505.GT21219@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


It's not that 60+ patches to use kzalloc aren't welcome.  Well,
actually, yes, it is.  They should have been one patch per subsystem --
eg all of drivers/scsi in one patch.  All of net/ in one patch.  etc.

A better approach for the janitors to take would be to claim *a driver*,
and do everything on the todo list to it (as a series of patches,
obviously).  And fix up things that aren't on the todo list too, when
you notice them.

You'll get a lot more experience this way than you will doing
more-or-less mechanical substitutions.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
