From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 07 Apr 2008 12:43:01 +0000
Subject: Re: trying to avoid "#ifdef CONFIG_NUMA"?
Message-Id: <20080407124301.GG16451@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0804070741520.23945@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0804070741520.23945@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 07, 2008 at 07:45:01AM -0400, Robert P. J. Day wrote:
> /* This helps us to avoid #ifdef CONFIG_NUMA */
> #ifdef CONFIG_NUMA
> #define NUMA_BUILD 1
> #else
> #define NUMA_BUILD 0
> #endif

> mm/page_alloc.c:                if (NUMA_BUILD && zlc_active &&
> 
>   not a lot of avoiding going on there, i'd say.

but it's important where it happens.  it would uglify the code
significantly to replace the if (NUMA_BUILD) with #ifdef CONFIG_NUMA.
Maybe NUMA_BUILD should be used in more places, but how about doing
something useful instead?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
