From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 04 Dec 2009 22:39:40 +0000
Subject: Re: [PATCH] Fix misspelling of "journaled".
Message-Id: <alpine.LNX.2.00.0912042339230.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1259958262-24386-1-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1259958262-24386-1-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 4 Dec 2009, Adam Buchbinder wrote:

> "Journaled" is misspelled "journlaled" in an output string; this patch
> fixed it. No changes in functionality.
> 
> Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
> ---
>  fs/reiserfs/fix_node.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
> index 5e5a4e6..db3fd7d 100644
> --- a/fs/reiserfs/fix_node.c
> +++ b/fs/reiserfs/fix_node.c
> @@ -834,7 +834,7 @@ static int get_empty_nodes(struct tree_balance *tb, int h)
>  		RFALSE(buffer_dirty(new_bh) ||
>  		       buffer_journaled(new_bh) ||
>  		       buffer_journal_dirty(new_bh),
> -		       "PAP-8140: journlaled or dirty buffer %b for the new block",
> +		       "PAP-8140: journaled or dirty buffer %b for the new block",
>  		       new_bh);

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
