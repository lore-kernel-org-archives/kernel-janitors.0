From: Shaohua Li <shli@kernel.org>
Date: Fri, 14 Sep 2012 00:58:23 +0000
Subject: Re: [memcg:since-3.5 123/137] mm/internal.h:380:3: error: implicit declaration of function 'atomic_d
Message-Id: <20120914005823.GA355@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120913170126.GB4127@localhost>
In-Reply-To: <20120913170126.GB4127@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 14, 2012 at 01:01:26AM +0800, Fengguang Wu wrote:
> Hi Shaohua,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-3.5
> head:   d64f22e5761b1e367ba5d1e04d2fe5e0283aecbc
> commit: cfb0997213ba955c7239735affdfd20fefc2dbba [123/137] swap: add a simple detector for inappropriate swapin readahead
> config: m32r-mappi3.smp_defconfig
> 
> All related error/warning messages:
> 
> In file included from mm/filemap.c:36:0:
> mm/internal.h: In function 'swap_cache_hit':
> mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

A fix is in akpm's tree now. Thanks for the reporting.
