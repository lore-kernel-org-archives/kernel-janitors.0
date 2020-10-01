From: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 01 Oct 2020 08:17:43 +0000
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
Message-Id: <877dsagy1k.fsf@nanos.tec.linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com> <20200929071211.GJ2628@hirez.programming.kicks-ass.net> <20200929083709.GC2651@hirez.programming.kicks-ass.net> <87eemji887.fsf@nanos.tec.linutronix.de> <20200930170316.GB2628@hirez.programming.kicks-ass.net> <87blhni1pg.fsf@nanos.tec.linutronix.de> <20200930183552.GG2628@hirez.programming.kicks-ass.net> <87k0wbgd2s.fsf@nanos.tec.linutronix.de> <19f57cbe-ba33-17d5-440c-2765e670782f@amazon.com> <044e9835-f4fe-6670-90df-15fe376ecadd@amazon.com>
In-Reply-To: <044e9835-f4fe-6670-90df-15fe376ecadd@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Singh, Balbir" <sblbir@amazon.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>

On Thu, Oct 01 2020 at 10:48, Balbir Singh wrote:
> On 1/10/20 9:49 am, Singh, Balbir wrote:
>>  
>> +static void l1d_flush_kill(struct callback_head *ch)
>> +{
>> +	clear_ti_thread_flag(&current->thread_info, TIF_SPEC_L1D_FLUSH);
>> +	force_signal(SIGBUS);
>> +}
>> +
>>  void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>>  	       struct task_struct *tsk)
>>  {
>> @@ -443,12 +438,14 @@ static void cond_mitigation(struct task_struct *next)
>>  	}
>>  
>>  	/*
>> -	 * Flush only if SMT is disabled as per the contract, which is checked
>> -	 * when the feature is enabled.
>> +	 * Flush only if SMT is disabled, if flushing is enabled
>> +	 * and we are on an SMT enabled core, kill the task
>>  	 */
>> -	if (sched_smt_active() && !this_cpu_read(cpu_info.smt_active) &&
>> -		(prev_mm & LAST_USER_MM_L1D_FLUSH))
>> -		l1d_flush_hw();
>> +	if (unlikely(prev_mm & LAST_USER_MM_L1D_FLUSH)) {
>> +		if (!this_cpu_read(cpu_info.smt_active))
>> +			l1d_flush_hw();
>> +		else
>> +			task_work_add(prev, l1d_flush_kill, true);
>
> We have no access the to the previous task and mm->owner depends on MEMCG :)
> We can do the magic in mm_mangle_tif_spec_bits(), I suppose

No, because we don't have access to prev task there either. Interesting
problem to solve.

Thanks,

        tglx
