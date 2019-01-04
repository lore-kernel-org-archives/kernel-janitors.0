From: David Sterba <dsterba@suse.cz>
Date: Fri, 04 Jan 2019 15:51:17 +0000
Subject: Re: [PATCH -next] btrfs: remove set but not used variable 'num_pages'
Message-Id: <20190104155117.GS23615@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544855467-154115-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544855467-154115-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Dec 15, 2018 at 06:31:07AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/btrfs/ioctl.c: In function 'btrfs_extent_same':
> fs/btrfs/ioctl.c:3260:6: warning:
>  variable 'num_pages' set but not used [-Wunused-but-set-variable]
> 
> It not used any more since commit 9ee8234e6220 ("Btrfs: use
> generic_remap_file_range_prep() for cloning and deduplication")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Added to patch queue, thanks.
