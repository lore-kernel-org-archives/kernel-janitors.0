From: Andreas Gruenbacher <agruen@suse.de>
Date: Mon, 19 Jul 2010 18:39:06 +0000
Subject: Re: [PATCH] fix return value for mb_cache_shrink_fn when nr_to_scan > 0
Message-Id: <201007192039.06670.agruen@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C425273.5000702@gmail.com> <20100718060106.GA579@infradead.org> <4C42A10B.2080904@gmail.com>
In-Reply-To: <4C42A10B.2080904@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang Sheng-Hui <crosslonelyover@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Eric Sandeen <sandeen@redhat.com>, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-mm@kvack.org, linux-ext4 <linux-ext4@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Sunday 18 July 2010 08:36:59 Wang Sheng-Hui wrote:
> I regenerated the patch. Please check it.

The logic for calculating how many objects to free is still wrong: 
mb_cache_shrink_fn returns the number of entries scaled by 
sysctl_vfs_cache_pressure / 100.  It should also scale nr_to_scan by the 
inverse of that.  The sysctl_vfs_cache_pressure = 0 case (never scale) may 
require special attention.

See dcache_shrinker() in fs/dcache.c.

Thanks,
Andreas
