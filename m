From: Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 30 Sep 2020 18:00:59 +0000
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
Message-Id: <87blhni1pg.fsf@nanos.tec.linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com> <20200929071211.GJ2628@hirez.programming.kicks-ass.net> <20200929083709.GC2651@hirez.programming.kicks-ass.net> <87eemji887.fsf@nanos.tec.linutronix.de> <20200930170316.GB2628@hirez.programming.kicks-ass.net>
In-Reply-To: <20200930170316.GB2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Balbir Singh <sblbir@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On Wed, Sep 30 2020 at 19:03, Peter Zijlstra wrote:
> On Wed, Sep 30, 2020 at 05:40:08PM +0200, Thomas Gleixner wrote:
> Also, that preempt_disable() in there doesn't actually do anything.
> Worse, preempt_disable(); for_each_cpu(); is an anti-pattern. It mixes
> static_cpu_has() and boot_cpu_has() in the same bloody condition and has
> a pointless ret variable.

I absolutely agree and I really missed it when looking at it before
merging. cpus_read_lock()/unlock() is the right thing to do if at all.

> It's shoddy code, that only works if you align the planets right. We
> really shouldn't provide interfaces that are this bad.
>
> It's correct operation is only by accident.

True :(

I understand Balbirs problem and it makes some sense to provide a
solution. We can:

    1) reject set_affinity() if the task has that flush muck enabled
       and user space tries to move it to a SMT enabled core

    2) disable the muck if if detects that it is runs on a SMT enabled
       core suddenly (hotplug says hello)

       This one is nasty because there is no feedback to user space
       about the wreckage.

Thanks,

        tglx
