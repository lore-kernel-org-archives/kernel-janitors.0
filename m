From: David Sterba <dave@jikos.cz>
Date: Wed, 18 Apr 2012 11:58:42 +0000
Subject: Re: [patch 1/2] Btrfs: double unlock bug in error handling
Message-Id: <20120418115842.GI20982@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120418065903.GE12831@elgon.mountain>
 <4F8EA5AA.2080202@jan-o-sch.net>
In-Reply-To: <4F8EA5AA.2080202@jan-o-sch.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Schmidt <list.btrfs@jan-o-sch.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Chris Mason <chris.mason@oracle.com>, Jeff Mahoney <jeffm@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 18, 2012 at 01:29:46PM +0200, Jan Schmidt wrote:
> I think the correct way to fix this is:
> 
> diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
> index a844204..9af261a 100644
> --- a/fs/btrfs/extent-tree.c
> +++ b/fs/btrfs/extent-tree.c
> @@ -2450,7 +2450,6 @@ again:
> 
>                 ret = run_clustered_refs(trans, root, &cluster);
>                 if (ret < 0) {
> -                       spin_unlock(&delayed_refs->lock);
>                         btrfs_abort_transaction(trans, root, ret);
>                         return ret;
>                 }

That's another way to fix it, but I'd rather see the lock/unlock
balanced within a function, and in this case the extra lock does not
hurt as it's a rare codepath.


david
