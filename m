From: David Sterba <dsterba@suse.cz>
Date: Fri, 22 Feb 2019 14:39:07 +0000
Subject: Re: [PATCH v2 -next] btrfs: Remove unnecessary casts in btrfs_read_root_item
Message-Id: <20190222143907.GD9874@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220030840.188854-1-yuehaibing@huawei.com>
 <20190220123202.43256-1-yuehaibing@huawei.com>
In-Reply-To: <20190220123202.43256-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Feb 20, 2019 at 12:32:02PM +0000, YueHaibing wrote:
> There is a messy cast here:
> 	min_t(int, len, (int)sizeof(*item)));
> 
> min_t() should normally cast to unsigned.  It's not possible for
> "len" to be negative, but if it were then we definitely
> wouldn't want to pass negatives to read_extent_buffer().  Also there
> is an extra cast.
> 
> This patch shouldn't affect runtime, it's just a clean up.
> 
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
