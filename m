From: Andreas Gruenbacher <agruen@suse.de>
Date: Tue, 20 Jul 2010 16:34:46 +0000
Subject: Re: [PATCH] fix return value for mb_cache_shrink_fn when nr_to_scan > 0
Message-Id: <201007201834.46593.agruen@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C425273.5000702@gmail.com> <201007192039.06670.agruen@suse.de> <4C45BD34.8030905@redhat.com>
In-Reply-To: <4C45BD34.8030905@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Sandeen <sandeen@redhat.com>, Wang Sheng-Hui <crosslonelyover@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-mm@kvack.org, linux-ext4 <linux-ext4@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Tuesday 20 July 2010 17:13:56 Eric Sandeen wrote:
> I think the logic in the mbcache shrinker is fine.

Indeed yes, I got confused, sorry.

On Sunday 18 July 2010 08:36:59 Wang Sheng-Hui wrote:
> I regenerated the patch. Please check it.

Sheng-Hui, the mb_cache_lru_list list is now accessed without holding 
mb_cache_spinlock.

Thanks,
Andreas
