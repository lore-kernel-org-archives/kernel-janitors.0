From: Mel Gorman <mgorman@techsingularity.net>
Date: Wed, 09 Jan 2019 10:15:51 +0000
Subject: Re: [PATCH -next] mm, compaction: remove set but not used variables 'a, b, c'
Message-Id: <20190109101551.GR31517@techsingularity.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547002967-6127-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1547002967-6127-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 09, 2019 at 03:02:47AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> mm/compaction.c: In function 'compact_zone':
> mm/compaction.c:2063:22: warning:
>  variable 'c' set but not used [-Wunused-but-set-variable]
> mm/compaction.c:2063:19: warning:
>  variable 'b' set but not used [-Wunused-but-set-variable]
> mm/compaction.c:2063:16: warning:
>  variable 'a' set but not used [-Wunused-but-set-variable]
> 
> This never used since 94d5992baaa5 ("mm, compaction: finish pageblock
> scanning on contention")
> 

Dang. This is left-over debugging code that got accidentally merged
during a rebase.  Andrew, can you pick this up as a fix to the mmotm
patch mm-compaction-finish-pageblock-scanning-on-contention.patch please?

Thanks YueHaibing.

-- 
Mel Gorman
SUSE Labs
