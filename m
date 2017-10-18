From: David Sterba <dsterba@suse.cz>
Date: Wed, 18 Oct 2017 12:33:44 +0000
Subject: Re: [PATCH] Btrfs: ref-verify: Fix NULL vs IS_ERR() check in walk_down_tree()
Message-Id: <20171018123343.GG3521@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171018073635.cajusx7hzkg4ghgc@mwanda>
In-Reply-To: <20171018073635.cajusx7hzkg4ghgc@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org

On Wed, Oct 18, 2017 at 10:36:35AM +0300, Dan Carpenter wrote:
> read_tree_block() returns error pointers, and never NULL and so I have
> updated the error handling.
> 
> Fixes: 74739121b4c7 ("Btrfs: add a extent ref verify tool")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, I've folded the fix into the original commit and added credits.
