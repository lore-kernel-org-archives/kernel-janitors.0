From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 20 Feb 2019 21:43:45 +0000
Subject: Re: [PATCH -next] mm: fix set but not used warning
Message-Id: <20190220134345.e39094996c111be4ffa0c976@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218135743.131904-1-yuehaibing@huawei.com>
        <7425c8905127ddd078500d4c14a2147bd00422a0.camel@hpe.com>
In-Reply-To: <7425c8905127ddd078500d4c14a2147bd00422a0.camel@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kani, Toshi" <toshi.kani@hpe.com>
Cc: "yuehaibing@huawei.com" <yuehaibing@huawei.com>, "cpandya@codeaurora.org" <cpandya@codeaurora.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, 19 Feb 2019 18:28:30 +0000 "Kani, Toshi" <toshi.kani@hpe.com> wrote:

> On Mon, 2019-02-18 at 13:57 +0000, YueHaibing wrote:
> > Fixes gcc '-Wunused-but-set-variable' warning:
> > 
> > lib/ioremap.c: In function 'ioremap_page_range':
> > lib/ioremap.c:203:16: warning:
> >  variable 'start' set but not used [-Wunused-but-set-variable]
> > 
> > flush_cache_vmap may no need param, so add __maybe_unused fix this warning.
> 
> I think flush_cache_vmap should have a proper prototype with
> __maybe_unused for its args.  But, there are so many arch-specific
> definitions at glace, and I am not sure how manageable such change is,
> though...

This is one of the reasons why things like flush_cache_vmap() should
be implemented as static inline C functions, not as macros.  
