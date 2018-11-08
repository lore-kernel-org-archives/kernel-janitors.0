From: David Sterba <dsterba@suse.cz>
Date: Thu, 08 Nov 2018 12:11:59 +0000
Subject: Re: [PATCH -next] btrfs: remove set but not used variable 'tree'
Message-Id: <20181108121159.GH24115@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541643283-109411-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541643283-109411-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 08, 2018 at 02:14:43AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/btrfs/extent_io.c: In function 'end_extent_writepage':
> fs/btrfs/extent_io.c:2406:25: warning:
>  variable 'tree' set but not used [-Wunused-but-set-variable]
> 
> It not used any more after
> commit 2922040236f9 ("btrfs: Remove extent_io_ops::writepage_end_io_hook")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks, the patches are still out of mainline so the commit id is not
stable and I can fold in the fixup. Same for the other one.
