From: Chris Mason <clm@fb.com>
Date: Wed, 24 Jun 2015 19:26:22 +0000
Subject: Re: [patch] btrfs: delayed-ref: double free in btrfs_add_delayed_tree_ref()
Message-Id: <20150624192622.GA3920@ret.masoncoding.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150624143233.GF1702@mwanda>
In-Reply-To: <20150624143233.GF1702@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Qu Wenruo <quwenruo@cn.fujitsu.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.cz>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 24, 2015 at 05:32:33PM +0300, Dan Carpenter wrote:
> There is a cut and paste error so instead of freeing "head_ref", we free
> "ref" twice.
> 
> Fixes: 3368d001ba5d ('btrfs: qgroup: Record possible quota-related extent for qgroup.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan!  Queued.

-chris
