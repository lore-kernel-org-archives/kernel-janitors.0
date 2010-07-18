From: shenghui <crosslonelyover@gmail.com>
Date: Sun, 18 Jul 2010 13:58:59 +0000
Subject: Re: [PATCH 1/2 RESEND] fix return value for mb_cache_shrink_fn when
Message-Id: <AANLkTilV_RalPPhHCk9D7p7AvV5WWOgCIPfc4Orn37Xo@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C430830.9020903@gmail.com>
In-Reply-To: <4C430830.9020903@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-mm@kvack.org, linux-ext4 <linux-ext4@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Christoph

在 2010年7月18日 下午9:57，Wang Sheng-Hui <crosslonelyover@gmail.com> 写道：
> Sorry to resend this patch. For the 2nd patch should
> be applied after this patch, I just send them together.
>
> Following is the explanation of the patch:
> The comment for struct shrinker in include/linux/mm.h says
> "shrink...It should return the number of objects which remain in the
> cache."
> Please notice the word "remain".
>
> In fs/mbcache.h, mb_cache_shrink_fn is used as the shrink function:
>       static struct shrinker mb_cache_shrinker = {
>               .shrink = mb_cache_shrink_fn,
>               .seeks = DEFAULT_SEEKS,
>       };
> In mb_cache_shrink_fn, the return value for nr_to_scan > 0 is the
> number of mb_cache_entry before shrink operation. It may because the
> memory usage for mbcache is low, so the effect is not so obvious.
>
> Per Eric Sandeen, we should do the counting only once.
> Per Christoph Hellwig, we should use list_for_each_entry instead of
> list_for_each here.
>
> Following patch is against 2.6.35-rc4. Please check it.
>
>

Sorry, made a typo. It's against 2.6.35-rc5.

-- 


Thanks and Best Regards,
shenghui
