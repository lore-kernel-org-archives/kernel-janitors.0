From: Jason Vas Dias <jason.vas.dias@gmail.com>
Date: Wed, 22 Feb 2017 17:27:01 +0000
Subject: Re: [PATCH] arch/x86/kernel/tsc.c : set X86_FEATURE_ART for TSC on CPUs like i7-4910MQ : bug #194609
Message-Id: <CALyZvKyTGOmXC9DxcS-UR-STSwtJONMQA6srtZAaiLURcOxqvA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALyZvKyAH8xfj_j2Vh_z2BOgYJeP73LvFwhvQ26-Kyfthdtwiw@mail.gmail.com>
 <CALyZvKwVDP8bTDdteYZT01GJGDd0d+hQ7oib-oXj+DarNHMWnQ@mail.gmail.com>
 <alpine.DEB.2.20.1702201239330.4208@nanos> <CALyZvKxhvGjRou4FcEvvbwPxPzAxpe8Shn=53DUx6WYWqEGSrA@mail.gmail.com>
 <CALyZvKyThHz12B7ViO8wyqeVB+mknBQGi=k7+TRUX-mCjkATtA@mail.gmail.com> <CALyZvKz_WpnDCPTy=DobayTTj-3gTUZ=TCv25i3Hb9AcYKa14w@mail.gmail.com>
In-Reply-To: <CALyZvKz_WpnDCPTy=DobayTTj-3gTUZ=TCv25i3Hb9AcYKa14w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Prarit Bhargava <prarit@redhat.com>, x86@kernel.org

Yes, my CPU is still getting a fault every time the TSC_ADJUST MSR is
read or written . It is probably because it genuinuely does not
support any cpuid > 13 ,
or the modern TSC_ADJUST interface . This is probably why my clock_gettime()
latencies are so bad. Now I have to develop a patch to disable all access to
TSC_ADJUST MSR if boot_cpu_data.cpuid_level <= 13 .
I really have an unlucky CPU :-) .

But really, I think this issue goes deeper into the fundamental limits of
time measurement on Linux : it is never going to be possible to measure
minimum times with clock_gettime() comparable with those returned by
rdtscp instruction - the time taken to enter the kernel through the VDSO,
queue an access to vsyscall_gtod_data via a workqueue, access it & do
computations & copy value to user-space is NEVER going to be up to the
job of measuring small real-time durations of the order of 10-20 TSC ticks .

I think the best way to solve this problem going forward would be to store
the entire vsyscall_gtod_data  data structure representing the current
clocksource
in a shared page which is memory-mappable (read-only) by user-space .
I think sser-space programs should be able to do something like :
    int fd = open("/sys/devices/system/clocksource/clocksource0/gtod.page",O_RDONLY);
    size_t psz = getpagesize();
    void *gtod = mmap( 0, psz, PROT_READ, MAP_PRIVATE, fd, 0 );
    msync(gtod,psz,MS_SYNC);

Then they could all read the real-time clock values as they are updated
in real-time by the kernel, and know exactly how to interpret them .

I also think that all mktime() / gmtime() / localtime() timezone handling
functionality should be
moved to user-space, and that the kernel should actually load and link in some
/lib/libtzdata.so
library, provided by glibc / libc implementations, that is exactly the
same library
used by glibc() code to parse tzdata ; tzdata should be loaded at boot time
by the kernel from the same places glibc loads it, and both the kernel and
glibc should use identical mktime(), gmtime(), etc. functions to access it, and
glibc using code would not need to enter the kernel at all for any time-handling
code. This tzdata-library code be automatically loaded into process images the
same way the vdso region is , and the whole system could access only one
copy of it and the 'gtod.page' in memory.

That's just my two-cents worth, and how I'd like to eventually get
things working
on my system.

All the best, Regards,
Jason













