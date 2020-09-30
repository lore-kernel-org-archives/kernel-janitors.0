From: "Singh, Balbir" <sblbir@amazon.com>
Date: Wed, 30 Sep 2020 22:46:29 +0000
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
Message-Id: <7785b27b-1a88-c7f0-ae47-f4f75876cb83@amazon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com>
 <20200929071211.GJ2628@hirez.programming.kicks-ass.net>
 <20200929083709.GC2651@hirez.programming.kicks-ass.net>
 <87eemji887.fsf@nanos.tec.linutronix.de>
 <20200930170316.GB2628@hirez.programming.kicks-ass.net>
 <87blhni1pg.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87blhni1pg.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>

On 1/10/20 4:00 am, Thomas Gleixner wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On Wed, Sep 30 2020 at 19:03, Peter Zijlstra wrote:
>> On Wed, Sep 30, 2020 at 05:40:08PM +0200, Thomas Gleixner wrote:
>> Also, that preempt_disable() in there doesn't actually do anything.
>> Worse, preempt_disable(); for_each_cpu(); is an anti-pattern. It mixes
>> static_cpu_has() and boot_cpu_has() in the same bloody condition and has
>> a pointless ret variable.
> 

I was being a bit crazy in mixing the two, considering that there might
be CPUs that do not support L1D flush (others might in the same system,
which is insane)

> I absolutely agree and I really missed it when looking at it before
> merging. cpus_read_lock()/unlock() is the right thing to do if at all.
> 

It seems like the right thing to do, get_cpu() used to be the old method.
The idea is to use cpu_data(i) in a hotplug safe manner.

>> It's shoddy code, that only works if you align the planets right. We
>> really shouldn't provide interfaces that are this bad.
>>
>> It's correct operation is only by accident.



> 
> True :(
> 
> I understand Balbirs problem and it makes some sense to provide a
> solution. We can:
> 
>     1) reject set_affinity() if the task has that flush muck enabled
>        and user space tries to move it to a SMT enabled core

I thought of this and it would be difficult to debug for users, taskset -c
would not work on applications that flush, etc, etc.

> 
>     2) disable the muck if if detects that it is runs on a SMT enabled
>        core suddenly (hotplug says hello)
> 
>        This one is nasty because there is no feedback to user space
>        about the wreckage.

Yes, agreed.

> 

Trying to look at the concerns, I wonder if this can still be saved

-       if (!boot_cpu_has_bug(X86_BUG_L1TF) ||
-                       !static_cpu_has(X86_FEATURE_FLUSH_L1D))
+       if (!static_cpu_has(X86_BUG_L1TF) ||
+               !static_cpu_has(X86_FEATURE_FLUSH_L1D))
                return -EINVAL;

-       cpu = get_cpu();

+       cpus_read_lock();
        for_each_cpu(i, &tsk->cpus_mask) {
                if (cpu_data(i).smt_active = true) {
-                       put_cpu();
+                       cpus_read_unlock();
                        return -EINVAL;
                }
        }
+       cpus_read_unlock();

        set_ti_thread_flag(&tsk->thread_info, TIF_SPEC_L1D_FLUSH);
-       put_cpu();
        return ret;
 }

I don't like the idea of iterating CPUs in the cpumask to check if they
all have SMT disabled, but that is a requirement for flush

Balbir
