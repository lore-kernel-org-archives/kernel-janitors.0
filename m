From: shenghui <crosslonelyover@gmail.com>
Date: Sun, 18 Jul 2010 13:59:39 +0000
Subject: Re: [PATCH 2/2] turn BUG_ON for out of bound in mb_cache_entry_find_first/mb_cache_entry_find_next
Message-Id: <AANLkTimM-qRBHxs31AR0xinyvlPpA_Q7qJYGf3G74vgS@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C43083E.6020201@gmail.com>
In-Reply-To: <4C43083E.6020201@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-mm@kvack.org, linux-ext4 <linux-ext4@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

在 2010年7月18日 下午9:57，Wang Sheng-Hui <crosslonelyover@gmail.com> 写道：
> In mb_cache_entry_find_first/mb_cache_entry_find_next, macro
> mb_assert is used to do assertion on index, but it just prints
> KERN_ERR info if defined.
> Currently, only ext2/ext3/ext4 use the function with index set 0.
> But for potential usage by other subsystems, I think we shoud report BUG
> if we got some index out of bound here.
>
>
> Following patch is against 2.6.35-rc3, and should be
> applied after the first patch.Please check it.
>

Sorry, made a typo. It's against 2.6.35-rc5.

-- 


Thanks and Best Regards,
shenghui
