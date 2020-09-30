From: Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 30 Sep 2020 15:40:08 +0000
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
Message-Id: <87eemji887.fsf@nanos.tec.linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com> <20200929071211.GJ2628@hirez.programming.kicks-ass.net> <20200929083709.GC2651@hirez.programming.kicks-ass.net>
In-Reply-To: <20200929083709.GC2651@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Balbir Singh <sblbir@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On Tue, Sep 29 2020 at 10:37, Peter Zijlstra wrote:
> Here, I fixed it..

Well, no. What Balbir is trying to do here is to establish whether a
task runs on a !SMT core. sched_smt_active() is system wide, but their
setup is to have a bunch of SMT enabled cores and cores where SMT is off
because the sibling is offlined. They affine these processes to non SMT
cores and the check there validates that before it enabled that flush
thingy.

Of course this is best effort voodoo because if all CPUs in the mask are
offlined then the task is moved to a SMT enabled one where L1D flush is
useless. Though offlining their workhorse CPUs is probably not the daily
business for obvious raisins.

Thanks,

        tglx
