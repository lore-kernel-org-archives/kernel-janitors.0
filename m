From: David Sterba <dsterba@suse.cz>
Date: Wed, 12 Apr 2017 13:36:05 +0000
Subject: Re: [PATCH] Btrfs: remove some dead code
Message-Id: <20170412133605.GJ4781@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170411085715.GA24157@mwanda>
In-Reply-To: <20170411085715.GA24157@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 11, 2017 at 11:57:15AM +0300, Dan Carpenter wrote:
> btrfs_get_extent() never returns NULL pointers, so this code introduces
> a static checker warning.
> 
> The btrfs_get_extent() is a bit complex, but trust me that it doesn't
> return NULLs and also if it did we would trigger the BUG_ON(!em) before
> the last return statement.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Added to 4.12, thanks. I've updated the subject line so it reflects what
the patch does.
