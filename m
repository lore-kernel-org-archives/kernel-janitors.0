From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 19 Mar 2018 08:35:30 +0000
Subject: Re: [PATCH] perf/x86/intel: Don't accidentally clear high bits in bdw_limit_period()
Message-Id: <20180319083530.GE4043@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180317115216.GB4035@mwanda>
In-Reply-To: <20180317115216.GB4035@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Mar 17, 2018 at 02:52:16PM +0300, Dan Carpenter wrote:
> We intended to clear the lowest 6 bits but because of a type bug we
> clear the high 32 bits as well.  Andi says that periods are rarely more
> than U32_MAX so this bug probably doesn't have a huge runtime impact.

Thanks Dan!
