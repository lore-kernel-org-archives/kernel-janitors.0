From: David Sterba <dsterba@suse.cz>
Date: Wed, 17 Oct 2018 14:10:48 +0000
Subject: Re: [PATCH] btrfs: Fix the return value in case of error in 'btrfs_mark_extent_written()'
Message-Id: <20181017141047.GD29418@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181017091359.3763-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181017091359.3763-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: clm@fb.com, jbacik@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 17, 2018 at 11:13:59AM +0200, Christophe JAILLET wrote:
> We return 0 unconditionally in most of the error handling paths of
> 'btrfs_mark_extent_written()'.
> However, 'ret' is set to some error codes in several error handling paths.
> 
> Return 'ret' instead to propagate the error code.
> 
> Fixes: 9c8e63db1de9 ("Btrfs: kill BUG_ON()'s in btrfs_mark_extent_written")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch proposal is purely speculative.
> I'm not sure at all that returning 'ret' is correct (but it looks like it
> is :) )

Agreed.

> What puzzles me is when 'ret' is set, 'btrfs_abort_transaction()' is also
> called.
> However, the only caller of 'btrfs_mark_extent_written()' (i.e.
> 'btrfs_finish_ordered_io()') also calls 'btrfs_abort_transaction()' if an
> error is returned.
> So returning an error code here, would lead to a double call to this abort
> function.

Calling abort multiple times shuld not hurt, there's a bit set atomically
so that only the first time the stacktrace is printed. There's
possiblity of the trans->aborted value overwrite if two completely
different aborts happen exactly at the same time, but still both values
gen printed in the log so there's enough information.

> I'm usure of if it is correct and/or intented.
> If returning 'ret' is correct, should we also axe the 'btrfs_abort_transaction()'
> calls here, and leave the caller do the clean-up?

This depends on the context where the abort is used. Functions that do a
lot of things but do not start the transaction are allowed to call abort
after the first unrecoverable failure, so this possibly logs the exact
error. If the abort is only in the caller, we would not know which of
the many calls in btrfs_mark_extent_written failed.

> Before the commit in the Fixes tag, we were BUGing_ON in case of errror. So
> propagating the error was pointless.

Right, now the error must be propagated to btrfs_finish_ordered_io so
the "if (ret < 0) abort" is not skipped and code continues to
add_pending_csums, btrfs_update_inode_fallback etc.

Good catch, please resend with updated changelog, you can use the
relevant parts of my comments above to explain what's wrong. Thanks.
