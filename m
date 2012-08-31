From: Josef Bacik <jbacik@fusionio.com>
Date: Fri, 31 Aug 2012 15:01:40 +0000
Subject: Re: [josef-btrfs:master 29/29] fs/btrfs/backref.c:1586:2: error: implicit declaration of function 'v
Message-Id: <20120831150140.GA4299@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5040ce74.VuqXa16Lv90yevGM%fengguang.wu@intel.com>
In-Reply-To: <5040ce74.VuqXa16Lv90yevGM%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Liu Bo <bo.li.liu@oracle.com>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, Josef Bacik <JBacik@fusionio.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Aug 31, 2012 at 08:47:16AM -0600, Fengguang Wu wrote:
> Hi Liu,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git master
> head:   8ccfefeea39d6ee32ad312b1fd3b8eeb19de9265
> commit: 8ccfefeea39d6ee32ad312b1fd3b8eeb19de9265 [29/29] Btrfs: use larger limit for translation of logical to inode
> config: x86_64-randconfig-h842 (attached as .config)
> 
> All related error/warning messages:
> 
> fs/btrfs/backref.c: In function 'init_data_container':
> fs/btrfs/backref.c:1586:2: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
> fs/btrfs/backref.c:1586:7: warning: assignment makes pointer from integer without a cast [enabled by default]
> cc1: some warnings being treated as errors
> 
> vim +1586 fs/btrfs/backref.c
>   1583		size_t alloc_bytes;
>   1584	
>   1585		alloc_bytes = max_t(size_t, total_bytes, sizeof(*data));
> > 1586		data = vmalloc(alloc_bytes);
>   1587		if (!data)
>   1588			return ERR_PTR(-ENOMEM);
>   1589	
>

Good lord Fengguang I just pushed that out 45 minutes ago.  I will fix and push
it out, thanks!

Josef
