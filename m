From: David Sterba <dsterba@suse.cz>
Date: Mon, 20 Aug 2018 13:43:42 +0000
Subject: Re: [PATCH] btrfs: use after free in btrfs_quota_enable()
Message-Id: <20180820134342.GX24025@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180820082533.rs3yh4agza6epz7j@kili.mountain>
In-Reply-To: <20180820082533.rs3yh4agza6epz7j@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Nikolay Borisov <nborisov@suse.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 20, 2018 at 11:25:33AM +0300, Dan Carpenter wrote:
> The issue here is that btrfs_commit_transaction() frees "trans" on both
> the error and the success path.  So the problem would be if
> btrfs_commit_transaction() succeeds, and then qgroup_rescan_init()
> fails.  That means that "ret" is non-zero and "trans" is non-NULL and it
> leads to a use after free inside the btrfs_end_transaction() macro.
> 
> Fixes: 340f1aa27f36 ("btrfs: qgroups: Move transaction management inside btrfs_quota_enable/disable")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
