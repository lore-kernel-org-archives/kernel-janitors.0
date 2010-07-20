From: shenghui <crosslonelyover@gmail.com>
Date: Tue, 20 Jul 2010 01:04:46 +0000
Subject: Re: [PATCH] fix return value for mb_cache_shrink_fn when nr_to_scan >
Message-Id: <AANLkTimBCrq8cPJrTSKiG_wbd1ppu0twTAMXeezJEZs3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C425273.5000702@gmail.com>
	<20100718060106.GA579@infradead.org>
	<4C42A10B.2080904@gmail.com>
	<201007192039.06670.agruen@suse.de>
	<AANLkTimh4UjM3LWPjBjMA5UGecQYyPSxIvJBInijAP-j@mail.gmail.com>
In-Reply-To: <AANLkTimh4UjM3LWPjBjMA5UGecQYyPSxIvJBInijAP-j@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andreas Gruenbacher <agruen@suse.de>
Cc: Christoph Hellwig <hch@infradead.org>, Eric Sandeen <sandeen@redhat.com>, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-mm@kvack.org, linux-ext4 <linux-ext4@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

2010/7/20 shenghui <crosslonelyover@gmail.com>:
> 2010/7/20 Andreas Gruenbacher <agruen@suse.de>:
>
> Sorry, I haven't found any special attention on
> sysctl_vfs_cache_pressure = 0 case or scale
> nr_to_scan in fs/dcache.c
>
>  900static int shrink_dcache_memory(int nr, gfp_t gfp_mask)
>  901{
>  902        if (nr) {
>  903                if (!(gfp_mask & __GFP_FS))
>  904                        return -1;
>  905                prune_dcache(nr);
>  906        }
>  907        return (dentry_stat.nr_unused / 100) * sysctl_vfs_cache_pressure;
>  908}
>

And for sysctl_vfs_cache_pressure = 0 case, it's
enough to return 0 to indicate no cache entries left.



-- 


Thanks and Best Regards,
shenghui
