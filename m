From: David Sterba <dsterba@suse.cz>
Date: Thu, 28 Mar 2019 14:27:07 +0000
Subject: Re: [PATCH -next] btrfs: remove set but not used variable 'fs_devices'
Message-Id: <20190328142707.GK29086@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190327032024.63906-1-yuehaibing@huawei.com>
In-Reply-To: <20190327032024.63906-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 27, 2019 at 03:20:24AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/btrfs/volumes.c: In function 'btrfs_grow_device':
> fs/btrfs/volumes.c:2824:27: warning:
>  variable 'fs_devices' set but not used [-Wunused-but-set-variable]
> 
> It's not used after 6f32a50a232b ("btrfs: combine device update operations
> during transaction commit")

Thanks, there's another iteration of the patchset in the malinglist so
I'll fold the change there.
