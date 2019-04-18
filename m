From: David Sterba <dsterba@suse.cz>
Date: Thu, 18 Apr 2019 13:43:05 +0000
Subject: Re: [PATCH -next] btrfs: Remove set but not used variable 'fs_info'
Message-Id: <20190418134304.GN20156@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418064356.10418-1-yuehaibing@huawei.com>
In-Reply-To: <20190418064356.10418-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 18, 2019 at 06:43:56AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/btrfs/free-space-tree.c: In function 'load_free_space_tree':
> fs/btrfs/free-space-tree.c:1535:24: warning:
>  variable 'fs_info' set but not used [-Wunused-but-set-variable]
> 
> It's not used since commit 05e9d3137d47 ("btrfs: get fs_info from block group
> in search_free_space_info"),  so can be removed.

Thanks, as this is in a development branch I'll fold the change to the
patch that introduced it.
