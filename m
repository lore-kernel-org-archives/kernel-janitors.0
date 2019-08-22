From: David Sterba <dsterba@suse.cz>
Date: Thu, 22 Aug 2019 14:14:26 +0000
Subject: Re: [PATCH] Btrfs: Fix an assert statement in __btrfs_map_block()
Message-Id: <20190822141426.GG2752@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809140739.GA3552@mwanda>
In-Reply-To: <20190809140739.GA3552@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Nikolay Borisov <nborisov@suse.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 09, 2019 at 05:07:39PM +0300, Dan Carpenter wrote:
> The btrfs_get_chunk_map() never returns NULL, it returns error pointers.
> 
> Fixes: 89b798ad1b42 ("btrfs: Use btrfs_get_io_geometry appropriately")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued for 5.3, thanks.
