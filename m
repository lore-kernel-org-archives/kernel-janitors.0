From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 01 Oct 2020 08:19:58 +0000
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
Message-Id: <20201001081958.GO2628@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com>
 <20200929071211.GJ2628@hirez.programming.kicks-ass.net>
 <20200929083709.GC2651@hirez.programming.kicks-ass.net>
 <87eemji887.fsf@nanos.tec.linutronix.de>
 <20200930170316.GB2628@hirez.programming.kicks-ass.net>
 <87blhni1pg.fsf@nanos.tec.linutronix.de>
 <20200930183552.GG2628@hirez.programming.kicks-ass.net>
 <87k0wbgd2s.fsf@nanos.tec.linutronix.de>
 <19f57cbe-ba33-17d5-440c-2765e670782f@amazon.com>
In-Reply-To: <19f57cbe-ba33-17d5-440c-2765e670782f@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Singh, Balbir" <sblbir@amazon.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>


Your MUA is having trouble wrapping text at 78 chars.

On Thu, Oct 01, 2020 at 09:49:30AM +1000, Singh, Balbir wrote:

> So this is the change I am playing with, I don't like the idea of
> killing the task, but it's better than silently not flushing, I guess
> system administrators will learn with time not to correctly the
> affinity of tasks flushing L1D. For the affinity bits, not being able
> to change the affinity is better, but not being able to provide
> feedback on as to why is a bit weird as well, but I wonder if there
> are other cases where we might want to lock the affinity of a task for
> it's lifetime.

You can't really do that, hot-unplug can (and will) destroy any affinity
setting, and if the task/admin wants to recover it needs to be able to
re-set affinity after that.