On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
> On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>> RE:
>>>> 4.10 has  new code which utilizes the TSC_ADJUST MSR.
>>
>> I just built an unpatched linux v4.10 with tglx's TSC improvements -
>> much else improved in this kernel (like iwlwifi) - thanks!
>>
>> I have attached an updated version of the test program which
>> doesn't print the bogus "Nominal TSC Frequency" (the previous
>> version printed it, but equally ignored it).
>>
>> The clock_gettime(CLOCK_MONOTONIC_RAW,&ts) latency has improved by
>> a factor of 2 - it used to be @140ns and is now @ 70ns  ! Wow!  :
>>
>> $ uname -r
>> 4.10.0
>> $ ./ttsc1
>> max_extended_leaf: 80000008
>> has tsc: 1 constant: 1
>> Invariant TSC is enabled: Actual TSC freq: 2.893299GHz.
>> ts2 - ts1: 144 ts3 - ts2: 96 ns1: 0.000000588 ns2: 0.000002599
>> ts3 - ts2: 178 ns1: 0.000000592
>> ts3 - ts2: 14 ns1: 0.000000577
>> ts3 - ts2: 14 ns1: 0.000000651
>> ts3 - ts2: 17 ns1: 0.000000625
>> ts3 - ts2: 17 ns1: 0.000000677
>> ts3 - ts2: 17 ns1: 0.000000626
>> ts3 - ts2: 17 ns1: 0.000000627
>> ts3 - ts2: 17 ns1: 0.000000627
>> ts3 - ts2: 18 ns1: 0.000000655
>> ts3 - ts2: 17 ns1: 0.000000631
>> t1 - t0: 89067 - ns2: 0.000091411
>>
>
>
> Oops, going blind in my old age. These latencies are actually 3 times
> greater than under 4.8 !!
>
> Under 4.8, the program printed latencies of @ 140ns for clock_gettime, as
> shown
> in bug 194609 as the 'ns1' (timespec_b - timespec_a) value::
>
> ts3 - ts2: 24 ns1: 0.000000162
> ts3 - ts2: 17 ns1: 0.000000143
> ts3 - ts2: 17 ns1: 0.000000146
> ts3 - ts2: 17 ns1: 0.000000149
> ts3 - ts2: 17 ns1: 0.000000141
> ts3 - ts2: 16 ns1: 0.000000142
>
> now the clock_gettime(CLOCK_MONOTONIC_RAW,&ts) latency is @
> 600ns, @ 4 times more than under 4.8 .
> But I'm glad the TSC_ADJUST problems are fixed.
>
> Will programs reading :
>  $ cat /sys/devices/msr/events/tsc
>  event=0x00
> read a new event for each setting of the TSC_ADJUST MSR or a wrmsr on the
> TSC ?
>
>> I think this is because under Linux 4.8, the CPU got a fault every
>> time it read the TSC_ADJUST MSR.
>
> maybe it still is!
>
>
>> But user programs wanting to use the TSC  and correlate its value to
>> clock_gettime(CLOCK_MONOTONIC_RAW) values accurately like the above
>> program still have to  dig the TSC frequency value out of the kernel
>> with objdump  - this was really the point of the bug #194609.
>>
>> I would still like to investigate exporting 'tsc_khz' & 'mult' +
>> 'shift' values via sysfs.
>>
>> Regards,
>> Jason.
>>
>>
>>
>>
>>
>> On 21/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>>> Thank You for enlightening me -
>>>
>>> I was just having a hard time believing that Intel would ship a chip
>>> that features a monotonic, fixed frequency timestamp counter
>>> without specifying in either documentation or on-chip or in ACPI what
>>> precisely that hard-wired frequency is, but I now know that to
>>> be the case for the unfortunate i7-4910MQ - I mean, how can the CPU
>>> assert CPUID:80000007[8] ( InvariantTSC ) which it does, which is
>>> difficult to reconcile with the statement in the SDM :
>>>   17.16.4  Invariant Time-Keeping
>>>     The invariant TSC is based on the invariant timekeeping hardware
>>>     (called Always Running Timer or ART), that runs at the core crystal
>>> clock
>>>     frequency. The ratio defined by CPUID leaf 15H expresses the
>>> frequency
>>>     relationship between the ART hardware and TSC. If
>>> CPUID.15H:EBX[31:0]
>>> !>>> 0
>>>     and CPUID.80000007H:EDX[InvariantTSC] = 1, the following linearity
>>>     relationship holds between TSC and the ART hardware:
>>>     TSC_Value = (ART_Value * CPUID.15H:EBX[31:0] )
>>>                          / CPUID.15H:EAX[31:0] + K
>>>     Where 'K' is an offset that can be adjusted by a privileged agent*2.
>>>      When ART hardware is reset, both invariant TSC and K are also
>>> reset.
>>>
>>> So I'm just trying to figure out what CPUID.15H:EBX[31:0]  and
>>> CPUID.15H:EAX[31:0]  are for my hardware.  I assumed (incorrectly)
>>> that
>>> the "Nominal TSC Frequency" formulae in the manul must apply to all
>>> CPUs with InvariantTSC .
>>>
>>> Do I understand correctly , that since I do have InvariantTSC ,  the
>>> TSC_Value is in fact calculated according to the above formula, but with
>>> a "hidden" ART Value,  & Core Crystal Clock frequency & its ratio to
>>> TSC frequency ?
>>> It was obvious this nominal TSC Frequency had nothing to do with the
>>> actual TSC frequency used by Linux, which is 'tsc_khz' .
>>> I guess wishful thinking led me to believe CPUID:15h was actually
>>> supported somehow , because I thought InvariantTSC meant it had ART
>>> hardware .
>>>
>>> I do strongly suggest that Linux exports its calibrated TSC Khz
>>> somewhere to user
>>> space .
>>>
>>> I think the best long-term solution would be to allow programs to
>>> somehow read the TSC without invoking
>>> clock_gettime(CLOCK_MONOTONIC_RAW,&ts), &
>>> having to enter the kernel, which incurs an overhead of > 120ns on my
>>> system
>>> .
>>>
>>>
>>> Couldn't linux export its 'tsc_khz' and / or 'clocksource->mult' and
>>> 'clocksource->shift' values to /sysfs somehow ?
>>>
>>> For instance , only  if the 'current_clocksource' is 'tsc', then these
>>> values could be exported as:
>>> /sys/devices/system/clocksource/clocksource0/shift
>>> /sys/devices/system/clocksource/clocksource0/mult
>>> /sys/devices/system/clocksource/clocksource0/freq
>>>
>>> So user-space programs could  know that the value returned by
>>>     clock_gettime(CLOCK_MONOTONIC_RAW)
>>>   would be
>>>     {    .tv_sec =  ( ( rdtsc() * mult ) >> shift ) >> 32,
>>>       , .tv_nsec = ( ( rdtsc() * mult ) >> shift ) >> &~0U
>>>     }
>>>   and that represents ticks of period (1.0 / ( freq * 1000 )) S.
>>>
>>> That would save user-space programs from having to know 'tsc_khz' by
>>> parsing the 'Refined TSC' frequency from log files or by examining the
>>> running kernel with objdump to obtain this value & figure out 'mult' &
>>> 'shift' themselves.
>>>
>>> And why not a
>>>   /sys/devices/system/clocksource/clocksource0/value
>>> file that actually prints this ( ( rdtsc() * mult ) >> shift )
>>> expression as a long integer?
>>> And perhaps a
>>>   /sys/devices/pnp0/XX\:YY/rtc/rtc0/nanoseconds
>>> file that actually prints out the number of real-time nano-seconds since
>>> the
>>> contents of the existing
>>>   /sys/devices/pnp0/XX\:YY/rtc/rtc0/{time,since_epoch}
>>> files using the current TSC value?
>>> To read the rtc0/{date,time} files is already faster than entering the
>>> kernel to call
>>> clock_gettime(CLOCK_REALTIME, &ts) & convert to integer for scripts.
>>>
>>> I will work on developing a patch to this effect if no-one else is.
>>>
>>> Also, am I right in assuming that the maximum granularity of the
>>> real-time
>>> clock
>>> on my system is 1/64th of a second ? :
>>>  $ cat /sys/devices/pnp0/00\:02/rtc/rtc0/max_user_freq
>>>  64
>>> This is the maximum granularity that can be stored in CMOS , not
>>> returned by TSC? Couldn't we have something similar that gave an
>>> accurate idea of TSC frequency and the precise formula applied to TSC
>>> value to get clock_gettime
>>> (CLOCK_MONOTONIC_RAW) value ?
>>>
>>> Regards,
>>> Jason
>>>
>>>
>>> This code does produce good timestamps with a latency of @20ns
>>> that correlate well with clock_gettIme(CLOCK_MONOTONIC_RAW,&ts)
>>> values, but it depends on a global variable that  is initialized to
>>> the 'tsc_khz' value
>>> computed by running kernel parsed from objdump /proc/kcore output :
>>>
>>> static inline __attribute__((always_inline))
>>> U64_t
>>> IA64_tsc_now()
>>> { if(!(    _ia64_invariant_tsc_enabled
>>>       ||(( _cpu0id_fd = -1) &&
>>> IA64_invariant_tsc_is_enabled(NULL,NULL))
>>>       )
>>>     )
>>>   { fprintf(stderr, __FILE__":%d:(%s): must be called with invariant
>>> TSC enabled.\n");
>>>     return 0;
>>>   }
>>>   U32_t tsc_hi, tsc_lo;
>>>   register UL_t tsc;
>>>   asm volatile
>>>   ( "rdtscp\n\t"
>>>     "mov %%edx, %0\n\t"
>>>     "mov %%eax, %1\n\t"
>>>     "mov %%ecx, %2\n\t"
>>>   : "=m" (tsc_hi) ,
>>>     "=m" (tsc_lo) ,
>>>     "=m" (_ia64_tsc_user_cpu) :
>>>   : "%eax","%ecx","%edx"
>>>   );
>>>   tsc=(((UL_t)tsc_hi) << 32)|((UL_t)tsc_lo);
>>>   return tsc;
>>> }
>>>
>>> __thread
>>> U64_t _ia64_first_tsc = 0xffffffffffffffffUL;
>>>
>>> static inline __attribute__((always_inline))
>>> U64_t IA64_tsc_ticks_since_start()
>>> { if(_ia64_first_tsc = 0xffffffffffffffffUL)
>>>   { _ia64_first_tsc = IA64_tsc_now();
>>>     return 0;
>>>   }
>>>   return (IA64_tsc_now() - _ia64_first_tsc) ;
>>> }
>>>
>>> static inline __attribute__((always_inline))
>>> void
>>> ia64_tsc_calc_mult_shift
>>> ( register U32_t *mult,
>>>   register U32_t *shift
>>> )
>>> { /* paraphrases Linux clocksource.c's clocks_calc_mult_shift()
>>> function:
>>>    * calculates second + nanosecond mult + shift in same way linux does.
>>>    * we want to be compatible with what linux returns in struct
>>> timespec ts after call to
>>>    * clock_gettime(CLOCK_MONOTONIC_RAW, &ts).
>>>    */
>>>   const U32_t scale00U;
>>>   register U32_t from= IA64_tsc_khz();
>>>   register U32_t to  = NSEC_PER_SEC / scale;
>>>   register U64_t sec = ( ~0UL / from ) / scale;
>>>   sec = (sec > 600) ? 600 : ((sec > 0) ? sec : 1);
>>>   register U64_t maxsec = sec * scale;
>>>   UL_t tmp;
>>>   U32_t sft, sftacc2;
>>>   /*
>>>    * Calculate the shift factor which is limiting the conversion
>>>    * range:
>>>    */
>>>   tmp = (maxsec * from) >> 32;
>>>   while (tmp)
>>>   { tmp >>=1;
>>>     sftacc--;
>>>   }
>>>   /*
>>>    * Find the conversion shift/mult pair which has the best
>>>    * accuracy and fits the maxsec conversion range:
>>>    */
>>>   for (sft = 32; sft > 0; sft--)
>>>   { tmp = ((UL_t) to) << sft;
>>>     tmp += from / 2;
>>>     tmp = tmp / from;
>>>     if ((tmp >> sftacc) = 0)
>>>       break;
>>>   }
>>>   *mult = tmp;
>>>   *shift = sft;
>>> }
>>>
>>> __thread
>>> U32_t _ia64_tsc_mult = ~0U, _ia64_tsc_shift=~0U;
>>>
>>> static inline __attribute__((always_inline))
>>> U64_t IA64_s_ns_since_start()
>>> { if( ( _ia64_tsc_mult = ~0U ) || ( _ia64_tsc_shift = ~0U ) )
>>>     ia64_tsc_calc_mult_shift( &_ia64_tsc_mult, &_ia64_tsc_shift);
>>>   register U64_t cycles = IA64_tsc_ticks_since_start();
>>>   register U64_t ns = ((cycles
>>> *((UL_t)_ia64_tsc_mult))>>_ia64_tsc_shift);
>>>   return( (((ns / NSEC_PER_SEC)&0xffffffffUL) << 32) | ((ns %
>>> NSEC_PER_SEC)&0x3fffffffUL) );
>>>   /* Yes, we are purposefully ignoring durations of more than 4.2
>>> billion seconds here! */
>>> }
>>>
>>>
>>> I think Linux should export the 'tsc_khz', 'mult' and 'shift' values
>>> somehow,
>>> then user-space libraries could have more confidence in using 'rdtsc'
>>> or 'rdtscp'
>>> if Linux's current_clocksource is 'tsc'.
>>>
>>> Regards,
>>> Jason
>>>
>>>
>>>
>>> On 20/02/2017, Thomas Gleixner <tglx@linutronix.de> wrote:
>>>> On Sun, 19 Feb 2017, Jason Vas Dias wrote:
>>>>
>>>>> CPUID:15H is available in user-space, returning the integers : ( 7,
>>>>> 832, 832 ) in EAX:EBX:ECX , yet boot_cpu_data.cpuid_level is 13 , so
>>>>> in detect_art() in tsc.c,
>>>>
>>>> By some definition of available. You can feed CPUID random leaf numbers
>>>> and
>>>> it will return something, usually the value of the last valid CPUID
>>>> leaf,
>>>> which is 13 on your CPU. A similar CPU model has
>>>>
>>>> 0x0000000d 0x00: eax=0x00000007 ebx=0x00000340 ecx=0x00000340
>>>> edx=0x00000000
>>>>
>>>> i.e. 7, 832, 832, 0
>>>>
>>>> Looks familiar, right?
>>>>
>>>> You can verify that with 'cpuid -1 -r' on your machine.
>>>>
>>>>> Linux does not think ART is enabled, and does not set the synthesized
>>>>> CPUID +
>>>>> ((3*32)+10) bit, so a program looking at /dev/cpu/0/cpuid would not
>>>>> see this bit set .
>>>>
>>>> Rightfully so. This is a Haswell Core model.
>>>>
>>>>> if an e1000 NIC card had been installed, PTP would not be available.
>>>>
>>>> PTP is independent of the ART kernel feature . ART just provides
>>>> enhanced
>>>> PTP features. You are confusing things here.
>>>>
>>>> The ART feature as the kernel sees it is a hardware extension which
>>>> feeds
>>>> the ART clock to peripherals for timestamping and time correlation
>>>> purposes. The ratio between ART and TSC is described by CPUID leaf 0x15
>>>> so
>>>> the kernel can make use of that correlation, e.g. for enhanced PTP
>>>> accuracy.
>>>>
>>>> It's correct, that the NONSTOP_TSC feature depends on the availability
>>>> of
>>>> ART, but that has nothing to do with the feature bit, which solely
>>>> describes the ratio between TSC and the ART frequency which is exposed
>>>> to
>>>> peripherals. That frequency is not necessarily the real ART frequency.
>>>>
>>>>> Also, if the MSR TSC_ADJUST has not yet been written, as it seems to
>>>>> be
>>>>> nowhere else in Linux,  the code will always think X86_FEATURE_ART is
>>>>> 0
>>>>> because the CPU will always get a fault reading the MSR since it has
>>>>> never been written.
>>>>
>>>> Huch? If an access to the TSC ADJUST MSR faults, then something is
>>>> really
>>>> wrong. And writing it unconditionally to 0 is not going to happen. 4.10
>>>> has
>>>> new code which utilizes the TSC_ADJUST MSR.
>>>>
>>>>> It would be nice for user-space programs that want to use the TSC with
>>>>> rdtsc / rdtscp instructions, such as the demo program attached to the
>>>>> bug report,
>>>>> could have confidence that Linux is actually generating the results of
>>>>> clock_gettime(CLOCK_MONOTONIC_RAW, &timespec)
>>>>> in a predictable way from the TSC by looking at the
>>>>>  /dev/cpu/0/cpuid[bit(((3*32)+10)] value before enabling user-space
>>>>> use of TSC values, so that they can correlate TSC values with linux
>>>>> clock_gettime() values.
>>>>
>>>> What has ART to do with correct CLOCK_MONOTONIC_RAW values?
>>>>
>>>> Nothing at all, really.
>>>>
>>>> The kernel makes use of the proper information values already.
>>>>
>>>> The TSC frequency is determined from:
>>>>
>>>>     1) CPUID(0x16) if available
>>>>     2) MSRs if available
>>>>     3) By calibration against a known clock
>>>>
>>>> If the kernel uses TSC as clocksource then the CLOCK_MONOTONIC_* values
>>>> are
>>>> correct whether that machine has ART exposed to peripherals or not.
>>>>
>>>>> has tsc: 1 constant: 1
>>>>> 832 / 7 = 118 : 832 - 9.888914286E+04hz : OK:1
>>>>
>>>> And that voodoo math tells us what? That you found a way to correlate
>>>> CPUID(0xd) to the TSC frequency on that machine.
>>>>
>>>> Now I'm curious how you do that on this other machine which returns for
>>>> cpuid(15): 1, 1, 1
>>>>
>>>> You can't because all of this is completely wrong.
>>>>
>>>> Thanks,
>>>>
>>>> 	tglx
>>>>
>>>
>>
>
