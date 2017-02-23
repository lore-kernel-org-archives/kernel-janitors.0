From: Jason Vas Dias <jason.vas.dias@gmail.com>
Date: Thu, 23 Feb 2017 18:05:00 +0000
Subject: Re: [PATCH] arch/x86/kernel/tsc.c : set X86_FEATURE_ART for TSC on CPUs like i7-4910MQ : bug #194609
Message-Id: <CALyZvKyuuZvUf6_QjvVe2ST6m8WdPUDhkF-ybHtOOHjKRKKPEg@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="001a114150dcaf9f76054936736d"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALyZvKyAH8xfj_j2Vh_z2BOgYJeP73LvFwhvQ26-Kyfthdtwiw@mail.gmail.com>
 <CALyZvKwVDP8bTDdteYZT01GJGDd0d+hQ7oib-oXj+DarNHMWnQ@mail.gmail.com>
 <alpine.DEB.2.20.1702201239330.4208@nanos> <CALyZvKxhvGjRou4FcEvvbwPxPzAxpe8Shn=53DUx6WYWqEGSrA@mail.gmail.com>
 <CALyZvKyThHz12B7ViO8wyqeVB+mknBQGi=k7+TRUX-mCjkATtA@mail.gmail.com>
 <CALyZvKz_WpnDCPTy=DobayTTj-3gTUZ=TCv25i3Hb9AcYKa14w@mail.gmail.com>
 <CALyZvKyTGOmXC9DxcS-UR-STSwtJONMQA6srtZAaiLURcOxqvA@mail.gmail.com>
 <CALyZvKyT_-t9LXiaD-fv=L_WT8DwXJ_ooV6S=914fG8_Fydrhw@mail.gmail.com> <CALyZvKyq1MOsdM9j_VoXjG8rR8tQ747xY8m-SAy8haY0o8406A@mail.gmail.com>
In-Reply-To: <CALyZvKyq1MOsdM9j_VoXjG8rR8tQ747xY8m-SAy8haY0o8406A@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Prarit Bhargava <prarit@redhat.com>, x86@kernel.org

--001a114150dcaf9f76054936736d
Content-Type: text/plain; charset=UTF-8

I have found a new source of weirdness with  TSC  using
clock_gettime(CLOCK_MONOTONIC_RAW,&ts) :

The vsyscall_gtod_data.mult field changes somewhat between
calls to clock_gettime(CLOCK_MONOTONIC_RAW,&ts),
so that sometimes an extra (2^24) nanoseconds are added or
removed from  the value derived from the TSC and stored in 'ts' .

This is demonstrated by the output of the test program in the
attached ttsc.tar  file:
$ ./tlgtd
it worked! - GTOD: clock:1 mult:5798662 shift:24
synced - mult now: 5798661

What it is doing is finding the address of the 'vsyscall_gtod_data' structure
from /proc/kallsyms, and mapping the virtual address to an ELF section
offset within /proc/kcore, and reading just the 'vsyscall_gtod_data' structure
into user-space memory .

Really, this 'mult' value, which is used to return the
seconds|nanoseconds value:
    ( tsc_cycles * mult ) >> shift
(where shift is 24 ), should not change from the first time it is initialized .

The TSC is meant to be FIXED FREQUENCY, right ?
So how could  /  why should the conversion function from TSC ticks to
nanoseconds change ?

So now it is doubly difficult for user-space libraries to maintain their
RDTSC derived seconds|nanoseconds values to correlate well those returned by
the kernel,  because they must regularly read the updated 'mult' value
used by the
kernel .

I really don't think the kernel should randomly be deciding to
increase / decrease
the TSC tick period by 2^24 nanoseconds!

Is this a bug or intentional ? I am searching for all places where a
'[.>]mult.*=' occurs, but this returns rather alot of matches.

Please could a future version of linux at least export the 'mult' and
'shift' values for
the current clocksource !

Regards,
Jason








On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
> OK, last post on this issue today -
> can anyone explain why, with standard 4.10.0 kernel & no new
> 'notsc_adjust' option, and the same maths being used, these two runs
> should display
> such a wide disparity between clock_gettime(CLOCK_MONOTONIC_RAW,&ts)
> values ? :
>
> $ J/pub/ttsc/ttsc1
> max_extended_leaf: 80000008
> has tsc: 1 constant: 1
> Invariant TSC is enabled: Actual TSC freq: 2.893299GHz - TSC adjust: 1.
> ts2 - ts1: 162 ts3 - ts2: 110 ns1: 0.000000641 ns2: 0.000002850
> ts3 - ts2: 175 ns1: 0.000000659
> ts3 - ts2: 18 ns1: 0.000000643
> ts3 - ts2: 18 ns1: 0.000000618
> ts3 - ts2: 17 ns1: 0.000000620
> ts3 - ts2: 17 ns1: 0.000000616
> ts3 - ts2: 18 ns1: 0.000000641
> ts3 - ts2: 18 ns1: 0.000000709
> ts3 - ts2: 20 ns1: 0.000000763
> ts3 - ts2: 20 ns1: 0.000000735
> ts3 - ts2: 20 ns1: 0.000000761
> t1 - t0: 78200 - ns2: 0.000080824
> $ J/pub/ttsc/ttsc1
> max_extended_leaf: 80000008
> has tsc: 1 constant: 1
> Invariant TSC is enabled: Actual TSC freq: 2.893299GHz - TSC adjust: 1.
> ts2 - ts1: 217 ts3 - ts2: 221 ns1: 0.000001294 ns2: 0.000005375
> ts3 - ts2: 210 ns1: 0.000001418
> ts3 - ts2: 23 ns1: 0.000001399
> ts3 - ts2: 22 ns1: 0.000001445
> ts3 - ts2: 25 ns1: 0.000001321
> ts3 - ts2: 20 ns1: 0.000001428
> ts3 - ts2: 25 ns1: 0.000001367
> ts3 - ts2: 23 ns1: 0.000001425
> ts3 - ts2: 23 ns1: 0.000001357
> ts3 - ts2: 22 ns1: 0.000001487
> ts3 - ts2: 25 ns1: 0.000001377
> t1 - t0: 145753 - ns2: 0.000150781
>
> (complete source of test program ttsc1 attached in ttsc.tar
>  $ tar -xpf ttsc.tar
>  $ cd ttsc
>  $ make
> ).
>
> On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>> I actually tried adding a 'notsc_adjust' kernel option to disable any
>> setting or
>> access to the TSC_ADJUST MSR, but then I see the problems  - a big
>> disparity
>> in values depending on which CPU the thread is scheduled -  and no
>> improvement in clock_gettime() latency.  So I don't think the new
>> TSC_ADJUST
>> code in ts_sync.c itself is the issue - but something added @ 460ns
>> onto every clock_gettime() call when moving from v4.8.0 -> v4.10.0 .
>> As I don't think fixing the clock_gettime() latency issue is my problem
>> or
>> even
>> possible with current clock architecture approach, it is a non-issue.
>>
>> But please, can anyone tell me if are there any plans to move the time
>> infrastructure  out of the kernel and into glibc along the lines
>> outlined
>> in previous mail - if not, I am going to concentrate on this more radical
>> overhaul approach for my own systems .
>>
>> At least, I think mapping the clocksource information structure itself in
>> some
>> kind of sharable page makes sense . Processes could map that page
>> copy-on-write
>> so they could start off with all the timing parameters preloaded,  then
>> keep
>> their copy updated using the rdtscp instruction , or msync() (read-only)
>> with the kernel's single copy to get the latest time any process has
>> requested.
>> All real-time parameters & adjustments could be stored in that page ,
>> & eventually a single copy of the tzdata could be used by both kernel
>> & user-space.
>> That is what I am working towards. Any plans to make linux real-time tsc
>> clock user-friendly ?
>>
>>
>>
>> On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>>> Yes, my CPU is still getting a fault every time the TSC_ADJUST MSR is
>>> read or written . It is probably because it genuinuely does not
>>> support any cpuid > 13 ,
>>> or the modern TSC_ADJUST interface . This is probably why my
>>> clock_gettime()
>>> latencies are so bad. Now I have to develop a patch to disable all
>>> access
>>> to
>>> TSC_ADJUST MSR if boot_cpu_data.cpuid_level <= 13 .
>>> I really have an unlucky CPU :-) .
>>>
>>> But really, I think this issue goes deeper into the fundamental limits
>>> of
>>> time measurement on Linux : it is never going to be possible to measure
>>> minimum times with clock_gettime() comparable with those returned by
>>> rdtscp instruction - the time taken to enter the kernel through the
>>> VDSO,
>>> queue an access to vsyscall_gtod_data via a workqueue, access it & do
>>> computations & copy value to user-space is NEVER going to be up to the
>>> job of measuring small real-time durations of the order of 10-20 TSC
>>> ticks
>>> .
>>>
>>> I think the best way to solve this problem going forward would be to
>>> store
>>> the entire vsyscall_gtod_data  data structure representing the current
>>> clocksource
>>> in a shared page which is memory-mappable (read-only) by user-space .
>>> I think sser-space programs should be able to do something like :
>>>     int fd =
>>> open("/sys/devices/system/clocksource/clocksource0/gtod.page",O_RDONLY);
>>>     size_t psz = getpagesize();
>>>     void *gtod = mmap( 0, psz, PROT_READ, MAP_PRIVATE, fd, 0 );
>>>     msync(gtod,psz,MS_SYNC);
>>>
>>> Then they could all read the real-time clock values as they are updated
>>> in real-time by the kernel, and know exactly how to interpret them .
>>>
>>> I also think that all mktime() / gmtime() / localtime() timezone
>>> handling
>>> functionality should be
>>> moved to user-space, and that the kernel should actually load and link
>>> in
>>> some
>>> /lib/libtzdata.so
>>> library, provided by glibc / libc implementations, that is exactly the
>>> same library
>>> used by glibc() code to parse tzdata ; tzdata should be loaded at boot
>>> time
>>> by the kernel from the same places glibc loads it, and both the kernel
>>> and
>>> glibc should use identical mktime(), gmtime(), etc. functions to access
>>> it,
>>> and
>>> glibc using code would not need to enter the kernel at all for any
>>> time-handling
>>> code. This tzdata-library code be automatically loaded into process
>>> images
>>> the
>>> same way the vdso region is , and the whole system could access only one
>>> copy of it and the 'gtod.page' in memory.
>>>
>>> That's just my two-cents worth, and how I'd like to eventually get
>>> things working
>>> on my system.
>>>
>>> All the best, Regards,
>>> Jason
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>>>> On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>>>>> RE:
>>>>>>> 4.10 has  new code which utilizes the TSC_ADJUST MSR.
>>>>>
>>>>> I just built an unpatched linux v4.10 with tglx's TSC improvements -
>>>>> much else improved in this kernel (like iwlwifi) - thanks!
>>>>>
>>>>> I have attached an updated version of the test program which
>>>>> doesn't print the bogus "Nominal TSC Frequency" (the previous
>>>>> version printed it, but equally ignored it).
>>>>>
>>>>> The clock_gettime(CLOCK_MONOTONIC_RAW,&ts) latency has improved by
>>>>> a factor of 2 - it used to be @140ns and is now @ 70ns  ! Wow!  :
>>>>>
>>>>> $ uname -r
>>>>> 4.10.0
>>>>> $ ./ttsc1
>>>>> max_extended_leaf: 80000008
>>>>> has tsc: 1 constant: 1
>>>>> Invariant TSC is enabled: Actual TSC freq: 2.893299GHz.
>>>>> ts2 - ts1: 144 ts3 - ts2: 96 ns1: 0.000000588 ns2: 0.000002599
>>>>> ts3 - ts2: 178 ns1: 0.000000592
>>>>> ts3 - ts2: 14 ns1: 0.000000577
>>>>> ts3 - ts2: 14 ns1: 0.000000651
>>>>> ts3 - ts2: 17 ns1: 0.000000625
>>>>> ts3 - ts2: 17 ns1: 0.000000677
>>>>> ts3 - ts2: 17 ns1: 0.000000626
>>>>> ts3 - ts2: 17 ns1: 0.000000627
>>>>> ts3 - ts2: 17 ns1: 0.000000627
>>>>> ts3 - ts2: 18 ns1: 0.000000655
>>>>> ts3 - ts2: 17 ns1: 0.000000631
>>>>> t1 - t0: 89067 - ns2: 0.000091411
>>>>>
>>>>
>>>>
>>>> Oops, going blind in my old age. These latencies are actually 3 times
>>>> greater than under 4.8 !!
>>>>
>>>> Under 4.8, the program printed latencies of @ 140ns for clock_gettime,
>>>> as
>>>> shown
>>>> in bug 194609 as the 'ns1' (timespec_b - timespec_a) value::
>>>>
>>>> ts3 - ts2: 24 ns1: 0.000000162
>>>> ts3 - ts2: 17 ns1: 0.000000143
>>>> ts3 - ts2: 17 ns1: 0.000000146
>>>> ts3 - ts2: 17 ns1: 0.000000149
>>>> ts3 - ts2: 17 ns1: 0.000000141
>>>> ts3 - ts2: 16 ns1: 0.000000142
>>>>
>>>> now the clock_gettime(CLOCK_MONOTONIC_RAW,&ts) latency is @
>>>> 600ns, @ 4 times more than under 4.8 .
>>>> But I'm glad the TSC_ADJUST problems are fixed.
>>>>
>>>> Will programs reading :
>>>>  $ cat /sys/devices/msr/events/tsc
>>>>  event=0x00
>>>> read a new event for each setting of the TSC_ADJUST MSR or a wrmsr on
>>>> the
>>>> TSC ?
>>>>
>>>>> I think this is because under Linux 4.8, the CPU got a fault every
>>>>> time it read the TSC_ADJUST MSR.
>>>>
>>>> maybe it still is!
>>>>
>>>>
>>>>> But user programs wanting to use the TSC  and correlate its value to
>>>>> clock_gettime(CLOCK_MONOTONIC_RAW) values accurately like the above
>>>>> program still have to  dig the TSC frequency value out of the kernel
>>>>> with objdump  - this was really the point of the bug #194609.
>>>>>
>>>>> I would still like to investigate exporting 'tsc_khz' & 'mult' +
>>>>> 'shift' values via sysfs.
>>>>>
>>>>> Regards,
>>>>> Jason.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> On 21/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>>>>>> Thank You for enlightening me -
>>>>>>
>>>>>> I was just having a hard time believing that Intel would ship a chip
>>>>>> that features a monotonic, fixed frequency timestamp counter
>>>>>> without specifying in either documentation or on-chip or in ACPI what
>>>>>> precisely that hard-wired frequency is, but I now know that to
>>>>>> be the case for the unfortunate i7-4910MQ - I mean, how can the CPU
>>>>>> assert CPUID:80000007[8] ( InvariantTSC ) which it does, which is
>>>>>> difficult to reconcile with the statement in the SDM :
>>>>>>   17.16.4  Invariant Time-Keeping
>>>>>>     The invariant TSC is based on the invariant timekeeping hardware
>>>>>>     (called Always Running Timer or ART), that runs at the core
>>>>>> crystal
>>>>>> clock
>>>>>>     frequency. The ratio defined by CPUID leaf 15H expresses the
>>>>>> frequency
>>>>>>     relationship between the ART hardware and TSC. If
>>>>>> CPUID.15H:EBX[31:0]
>>>>>> !=
>>>>>> 0
>>>>>>     and CPUID.80000007H:EDX[InvariantTSC] = 1, the following
>>>>>> linearity
>>>>>>     relationship holds between TSC and the ART hardware:
>>>>>>     TSC_Value = (ART_Value * CPUID.15H:EBX[31:0] )
>>>>>>                          / CPUID.15H:EAX[31:0] + K
>>>>>>     Where 'K' is an offset that can be adjusted by a privileged
>>>>>> agent*2.
>>>>>>      When ART hardware is reset, both invariant TSC and K are also
>>>>>> reset.
>>>>>>
>>>>>> So I'm just trying to figure out what CPUID.15H:EBX[31:0]  and
>>>>>> CPUID.15H:EAX[31:0]  are for my hardware.  I assumed (incorrectly)
>>>>>> that
>>>>>> the "Nominal TSC Frequency" formulae in the manul must apply to all
>>>>>> CPUs with InvariantTSC .
>>>>>>
>>>>>> Do I understand correctly , that since I do have InvariantTSC ,  the
>>>>>> TSC_Value is in fact calculated according to the above formula, but
>>>>>> with
>>>>>> a "hidden" ART Value,  & Core Crystal Clock frequency & its ratio to
>>>>>> TSC frequency ?
>>>>>> It was obvious this nominal TSC Frequency had nothing to do with the
>>>>>> actual TSC frequency used by Linux, which is 'tsc_khz' .
>>>>>> I guess wishful thinking led me to believe CPUID:15h was actually
>>>>>> supported somehow , because I thought InvariantTSC meant it had ART
>>>>>> hardware .
>>>>>>
>>>>>> I do strongly suggest that Linux exports its calibrated TSC Khz
>>>>>> somewhere to user
>>>>>> space .
>>>>>>
>>>>>> I think the best long-term solution would be to allow programs to
>>>>>> somehow read the TSC without invoking
>>>>>> clock_gettime(CLOCK_MONOTONIC_RAW,&ts), &
>>>>>> having to enter the kernel, which incurs an overhead of > 120ns on my
>>>>>> system
>>>>>> .
>>>>>>
>>>>>>
>>>>>> Couldn't linux export its 'tsc_khz' and / or 'clocksource->mult' and
>>>>>> 'clocksource->shift' values to /sysfs somehow ?
>>>>>>
>>>>>> For instance , only  if the 'current_clocksource' is 'tsc', then
>>>>>> these
>>>>>> values could be exported as:
>>>>>> /sys/devices/system/clocksource/clocksource0/shift
>>>>>> /sys/devices/system/clocksource/clocksource0/mult
>>>>>> /sys/devices/system/clocksource/clocksource0/freq
>>>>>>
>>>>>> So user-space programs could  know that the value returned by
>>>>>>     clock_gettime(CLOCK_MONOTONIC_RAW)
>>>>>>   would be
>>>>>>     {    .tv_sec =  ( ( rdtsc() * mult ) >> shift ) >> 32,
>>>>>>       , .tv_nsec = ( ( rdtsc() * mult ) >> shift ) >> &~0U
>>>>>>     }
>>>>>>   and that represents ticks of period (1.0 / ( freq * 1000 )) S.
>>>>>>
>>>>>> That would save user-space programs from having to know 'tsc_khz' by
>>>>>> parsing the 'Refined TSC' frequency from log files or by examining
>>>>>> the
>>>>>> running kernel with objdump to obtain this value & figure out 'mult'
>>>>>> &
>>>>>> 'shift' themselves.
>>>>>>
>>>>>> And why not a
>>>>>>   /sys/devices/system/clocksource/clocksource0/value
>>>>>> file that actually prints this ( ( rdtsc() * mult ) >> shift )
>>>>>> expression as a long integer?
>>>>>> And perhaps a
>>>>>>   /sys/devices/pnp0/XX\:YY/rtc/rtc0/nanoseconds
>>>>>> file that actually prints out the number of real-time nano-seconds
>>>>>> since
>>>>>> the
>>>>>> contents of the existing
>>>>>>   /sys/devices/pnp0/XX\:YY/rtc/rtc0/{time,since_epoch}
>>>>>> files using the current TSC value?
>>>>>> To read the rtc0/{date,time} files is already faster than entering
>>>>>> the
>>>>>> kernel to call
>>>>>> clock_gettime(CLOCK_REALTIME, &ts) & convert to integer for scripts.
>>>>>>
>>>>>> I will work on developing a patch to this effect if no-one else is.
>>>>>>
>>>>>> Also, am I right in assuming that the maximum granularity of the
>>>>>> real-time
>>>>>> clock
>>>>>> on my system is 1/64th of a second ? :
>>>>>>  $ cat /sys/devices/pnp0/00\:02/rtc/rtc0/max_user_freq
>>>>>>  64
>>>>>> This is the maximum granularity that can be stored in CMOS , not
>>>>>> returned by TSC? Couldn't we have something similar that gave an
>>>>>> accurate idea of TSC frequency and the precise formula applied to TSC
>>>>>> value to get clock_gettime
>>>>>> (CLOCK_MONOTONIC_RAW) value ?
>>>>>>
>>>>>> Regards,
>>>>>> Jason
>>>>>>
>>>>>>
>>>>>> This code does produce good timestamps with a latency of @20ns
>>>>>> that correlate well with clock_gettIme(CLOCK_MONOTONIC_RAW,&ts)
>>>>>> values, but it depends on a global variable that  is initialized to
>>>>>> the 'tsc_khz' value
>>>>>> computed by running kernel parsed from objdump /proc/kcore output :
>>>>>>
>>>>>> static inline __attribute__((always_inline))
>>>>>> U64_t
>>>>>> IA64_tsc_now()
>>>>>> { if(!(    _ia64_invariant_tsc_enabled
>>>>>>       ||(( _cpu0id_fd == -1) &&
>>>>>> IA64_invariant_tsc_is_enabled(NULL,NULL))
>>>>>>       )
>>>>>>     )
>>>>>>   { fprintf(stderr, __FILE__":%d:(%s): must be called with invariant
>>>>>> TSC enabled.\n");
>>>>>>     return 0;
>>>>>>   }
>>>>>>   U32_t tsc_hi, tsc_lo;
>>>>>>   register UL_t tsc;
>>>>>>   asm volatile
>>>>>>   ( "rdtscp\n\t"
>>>>>>     "mov %%edx, %0\n\t"
>>>>>>     "mov %%eax, %1\n\t"
>>>>>>     "mov %%ecx, %2\n\t"
>>>>>>   : "=m" (tsc_hi) ,
>>>>>>     "=m" (tsc_lo) ,
>>>>>>     "=m" (_ia64_tsc_user_cpu) :
>>>>>>   : "%eax","%ecx","%edx"
>>>>>>   );
>>>>>>   tsc=(((UL_t)tsc_hi) << 32)|((UL_t)tsc_lo);
>>>>>>   return tsc;
>>>>>> }
>>>>>>
>>>>>> __thread
>>>>>> U64_t _ia64_first_tsc = 0xffffffffffffffffUL;
>>>>>>
>>>>>> static inline __attribute__((always_inline))
>>>>>> U64_t IA64_tsc_ticks_since_start()
>>>>>> { if(_ia64_first_tsc == 0xffffffffffffffffUL)
>>>>>>   { _ia64_first_tsc = IA64_tsc_now();
>>>>>>     return 0;
>>>>>>   }
>>>>>>   return (IA64_tsc_now() - _ia64_first_tsc) ;
>>>>>> }
>>>>>>
>>>>>> static inline __attribute__((always_inline))
>>>>>> void
>>>>>> ia64_tsc_calc_mult_shift
>>>>>> ( register U32_t *mult,
>>>>>>   register U32_t *shift
>>>>>> )
>>>>>> { /* paraphrases Linux clocksource.c's clocks_calc_mult_shift()
>>>>>> function:
>>>>>>    * calculates second + nanosecond mult + shift in same way linux
>>>>>> does.
>>>>>>    * we want to be compatible with what linux returns in struct
>>>>>> timespec ts after call to
>>>>>>    * clock_gettime(CLOCK_MONOTONIC_RAW, &ts).
>>>>>>    */
>>>>>>   const U32_t scale=1000U;
>>>>>>   register U32_t from= IA64_tsc_khz();
>>>>>>   register U32_t to  = NSEC_PER_SEC / scale;
>>>>>>   register U64_t sec = ( ~0UL / from ) / scale;
>>>>>>   sec = (sec > 600) ? 600 : ((sec > 0) ? sec : 1);
>>>>>>   register U64_t maxsec = sec * scale;
>>>>>>   UL_t tmp;
>>>>>>   U32_t sft, sftacc=32;
>>>>>>   /*
>>>>>>    * Calculate the shift factor which is limiting the conversion
>>>>>>    * range:
>>>>>>    */
>>>>>>   tmp = (maxsec * from) >> 32;
>>>>>>   while (tmp)
>>>>>>   { tmp >>=1;
>>>>>>     sftacc--;
>>>>>>   }
>>>>>>   /*
>>>>>>    * Find the conversion shift/mult pair which has the best
>>>>>>    * accuracy and fits the maxsec conversion range:
>>>>>>    */
>>>>>>   for (sft = 32; sft > 0; sft--)
>>>>>>   { tmp = ((UL_t) to) << sft;
>>>>>>     tmp += from / 2;
>>>>>>     tmp = tmp / from;
>>>>>>     if ((tmp >> sftacc) == 0)
>>>>>>       break;
>>>>>>   }
>>>>>>   *mult = tmp;
>>>>>>   *shift = sft;
>>>>>> }
>>>>>>
>>>>>> __thread
>>>>>> U32_t _ia64_tsc_mult = ~0U, _ia64_tsc_shift=~0U;
>>>>>>
>>>>>> static inline __attribute__((always_inline))
>>>>>> U64_t IA64_s_ns_since_start()
>>>>>> { if( ( _ia64_tsc_mult == ~0U ) || ( _ia64_tsc_shift == ~0U ) )
>>>>>>     ia64_tsc_calc_mult_shift( &_ia64_tsc_mult, &_ia64_tsc_shift);
>>>>>>   register U64_t cycles = IA64_tsc_ticks_since_start();
>>>>>>   register U64_t ns = ((cycles
>>>>>> *((UL_t)_ia64_tsc_mult))>>_ia64_tsc_shift);
>>>>>>   return( (((ns / NSEC_PER_SEC)&0xffffffffUL) << 32) | ((ns %
>>>>>> NSEC_PER_SEC)&0x3fffffffUL) );
>>>>>>   /* Yes, we are purposefully ignoring durations of more than 4.2
>>>>>> billion seconds here! */
>>>>>> }
>>>>>>
>>>>>>
>>>>>> I think Linux should export the 'tsc_khz', 'mult' and 'shift' values
>>>>>> somehow,
>>>>>> then user-space libraries could have more confidence in using 'rdtsc'
>>>>>> or 'rdtscp'
>>>>>> if Linux's current_clocksource is 'tsc'.
>>>>>>
>>>>>> Regards,
>>>>>> Jason
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 20/02/2017, Thomas Gleixner <tglx@linutronix.de> wrote:
>>>>>>> On Sun, 19 Feb 2017, Jason Vas Dias wrote:
>>>>>>>
>>>>>>>> CPUID:15H is available in user-space, returning the integers : ( 7,
>>>>>>>> 832, 832 ) in EAX:EBX:ECX , yet boot_cpu_data.cpuid_level is 13 ,
>>>>>>>> so
>>>>>>>> in detect_art() in tsc.c,
>>>>>>>
>>>>>>> By some definition of available. You can feed CPUID random leaf
>>>>>>> numbers
>>>>>>> and
>>>>>>> it will return something, usually the value of the last valid CPUID
>>>>>>> leaf,
>>>>>>> which is 13 on your CPU. A similar CPU model has
>>>>>>>
>>>>>>> 0x0000000d 0x00: eax=0x00000007 ebx=0x00000340 ecx=0x00000340
>>>>>>> edx=0x00000000
>>>>>>>
>>>>>>> i.e. 7, 832, 832, 0
>>>>>>>
>>>>>>> Looks familiar, right?
>>>>>>>
>>>>>>> You can verify that with 'cpuid -1 -r' on your machine.
>>>>>>>
>>>>>>>> Linux does not think ART is enabled, and does not set the
>>>>>>>> synthesized
>>>>>>>> CPUID +
>>>>>>>> ((3*32)+10) bit, so a program looking at /dev/cpu/0/cpuid would not
>>>>>>>> see this bit set .
>>>>>>>
>>>>>>> Rightfully so. This is a Haswell Core model.
>>>>>>>
>>>>>>>> if an e1000 NIC card had been installed, PTP would not be
>>>>>>>> available.
>>>>>>>
>>>>>>> PTP is independent of the ART kernel feature . ART just provides
>>>>>>> enhanced
>>>>>>> PTP features. You are confusing things here.
>>>>>>>
>>>>>>> The ART feature as the kernel sees it is a hardware extension which
>>>>>>> feeds
>>>>>>> the ART clock to peripherals for timestamping and time correlation
>>>>>>> purposes. The ratio between ART and TSC is described by CPUID leaf
>>>>>>> 0x15
>>>>>>> so
>>>>>>> the kernel can make use of that correlation, e.g. for enhanced PTP
>>>>>>> accuracy.
>>>>>>>
>>>>>>> It's correct, that the NONSTOP_TSC feature depends on the
>>>>>>> availability
>>>>>>> of
>>>>>>> ART, but that has nothing to do with the feature bit, which solely
>>>>>>> describes the ratio between TSC and the ART frequency which is
>>>>>>> exposed
>>>>>>> to
>>>>>>> peripherals. That frequency is not necessarily the real ART
>>>>>>> frequency.
>>>>>>>
>>>>>>>> Also, if the MSR TSC_ADJUST has not yet been written, as it seems
>>>>>>>> to
>>>>>>>> be
>>>>>>>> nowhere else in Linux,  the code will always think X86_FEATURE_ART
>>>>>>>> is
>>>>>>>> 0
>>>>>>>> because the CPU will always get a fault reading the MSR since it
>>>>>>>> has
>>>>>>>> never been written.
>>>>>>>
>>>>>>> Huch? If an access to the TSC ADJUST MSR faults, then something is
>>>>>>> really
>>>>>>> wrong. And writing it unconditionally to 0 is not going to happen.
>>>>>>> 4.10
>>>>>>> has
>>>>>>> new code which utilizes the TSC_ADJUST MSR.
>>>>>>>
>>>>>>>> It would be nice for user-space programs that want to use the TSC
>>>>>>>> with
>>>>>>>> rdtsc / rdtscp instructions, such as the demo program attached to
>>>>>>>> the
>>>>>>>> bug report,
>>>>>>>> could have confidence that Linux is actually generating the results
>>>>>>>> of
>>>>>>>> clock_gettime(CLOCK_MONOTONIC_RAW, &timespec)
>>>>>>>> in a predictable way from the TSC by looking at the
>>>>>>>>  /dev/cpu/0/cpuid[bit(((3*32)+10)] value before enabling user-space
>>>>>>>> use of TSC values, so that they can correlate TSC values with linux
>>>>>>>> clock_gettime() values.
>>>>>>>
>>>>>>> What has ART to do with correct CLOCK_MONOTONIC_RAW values?
>>>>>>>
>>>>>>> Nothing at all, really.
>>>>>>>
>>>>>>> The kernel makes use of the proper information values already.
>>>>>>>
>>>>>>> The TSC frequency is determined from:
>>>>>>>
>>>>>>>     1) CPUID(0x16) if available
>>>>>>>     2) MSRs if available
>>>>>>>     3) By calibration against a known clock
>>>>>>>
>>>>>>> If the kernel uses TSC as clocksource then the CLOCK_MONOTONIC_*
>>>>>>> values
>>>>>>> are
>>>>>>> correct whether that machine has ART exposed to peripherals or not.
>>>>>>>
>>>>>>>> has tsc: 1 constant: 1
>>>>>>>> 832 / 7 = 118 : 832 - 9.888914286E+04hz : OK:1
>>>>>>>
>>>>>>> And that voodoo math tells us what? That you found a way to
>>>>>>> correlate
>>>>>>> CPUID(0xd) to the TSC frequency on that machine.
>>>>>>>
>>>>>>> Now I'm curious how you do that on this other machine which returns
>>>>>>> for
>>>>>>> cpuid(15): 1, 1, 1
>>>>>>>
>>>>>>> You can't because all of this is completely wrong.
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> 	tglx
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

--001a114150dcaf9f76054936736d
Content-Type: application/x-tar; name="ttsc.tar"
Content-Disposition: attachment; filename="ttsc.tar"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

dHRzYy8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA3NTUAMDAwMDAw
MAAwMDAwMDAwADAwMDAwMDAwMDAwADEzMDUzNjIxNzUyADAxMDUzNQAgNQAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0
dHNjL2tzeW0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMDAwMDc1NQAwMDAwMDAw
ADAwMDAwMDAAMDAwMDAwMDY1MDcAMTMwNTIwNTE0NTUAMDExNDUyACAwAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzdGFyICAAcm9vdAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAByb290AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACMh
L3Vzci9iaW4vYmFzaApmdW5jdGlvbiBrc3ltKCkKIyBwcmludHMgYWRkcmVzcyAmIHZhbHVlIGlu
IHJ1bm5pbmcga2VybmVsIG9mIGZpcnN0IGtlcm5lbCBzeW1ib2wgd2l0aCBuYW1lIGJlZ2lubmlu
ZyB3aXRoIDFzdCBhcmd1bWVudCwgd2hpY2ggbXVzdAojIG5hbWUgYW4gaW50ZWdlciBvZiBzaXpl
IDJuZCBhcmd1bWVudCwgYmVpbmcgYSBnbG9iYWwga2VybmVsIHN5bWJvbCBsaXN0ZWQgaW4gL3By
b2Mva2FsbHN5bXMsIGJ5IGxvb2tpbmcgdXAgaXRzIHZhbHVlIGluIC9wcm9jL2tjb3JlIHdpdGgg
b2JqZHVtcC4KIyBUaGUga2VybmVsIGlzIHRoZSBvbmx5IHByb2dyYW0gb25lIGlzIGFibGUgdG8g
ZG8gdGhpcyB3aXRoICh1bmxlc3Mgb25lIGhhcyBhIGNvcmUgZHVtcCBmaWxlIG9mIGEgcnVubmlu
ZyBwcm9jZXNzIGhhbmR5KSwgc28gd2h5IG5vdCB1c2UgaXQhCnsgaWYgKCggJCMgPCAyICkpOyB0
aGVuCiAgICAgZWNobyAiJEZVTkNOQU1FOiBleHBlY3RzIDIgYXJndW1lbnRzIDxrZXJuZWwgaW50
ZWdlciBzeW1ib2wgbmFtZT4gPHNpemU6IG11c3QgYmUgb25lIG9mIDEgLCAyICwgNCwgb3IgOD4g
LiIkJ1xuXHQnJ1dpbGwgcHJpbnQgdGhlIHZhbHVlIG9mIHRoZSBmaXJzdCBtYXRjaGluZyBpbnRl
Z2VyIChvZiBzaXplIDJuZC5hcmcpIGdsb2JhbCBzeW1ib2wgZnJvbSB0aGUgbGl2ZSBrZXJuZWwg
aWYgYSBkZWZpbml0aW9uIGZvdW5kIGluIC9wcm9jL2thbGxzeW1zLicgPiYyOwogICAgIHJldHVy
biAxOyAKICBmaQogIGxvY2FsIG5hbWU9IiQxIjsKICBpZiBbWyAhICIkMiIgPX4gXlsxLTQ4XSQg
XV07IHRoZW4KICAgICBlY2hvICIkRlVOQ05BTUU6IHNpemUgbXVzdCBiZSBvbmUgb2YgMSAsIDIg
LCA0LCBvciA4IC4iID4mMjsKICBmaQogIGRlY2xhcmUgLWkgc2l6ZT0iJDIiOwogIGRlY2xhcmUg
LWEgc3ltPSgkKHNlZCAtcm4gJy9eWzAtOUEtRmEtZl0rW1s6c3BhY2U6XV0rW2JCZERdW1s6c3Bh
Y2U6XV0rJyQxJy97cy9eKFswLTlBLUZhLWZdKylbWzpzcGFjZTpdXVtiQmREXVtbOnNwYWNlOl1d
KyhbXls6c3BhY2U6XV0rKSQvXDEgXDIvO3A7cX0nIDwgL3Byb2Mva2FsbHN5bXMpKTsKICBpZiAo
KCAoJHsjc3ltW0BdfT09MikgJiYgICgkeyNzeW1bMF19ID4gMSkgICYmICgkeyNzeW1bMV19ID4g
MCkgKSk7IHRoZW4KICAgIGRlY2xhcmUgLWkgZW5kX2FkZHI9JzE2Iycke3N5bVswXX0nK3NpemUn
OwogICAgbG9jYWwgdmFsdWU9JChvYmpkdW1wICAtTSBhZGRyNjQgLXMgLS1zdGFydC1hZGRyZXNz
PTB4JHtzeW1bMF19IC0tc3RvcC1hZGRyZXNzPSRlbmRfYWRkciAvcHJvYy9rY29yZSAgfAogICAg
ICAgICAgICAgICAgICAgICAgd2hpbGUgcmVhZCBsaW5lOyBkbwogICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIFtbICIkbGluZSIgPX4gXltbOnNwYWNlOl1dKiR7c3ltWzBdfVtbOnNwYWNlOl1d
KyhbMC05QS1GYS1mXXskKChzaXplPDwxKSl9KVtbOnNwYWNlOl1dPy4qJCBdXTsgdGhlbgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlY2hvIC1uICIke0JBU0hfUkVNQVRDSFsxXX0iOwog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAgICAgICAgICAg
ICAgICBmaQogICAgICAgICAgICAgICAgICAgICAgZG9uZQogICAgICAgICAgKTsKICAgIGlmIFtb
ICIkdmFsdWUiID1+IChbMC05QS1GYS1mXXsyfSl7JHNpemV9IF1dOyB0aGVuCiAgICAgICAgIyB0
aGUgdmFsdWUgaXMgaW4gYWRkcmVzcyBzcGFjZSBvcmRlciwgaWUuIGZyb20gbG93IGJ5dGUgdG8g
aGlnaCBieXRlLCBzbyB1bmxpa2UgaW4gaHRvbmwgTFNCLT5NU0IgY29udmVyc2lvbiwKICAgICAg
ICAjIHRoZSBoaS9sbyBieXRlcyAmIHdvcmRzIGFyZSBub3Qgc3dhcHBlZCAoYXMgSSB3b3VsZCBo
YXZlIHRob3VnaHQgdGhleSB3b3VsZCBiZSkgLSBJIHRoaW5rIG9iamR1bXAgbXVzdCBiZSBkb2lu
ZyB0aGlzIGZvciB1cywKICAgICAgICAjIHNpbmNlIGl0IGtub3dzIHRoZSBvYmplY3QgYXQgdGhh
dCBhZGRyZXNzIGlzIGFsaWduZWQgb24gYSA0IGJ5dGUgYm91bmRhcnkgKG9yIGV2ZW4gdGhhdCBp
dCBpcyBhbiBpbnRlZ2VyPykgJiBpcyBkb2luZyBkdW1waW5nIGxpa2Ugb2QoMSkuCiAgICAgICAg
Y2FzZSAiJHNpemUiIGluCiAgICAgICAgICAgICgxKQogICAgICAgICAgICA7OwogICAgICAgICAg
ICAoMikgaWYgW1sgJHZhbHVlID1+IChbMC05QS1GYS1mXXsyfSkoWzAtOUEtRmEtZl17Mn0pIF1d
OyB0aGVuCiAgICAgICAgICAgICAgICAgICB2YWx1ZT0ke0JBU0hfUkVNQVRDSFsyXX0ke0JBU0hf
UkVNQVRDSFsxXX07CiAgICAgICAgICAgICAgICBmaQogICAgICAgICAgICAgICAgOzsKICAgICAg
ICAgICAgKDQpIGlmIFtbICR2YWx1ZSA9fiAoWzAtOUEtRmEtZl17Mn0pKFswLTlBLUZhLWZdezJ9
KShbMC05QS1GYS1mXXsyfSkoWzAtOUEtRmEtZl17Mn0pIF1dOyB0aGVuCiAgICAgICAgICAgICAg
ICAgICB2YWx1ZT0ke0JBU0hfUkVNQVRDSFs0XX0ke0JBU0hfUkVNQVRDSFszXX0ke0JBU0hfUkVN
QVRDSFsyXX0ke0JBU0hfUkVNQVRDSFsxXX07CiAgICAgICAgICAgICAgICBmaQogICAgICAgICAg
ICAgICAgOzsKICAgICAgICAgICAgKDgpIGlmIFtbICR2YWx1ZSA9fiAoWzAtOUEtRmEtZl17Mn0p
KFswLTlBLUZhLWZdezJ9KShbMC05QS1GYS1mXXsyfSkoWzAtOUEtRmEtZl17Mn0pIF1dOyB0aGVu
CiAgICAgICAgICAgICAgICAgICB2YWx1ZT0ke0JBU0hfUkVNQVRDSFs4XX0ke0JBU0hfUkVNQVRD
SFs3XX0ke0JBU0hfUkVNQVRDSFs2XX0ke0JBU0hfUkVNQVRDSFs1XX0ke0JBU0hfUkVNQVRDSFs0
XX0ke0JBU0hfUkVNQVRDSFszXX0ke0JBU0hfUkVNQVRDSFsyXX0ke0JBU0hfUkVNQVRDSFsxXX07
CiAgICAgICAgICAgICAgICBmaQogICAgICAgICAgICAgICAgOzsKICAgICAgIGVzYWMKICAgICAg
IGVjaG8gIiR7c3ltWzBdfSAke3N5bVsxXX0gJHZhbHVlICIkKHByaW50ZiAiJXUiICQoKDE2IyR2
YWx1ZSkpKTsKICAgIGVsc2UKICAgICAgIGVjaG8gIiRGVU5DTkFNRTogTm8gVmFsdWUgZm9yIHN5
bWJvbCAke3N5bVsxXX0gYXQgJHtzeW1bMF19LiIgPiYyCiAgICBmaQogZWxzZQogICBlY2hvICIk
RlVOQ05BTUU6IFN5bWJvbCBsb29rdXAgZmFpbGVkLiIgPiYyOwogICByZXR1cm4gMTsKIGZpCiBp
ZiBbIHggPSB4JHZhbHVlIF07IHRoZW4KICAgIGVjaG8gJ09vcHMsIHZhbHVlIGNvbnZlcnNpb24g
ZmFpbGVkIG9mIHN5bWJvbCAnJHtzeW1bMV19JyBhdCAnJHtzeW1bMF19Jy4nID4mMjsKICAgIHJl
dHVybiAxOwogZmkKIHJldHVybiAwOyAKfQpkZWNsYXJlIC1pIGtzeW1fc3RhdHVzPTA7CmNhc2Ug
IiQwIiBpbgogKCoke0JBU0hfU09VUkNFfSkKICAga3N5bSAiJEAiOwogICBrc3ltX3N0YXR1cz0k
PzsKICAgOzsKZXNhYwooKGtzeW1fc3RhdHVzPT0wKSk7CgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdHRzYy9iYXNl
X3R5cGVzLmgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMDAwMAAwMDAwMDAw
ADAwMDAwMDAxMTcwADEzMDUzNjE1NTIyADAxMzA0MQAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAjaWZuZGVmIF9C
QVNFX1RZUEVTXwojZGVmaW5lIF9CQVNFX1RZUEVTXwojaW5jbHVkZSA8ZmVhdHVyZXMuaD4KI2lu
Y2x1ZGUgPHN5cy90eXBlcy5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRib29s
Lmg+CiNpbmNsdWRlIDxzdGRhcmcuaD4KdHlwZWRlZiB1bnNpZ25lZCBsb25nICBVTF90LCBVNjRf
dDsKdHlwZWRlZiB1bnNpZ25lZCBsb25nIGxvbmcgIFVMTF90LCBVMTI4X3Q7CnR5cGVkZWYgdW5z
aWduZWQgaW50ICAgVTMyX3Q7CnR5cGVkZWYgdW5zaWduZWQgc2hvcnQgVTE2X3Q7CnR5cGVkZWYg
dW5zaWduZWQgY2hhciAgYnl0ZV90OwojZW5kaWYKI2lmbmRlZiBfU1lTX1NUQVRVU18KI2RlZmlu
ZSBfU1lTX1NUQVRVU18KI2lmZGVmIE9LCiN1bmRlZiBPSwojZW5kaWYKI2lmZGVmIEZBSUwKI3Vu
ZGVmIEZBSUwKI2VuZGlmCiNpZmRlZiBFWElUX09LCiN1bmRlZiBFWElUX09LCiNlbmRpZgojaWZk
ZWYgRVhJVF9GQUlMCiN1bmRlZiBFWElUX0ZBSUwKI2VuZGlmCnR5cGVkZWYgZW51bSBzeXNfc3Rh
dHVzX2UKeyBPSyAgICAgICA9IDAgCiwgRkFJTCAgICAgPSAtMQosIEJBRF9GRCAgID0gLTEgIAos
IEVYSVRfT0sgID0gMCAKLCBFWElUX0ZBSUw9IDEKfSBTeXNTdGF0dXNfdDsKI2VuZGlmCgAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdHRzYy9rYWRkcjJv
ZmZzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA3NTUAMDAwMDAwMAAwMDAwMDAwADAw
MDAwMDAyMDMzADEzMDUzNjE0MDAzADAxMjQ3NQAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
cm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAjIS9iaW4vYmFzaAoj
IHVzZXMgb2JqZHVtcCAvcHJvYy9rY29yZSB0byBtYXAga2VybmVsIGFkZHJlc3MgdG8gPChibG9j
ay9wYWdlKSBudW1iZXIgd2l0aGluIGZpbGU+Jy4nPG9mZnNldD4Kc2V0IC1vIHBpcGVmYWlsOwpz
aG9wdCAtcyBsYXN0cGlwZTsKZnVuY3Rpb24ga2FkZHIyb2ZmcygpCnsgIGlmICgoICQjID09IDAg
KSk7IHRoZW4KICAgICAgZWNobyAiJEZVTkNOQU1FOiBleHBlY3RzIDxrZXJuZWwgYWRkcmVzcz4g
YXJndW1lbnQuIjsKICAgZmkKICAgbG9jYWwga2FkZHI9IiQxIjsKICAgbG9jYWwgbGluZTsKICAg
KG9iamR1bXAgLWZoIC9wcm9jL2tjb3JlKSB8CiAgICAgIHdoaWxlIHJlYWQgLXJkICQnXG5ccicg
bGluZSA7IGRvCiAgICAgICAgIGlmIFtbICIkbGluZSIgPX4gXltbOnNwYWNlOl1dKihbMC05XSsp
W1s6c3BhY2U6XV0rKFteWzpzcGFjZTpdXSspW1s6c3BhY2U6XV0rKFswLTlBLUZhLWZdKylbWzpz
cGFjZTpdXSsoWzAtOUEtRmEtZl0rKVtbOnNwYWNlOl1dKyhbMC05QS1GYS1mXSspW1s6c3BhY2U6
XV0rKFswLTlBLUZhLWZdKylbWzpzcGFjZTpdXSsoW15bOnNwYWNlOl1dKylbWzpzcGFjZTpdXSok
IF1dOyB0aGVuCiAgICAgICAgICAgIGxvY2FsIG51bT0ke0JBU0hfUkVNQVRDSFsxXX0gbmFtZT0k
e0JBU0hfUkVNQVRDSFsyXX0gc2l6ZT0ke0JBU0hfUkVNQVRDSFszXX0gdm1hPSR7QkFTSF9SRU1B
VENIWzRdfSBsbWE9JHtCQVNIX1JFTUFUQ0hbNV19IG9mZnM9JHtCQVNIX1JFTUFUQ0hbNl19IGFs
aWduPSR7QkFTSF9SRU1BVENIWzddfSA7CiAgICAgICAgICAgIGlmIHZtYTJvZmZzZXQgJGthZGRy
ICR2bWEgJHNpemUgJG9mZnMgNDA5NjsgdGhlbgogICAgICAgICAgICAgICByZXR1cm4gMDsKICAg
ICAgICAgICAgZmkKICAgICAgICAgZmkgICAgICAKICAgICAgZG9uZQogICByZXR1cm4gMTsKfQpk
ZWNsYXJlIC1pIGsyb19zdGF0dXM9MDsKY2FzZSAiJDAiIGluCiAoKiRCQVNIX1NPVVJDRSkKICAg
a2FkZHIyb2ZmcyAiJEAiOwogICAoKGsyb19zdGF0dXM9JD8pKTsKICAgOzsKZXNhYwooKGsyb19z
dGF0dXM9PTApKTsKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0dHNjL3RsZ3RkLmMAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMDAwMDY0NAAwMDAwMDAwADAwMDAwMDAAMDAwMDAw
MDA1MDMAMTMwNTM2MTQwMDMAMDEyMDA0ACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAHVzdGFyICAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAByb290
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACNpbmNsdWRlICJsaW51eF9n
dG9kX3BhZ2UuaCIKCmludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndiwgY2hhciAqKmVudnAp
CnsgaWYoIF9sbnhfZ3RvZC52Y2xvY2tfbW9kZSA9PSAxICkKICB7IHByaW50ZigiaXQgd29ya2Vk
ISAtIEdUT0Q6IGNsb2NrOiV1IG11bHQ6JXUgc2hpZnQ6JXVcbiIsIF9sbnhfZ3RvZC52Y2xvY2tf
bW9kZSwgX2xueF9ndG9kLm11bHQsIF9sbnhfZ3RvZC5zaGlmdCk7CiAgICBzbGVlcCgxKTsKICAg
IGxueF9ndG9kX3N5bmMoKTsKICAgIHByaW50Zigic3luY2VkIC0gbXVsdCBub3c6ICV1XG4iLF9s
bnhfZ3RvZC5tdWx0KTsKICB9Cn0KAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdHRzYy9NYWtlZmlsZQAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMDAwMAAwMDAwMDAwADAwMDAwMDAx
MDMzADEzMDUzNjE3Mzc3ADAxMjIwMgAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcm9vdAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABhbGw6dHRzYzEgdGxndGQgdm1h
Mm9mZnNldApjbGVhbjp0dHNjMS5jbGVhbgpDQz1nY2MKQ1BQRkxBR1M6PSQoQ1BQRkxBR1MpIC1J
LgpDRkxBR1M6PSQoQ0ZMQUdTKSAtc3RkPWdudTExIC1PMyAtbXR1bmU9bmF0aXZlIC1nIC1mUElD
IC1wdGhyZWFkIC1XYWxsIApMREZMQUdTPSQoQ0ZMQUdTKSAtbHB0aHJlYWQgLWxtCmlmZXEgKCQo
ZmlsdGVyIC1ES1NZTV9MT0NBVElPTiUsJChDUFBGTEFHUykpLCkKdHRzYzEubzogQ1BQRkxBR1M6
PSQoQ1BQRkxBR1MpIC1ES1NZTV9MT0NBVElPTj1cIiQoc2hlbGwgcHdkKS9rc3ltXCIKZW5kaWYK
dHRzYzEubzp0dHNjMS5jIElBNjRfdHNjX2luZm8uaCBJQTY0X3JkdHNjLmgKdGxndGQubzp0bGd0
ZC5jIGxpbnV4X2d0b2RfcGFnZS5oCnR0c2MxOiB0dHNjMS5vCnRsZ3RkOiB0bGd0ZC5vCnZtYTJv
ZmZzZXQubzp2bWEyb2Zmc2V0LmMKdm1hMm9mZnNldDogdm1hMm9mZnNldC5vCnR0c2MxLmNsZWFu
OgoJQHJtIC12ZiB0dHNjMSB0dHNjMS5vIHRsZ3RkIHRsZ3RkLm8gdm1hMm9mZnNldCB2bWEyb2Zm
c2V0Lm8KCgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdHRzYy9JQTY0X3RzY19pbmZvLmgA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMDAwMAAwMDAwMDAwADAwMDAwMDE2NjQ1
ADEzMDUzNjE0NDE2ADAxMzI1MAAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcm9vdAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAvKiBARklMRTogSUE2NF90c2NfaW5m
by5oIDogbWFrZXMgSW50ZWwgQ29yZS1pNyBBcmNoaXRlY3R1cmUgeDg2XzY0IFRTQyBJbmZvcm1h
dGlvbiBhdmFpbGFibGUgaW4gVXNlciBTcGFjZQogKiAgIHNlZTogU0RNOiAiSW50ZWzCriA2NCBh
bmQgSUEtMzIgQXJjaGl0ZWN0dXJlcyBTb2Z0d2FyZSBEZXZlbG9wZXLigJlzIE1hbnVhbCIgOiBo
dHRwczovL3NvZnR3YXJlLmludGVsLmNvbS9lbi11cy9hcnRpY2xlcy9pbnRlbC1zZG0KICogICAg
ICAgICB2MywgU0RHLCDCpyAxNy4xNjogIlRpbWUgU3RhbXAgQ291bnRlciIsIHYyLCBDaCAzLCDC
pyAxOTAgIkNQVUlEIEluc3RydWN0aW9uIiwgMyDCpyAyMDgsICJGZWF0dXJlIEluZm9ybWF0aW9u
IFJldHVybmVkIGluIEVEWCBSZWdpc3RlciIKICogQ29weWxlZnQgKEMpIDIwMTcrIEphc29uIFZh
cyBEaWFzIChKVkQpIDxqYXNvbi52YXMuZGlhc0BnbWFpbC5jb20+IC0gT25seSBBdXRob3JzaGlw
IFJpZ2h0cyBSZXNlcnZlZC4KICovCiNpZm5kZWYgX0lBNjRfVFNDX0lORk9fSF8KI2RlZmluZSBf
SUE2NF9UU0NfSU5GT19IXwojaWZuZGVmIF9feDg2XzY0CiNlcnJvciBPb3BzLCB0aGlzIGNvZGUg
aXMganVzdCBmb3IgdGhlIEludGVsIHg4Nl82NCBhcmNoaXRlY3R1cmUuCiNlbmRpZgoKI2lmbmRl
ZiBLU1lNX0xPQ0FUSU9OCiNkZWZpbmUgS1NZTV9MT0NBVElPTiAiL3Vzci9iaW4va3N5bSIKI3dh
cm5pbmcgLURLU1lNX0xPQ0FUSU9OPSBub3Qgc3BlY2lmaWVkIGluIENQUEZMQUdTIC0gZGVmYXVs
dCB2YWx1ZSAvdXNyL2Jpbi9rc3ltIGJlaW5nIHVzZWQuCiNlbmRpZgoKI2lmbmRlZiBfQkFTRV9U
WVBFU18KI2luY2x1ZGUgImJhc2VfdHlwZXMuaCIKI2VuZGlmCiNpbmNsdWRlIDx1bmlzdGQuaD4K
I2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8c3RyaW5nLmg+
CiNpbmNsdWRlIDxzdGRpby5oPgoKdHlwZWRlZiBzdHJ1Y3QgaWE2NF90c2NfbmNjY19jcHVpZF8x
NUhfcwp7IFUzMl90IHRzY19jY2NfZDsgLyogZGVub21pbmF0b3I6IFRTQyAgLyBOQ0NDIGZyZXEg
Ki8KICBVMzJfdCB0c2NfY2NjX247IC8qIG51bWVyYXRvciAgOiBUU0MgIC8gTkNDQyBmcmVxICov
CiAgICAgICAgICAgICAgICAgICAvKiBib3RoIG51bWJlcnMgYXJlIG5vcm1hbGl6ZWQgLyBtaW5p
bXVtIG51bWJlciB0byBleHByZXNzIHJhdGlvLCBOT1QgYWN0dWFsIGZyZXEgKi8KICBVMzJfdCB0
c2NfY2NjX2Y7IC8qIGFjdHVhbCBjb3JlIGNyeXN0YWwgY2xvY2sgZnJlcXVlbmN5IGluIEhaIC0g
dGhpcyBpcyB0aGUgbm9uLWFkanVzdGFibGUgbWFzdGVyIGNsb2NrIG9zY2lsbGF0b3IgZnJlcXVl
bmN5LgogICAgICAgICAgICAgICAgICAgICogTk9UIHByb2Nlc3NvciBiYXNlIGZyZXF1ZW5jeSBv
ciBIUEVUIG9yIFRTQyBvciBjb3JlIGNsb2NrIG9yIHJlZmVyZW5jZSBjbG9jayBvciBidXMgY2xv
Y2sgYW55IG90aGVyIGNsb2NrIGZyZXF1ZW5jeSEgKi8KfSBJQTY0X25jY2NfdCwgSUE2NF9UU0Nf
Tm9taW5hbF9Db3JlX0NyeXN0YWxfQ2xvY2tfdDsgCgpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRl
X18oKGFsd2F5c19pbmxpbmUpKQpib29sCklBNjRfaGFzX3RzYyh2b2lkKQp7IFUzMl90IGNhcHM9
MDsgIAogIGFzbSB2b2xhdGlsZQogICggIm1vdiAkMSwgJSVlYXhcblx0IgogICAgImNwdWlkXG5c
dCIKICAgICJtb3YgJSVlZHgsICUwIgogIDogIj1tIiAoY2FwcykgOgogIDogIiVyYXgiLCIlcmJ4
IiwiJXJjeCIsIiVyZHgiCiAgKTsKICAvLyBiaXQgNCBpcyAnaGFzX3RzYycgOgogIHJldHVybiAo
KGNhcHMgJiAoMTw8NCkpP3RydWU6ZmFsc2UpOwp9CgpzdGF0aWMgX190aHJlYWQKVTMyX3QgX2lh
NjRfbWF4X2xlYWY9MDsKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5l
KSkKYm9vbApJQTY0X2hhc19jcHVpZF9sZWFmXzE1aCh2b2lkKQp7IGlmKCBfaWE2NF9tYXhfbGVh
ZiA9PSAwICkgICAgCiAgICBhc20gdm9sYXRpbGUKICAgICggIm1vdiAkMHgwMDAwMDAwMCwgJSVl
YXhcblx0IgogICAgICAiY3B1aWRcblx0IgogICAgICAibW92ICUlZWF4LCUwIgogICAgOiAiPW0i
IChfaWE2NF9tYXhfbGVhZikgOgogICAgOiAiJXJheCIsIiVyYngiLCIlcmN4IiwiJXJkeCIKICAg
ICk7CiAgcmV0dXJuKDB4MDE0VSA8IF9pYTY0X21heF9sZWFmKTsKfQoKc3RhdGljIF9fdGhyZWFk
ClUzMl90IF9pYTY0X21heF9leHRlbmRlZF9sZWFmPTA7CnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1
dGVfXygoYWx3YXlzX2lubGluZSkpCmJvb2wKSUE2NF9oYXNfY3B1aWRfbGVhZl84MDAwMDAwN2go
dm9pZCkKeyBpZiggX2lhNjRfbWF4X2V4dGVuZGVkX2xlYWYgPT0gMCApCiAgeyBhc20gdm9sYXRp
bGUKICAgICggIm1vdiAkMHg4MDAwMDAwMCwgJSVlYXhcblx0IgogICAgICAiY3B1aWRcblx0Igog
ICAgICAibW92ICUlZWF4LCUwIgogICAgOiAiPW0iIChfaWE2NF9tYXhfZXh0ZW5kZWRfbGVhZikg
OgogICAgOiAiJXJheCIsIiVyYngiLCIlcmN4IiwiJXJkeCIKICAgICk7CiAgICBmcHJpbnRmKHN0
ZGVyciwibWF4X2V4dGVuZGVkX2xlYWY6ICV4XG4iLCBfaWE2NF9tYXhfZXh0ZW5kZWRfbGVhZik7
CiAgfQogIHJldHVybigweDgwMDAwMDA2VSA8IF9pYTY0X21heF9leHRlbmRlZF9sZWFmICk7Cn0K
CnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCmJvb2wKSUE2NF9o
YXNfY29uc3RhbnRfdHNjKHZvaWQpCnsgVTMyX3QgY2Fwcz0wOwogIGFzbSB2b2xhdGlsZQogICgg
Im1vdiAkMHg4MDAwMDAwNywgJSVlYXhcblx0IgogICAgImNwdWlkXG5cdCIKICAgICJtb3YgJSVl
ZHgsICUwIgogIDogIj1tIiAoY2FwcykgOgogIDogIiVyYXgiLCIlcmJ4IiwiJXJjeCIsIiVyZHgi
ICAKICApOwogIC8vIGJpdCA4IGlzICdjb25zdGFudF90c2MnIDoKICByZXR1cm4gKChjYXBzICYg
KDE8PDgpKT90cnVlOmZhbHNlKTsKfQoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdh
eXNfaW5saW5lKSkKYm9vbApJQTY0X2hhc19yZHRzY3Aodm9pZCkKeyBpZiggX2lhNjRfbWF4X2V4
dGVuZGVkX2xlYWYgPT0gIDBVKQogICAgSUE2NF9oYXNfY3B1aWRfbGVhZl84MDAwMDAwN2goKTsK
ICBpZigweDgwMDAwMDAxVSA+IF9pYTY0X21heF9leHRlbmRlZF9sZWFmKQogICAgcmV0dXJuIGZh
bHNlOwogIFUzMl90IGNhcHM9MDsKICBhc20gdm9sYXRpbGUKICAoICJtb3YgJDB4ODAwMDAwMDEs
ICUlZWF4XG5cdCIKICAgICJjcHVpZFxuXHQiCiAgICAibW92ICUlZWR4LCAlMCIKICA6ICI9bSIg
KGNhcHMpIDoKICA6ICIlcmF4IiwiJXJieCIsIiVyY3giLCIlcmR4IiAgCiAgKTsKICAvLyBiaXQg
MjcgaXMgJ2hhcyByZHRzY3AgJiBJQTMyX1RTQ19BVVgnIDoKICAKICByZXR1cm4gKChjYXBzICYg
KDE8PDI3KSk/dHJ1ZTpmYWxzZSk7Cn0KCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3
YXlzX2lubGluZSkpCklBNjRfbmNjY190CklBNjRfbmNjYyh2b2lkKQp7IElBNjRfbmNjY190IGk9
ezAsMCwwfTsKICBVMzJfdCB1bnU7CiAgYXNtIHZvbGF0aWxlCiAgKCAibW92ICQwLCAgICAlJWVj
eFxuXHQiCiAgICAibW92ICQweDE1LCAlJWVheFxuXHQiICAgIAogICAgImNwdWlkXG5cdCIKICAg
ICJtb3YgJSVlYXgsICUwXG5cdCIKICAgICJtb3YgJSVlYngsICUxXG5cdCIKICAgICJtb3YgJSVl
Y3gsICUyXG5cdCIKICAgICJtb3YgJSVlZHgsICUzIiAgICAKICA6ICI9bSIgKGkudHNjX2NjY19k
KSAsCiAgICAiPW0iIChpLnRzY19jY2NfbikgLAogICAgIj1tIiAoaS50c2NfY2NjX2YpICwKICAg
ICI9bSIgKHVudSkgOgogIDogIiVyYXgiLCIlcmJ4IiwiJXJjeCIsIiVyZHgiICAKICApOwogIHJl
dHVybiBpOwp9CgpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpk
b3VibGUgSUE2NF9ub21pbmFsX3RzY19mcmVxdWVuY3lfaHoocmVnaXN0ZXIgSUE2NF9uY2NjX3Qg
Km5jY2MpCnsKICBpZiggKG5jY2MtPnRzY19jY2NfZiA9PSAwKSB8fCAobmNjYy0+dHNjX2NjY19u
ID09IDApIHx8IChuY2NjLT50c2NfY2NjX2QgPT0gMCkgKQogICAgcmV0dXJuIDAuMDsKICByZXR1
cm4gKCAoKGRvdWJsZSkoIG5jY2MtPnRzY19jY2NfZiAqIG5jY2MtPnRzY19jY2NfbikpIC8gKChk
b3VibGUpbmNjYy0+dHNjX2NjY19kKSApOwp9CgpzdGF0aWMgX190aHJlYWQKaW50ICBfY3B1MGlk
X2ZkPS0xOwpzdGF0aWMgX190aHJlYWQKY2hhciBfY3B1MGlkX2RhdGFbMjU2XT17MH07CgpzdGF0
aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpib29sIElBNjRfaW5pdF9j
cHUwaWRfZGF0YSgpCnsgaWYoRkFJTCA9PSAoX2NwdTBpZF9mZCA9IG9wZW4oIi9kZXYvY3B1LzAv
Y3B1aWQiLCBPX1JET05MWSkpKQogIHsgZnByaW50ZihzdGRlcnIsX19GSUxFX18iOiVkOiVzOiBm
YWlsZWQgdG8gb3BlbiAvZGV2L2NwdS8wL2NwdWlkOiAlZDonJXMnLlxuIixfX0xJTkVfXyxfX0ZV
TkNUSU9OX18sZXJybm8sc3RyZXJyb3IoZXJybm8pKTsKICAgIHJldHVybiBmYWxzZTsKICB9CiAg
aWYoMjU2ICAhPSByZWFkKF9jcHUwaWRfZmQsIF9jcHUwaWRfZGF0YSwgMjU2KSApCiAgeyBjbG9z
ZShfY3B1MGlkX2ZkKTsKICAgIGZwcmludGYoc3RkZXJyLF9fRklMRV9fIjolZDolczogZmFpbGVk
IHRvIHJlYWQgJXUgYnl0ZXMgb24gL2Rldi9jcHUvMC9jcHVpZDogJWQ6JyVzJy5cbiIsX19MSU5F
X18sX19GVU5DVElPTl9fLCAyNTYgLCBlcnJubyxzdHJlcnJvcihlcnJubykpOwogICAgcmV0dXJu
IGZhbHNlOwogIH0KICBjbG9zZShfY3B1MGlkX2ZkKTsgIAogIHJldHVybiB0cnVlOwp9CgoKc3Rh
dGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKYm9vbApJQTY0X2hhc19u
b25zdG9wX3RzYyh2b2lkKQp7IHJlZ2lzdGVyIGNoYXIgYz0nXDAnOwogIGlmKCBfY3B1MGlkX2Zk
ID09IC0xICkKICAgIGlmKCAhIElBNjRfaW5pdF9jcHUwaWRfZGF0YSgpICkKICAgICAgcmV0dXJu
IGZhbHNlOwogIGMgPSBfY3B1MGlkX2RhdGFbICgoMyozMikrMjQpLzggXTsKICBpZiggYyAmIDEg
KQogIHsgLy9mcHJpbnRmKHN0ZGVyciwiaGFzIG5vbnN0b3AgVFNDXG4iKTsKICAgIHJldHVybiB0
cnVlOwogIH0KICByZXR1cm4gZmFsc2U7Cn0KCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygo
YWx3YXlzX2lubGluZSkpCmJvb2wKSUE2NF90c2NfaGFzX2FydCh2b2lkKQp7IHJlZ2lzdGVyIGNo
YXIgYz0nXDAnOwogIGlmKCBfY3B1MGlkX2ZkID09IC0xICkKICAgIGlmKCFJQTY0X2luaXRfY3B1
MGlkX2RhdGEoKSkKICAgICAgcmV0dXJuIGZhbHNlOwogIGMgPSBfY3B1MGlkX2RhdGFbICgoMyoz
MikrMTApLzggXTsgIAogIGlmKCBjICYgNCApCiAgewogICAgLy8gZnByaW50ZihzdGRlcnIsImhh
cyBUU0MgQVJUIGhhcmR3YXJlXG4iKTsKICAgIHJldHVybiB0cnVlOwogIH0KICByZXR1cm4gZmFs
c2U7Cn0KCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCmJvb2wK
SUE2NF9oYXNfdHNjX2FkanVzdCh2b2lkKQp7IHJlZ2lzdGVyIGNoYXIgYz0nXDAnOwogIGlmKCBf
Y3B1MGlkX2ZkID09IC0xICkKICAgIGlmKCFJQTY0X2luaXRfY3B1MGlkX2RhdGEoKSkKICAgICAg
cmV0dXJuIGZhbHNlOwogIGMgPSBfY3B1MGlkX2RhdGFbKDkqMzIrMSkvOF07CiAgaWYoIGMgJiAx
ICkKICAgIHJldHVybiB0cnVlOwogIHJldHVybiBmYWxzZTsKfQogIApfX3RocmVhZApib29sIF9p
YTY0X2ludmFyaWFudF90c2NfZW5hYmxlZD1mYWxzZTsKCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1
dGVfXygoYWx3YXlzX2lubGluZSkpCiAgYm9vbCBJQTY0X2ludmFyaWFudF90c2NfaXNfZW5hYmxl
ZCggcmVnaXN0ZXIgSUE2NF9uY2NjX3QgKm5jY2NwLCByZWdpc3RlciBkb3VibGUgKm50c2NmcXAg
KQp7IGlmKCBfY3B1MGlkX2ZkICE9IC0xICkKICAgIHJldHVybiBfaWE2NF9pbnZhcmlhbnRfdHNj
X2VuYWJsZWQ7CiAgSUE2NF9uY2NjX3QgdG47CiAgZG91YmxlIHRzY2ZxOwogIGlmKE5VTEwgPT0g
bmNjY3AgKQogICAgbmNjY3AgPSAmdG47CiAgaWYoTlVMTCA9PSBudHNjZnFwICkKICAgIG50c2Nm
cXAgPSAmdHNjZnE7ICAKICByZXR1cm4gKCBfaWE2NF9pbnZhcmlhbnRfdHNjX2VuYWJsZWQgPQog
ICggSUE2NF9oYXNfdHNjKCkgJiYKICAgIElBNjRfaGFzX2NvbnN0YW50X3RzYygpICYmCiAgICBJ
QTY0X2hhc19yZHRzY3AoKSAmJgogICAgSUE2NF9oYXNfbm9uc3RvcF90c2MoKSAmJiAgCiAgICAo
IChJQTY0X2hhc19jcHVpZF9sZWFmXzE1aCgpICYmCiAgICAgICAoIDAuMCA8ICgqbnRzY2ZxcCA9
IElBNjRfbm9taW5hbF90c2NfZnJlcXVlbmN5X2h6KCAoKm5jY2NwID0gSUE2NF9uY2NjKCksIG5j
Y2NwKSApICkgKQogICAgICApIHx8CiAgICAgIElBNjRfaGFzX2NwdWlkX2xlYWZfODAwMDAwMDdo
KCkKICAgICkKICApICk7ICAgCn0KCl9fdGhyZWFkClUzMl90IF9pYTY0X3RzY19raHo9MDsKCnN0
YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpClUzMl90IElBNjRfdHNj
X2toeigpCnsgVUxfdCBrc3ltX2FkZHI7ICAgIAogIGlmKCBfaWE2NF90c2Nfa2h6ICE9IDAgKQog
ICAgcmV0dXJuIF9pYTY0X3RzY19raHo7CiAgaWYoIF9pYTY0X2ludmFyaWFudF90c2NfZW5hYmxl
ZCB8fAogICgoX2NwdTBpZF9mZCA9PSAtMSkgJiYgSUE2NF9pbnZhcmlhbnRfdHNjX2lzX2VuYWJs
ZWQoTlVMTCxOVUxMKSkKICAgICkKICB7IHJlZ2lzdGVyIHNpemVfdCBzeiA9IGdldHBhZ2VzaXpl
KCk7CiAgICByZWdpc3RlciBjaGFyICpwYWdlID0gYWxsb2NhKHN6KTsKICAgIHJlZ2lzdGVyIGNv
bnN0IGNoYXIgKmtzeW1fbG9jYXRpb24gPSAoT0sgPT0gYWNjZXNzKCBLU1lNX0xPQ0FUSU9OLCBY
X09LICkpID8gS1NZTV9MT0NBVElPTiA6ICgoT0sgPT0gYWNjZXNzKCAiLi9rc3ltIiwgWF9PSyAp
KSA/ICIuL2tzeW0iIDogIm5vdCBmb3VuZCIpIDsKICAgIGlmKE9LICE9IGFjY2Vzcygga3N5bV9s
b2NhdGlvbiwgWF9PSyApKQogICAgeyBmcHJpbnRmKHN0ZGVycixfX0ZJTEVfXyI6JWQ6KCVzKTog
dW5hYmxlIHRvIGxvY2F0ZSBleGVjdXRhYmxlICVzIHNjcmlwdCAtIEtTWU1fTE9DQVRJT046ICVz
LlxuIixfX0xJTkVfXyxfX0ZVTkNUSU9OX18sIGtzeW1fbG9jYXRpb24sIEtTWU1fTE9DQVRJT04p
OwogICAgICByZXR1cm4gMDsKICAgIH0KICAgIHNucHJpbnRmKHBhZ2UsIHN6LCIlcyB0c2Nfa2h6
IDQiLCBrc3ltX2xvY2F0aW9uKTsKICAgIHJlZ2lzdGVyIEZJTEUgKmtzeW1fZnA9cG9wZW4ocGFn
ZSwgInIiKTsKICAgIGlmKCBmc2NhbmYoa3N5bV9mcCwgIiVseCAlcyAleFxuIiwgJmtzeW1fYWRk
ciwgcGFnZSwgJl9pYTY0X3RzY19raHopICE9IDMgKQogICAgeyBmcHJpbnRmKHN0ZGVycixfX0ZJ
TEVfXyI6JWQ6KCVzKTogL3Vzci9iaW4va3N5bSBmYWlsZWQgdG8gbG9va3VwIG9yIHByb3ZpZGUg
YSB2YWx1ZSBmb3IgdHNjX2toei5cbiIsX19MSU5FX18sX19GVU5DVElPTl9fKTsKICAgICAgZmNs
b3NlKGtzeW1fZnApOwogICAgICByZXR1cm4gMDsKICAgIH0KICAgIGZjbG9zZShrc3ltX2ZwKTsg
ICAgCiAgfQogIHJldHVybiBfaWE2NF90c2Nfa2h6Owp9CgojZW5kaWYKCgAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAB0dHNjL0lBNjRfcmR0c2MuaAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAMDAwMDY0NAAwMDAwMDAwADAwMDAwMDAAMDAwMDAwMTQ0NDUAMTMwNTM2MTQ1MzQAMDEy
NTYwACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzdGFyICAA
cm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAByb290AAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAC8qIEBGSUxFOiBJQTY0X3JkdHNjLmggOiBtYWtlcyBJbnRlbCBD
b3JlLWk3IEFyY2hpdGVjdHVyZSB4ODZfNjQgVFNDIFZhbHVlcyBhdmFpbGFibGUgaW4gVXNlciBT
cGFjZQogKiAgIHNlZTogU0RNOiAiSW50ZWzCriA2NCBhbmQgSUEtMzIgQXJjaGl0ZWN0dXJlcyBT
b2Z0d2FyZSBEZXZlbG9wZXLigJlzIE1hbnVhbCIgOiBodHRwczovL3NvZnR3YXJlLmludGVsLmNv
bS9lbi11cy9hcnRpY2xlcy9pbnRlbC1zZG0KICogICAgICAgICB2MywgU0RHLCDCpyAxNy4xNjog
IlRpbWUgU3RhbXAgQ291bnRlciIsIHYyLCBjaCA0LCDCpyA1NDcgIlJEVFNDUOKAlFJlYWQgVGlt
ZS1TdGFtcCBDb3VudGVyIGFuZCBQcm9jZXNzb3IgSUQiIGluc3RydWN0aW9uIDsKICogICAgICAg
ICBMaW51eCdzIGtlcm5lbC90aW1lL2Nsb2Nrc291cmNlLmMgY2xvY2tzX2NhbGNfbXVsdF9zaGlm
dCgpIGZ1bmN0aW9uLgogKiBDb3B5bGVmdCAoQykgMjAxNysgSmFzb24gVmFzIERpYXMgKEpWRCkg
PGphc29uLnZhcy5kaWFzQGdtYWlsLmNvbT4gLSBPbmx5IEF1dGhvcnNoaXAgUmlnaHRzIFJlc2Vy
dmVkLgogKi8KI2lmbmRlZiBfSUE2NF9SRFRTQ19IXwojZGVmaW5lIF9JQTY0X1JEVFNDX0hfCiNp
bmNsdWRlICJJQTY0X3RzY19pbmZvLmgiCiNpbmNsdWRlIDxtYXRoLmg+Cl9fdGhyZWFkClUzMl90
IF9pYTY0X3RzY191c2VyX2NwdTsgLyogVFNDIEF1eCB2YWx1ZSBpZGVudGlmaWVzIENQVSAqLwoK
c3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKVTY0X3QKSUE2NF90
c2Nfbm93KCkKeyBpZighKCAgICBfaWE2NF9pbnZhcmlhbnRfdHNjX2VuYWJsZWQKICAgICAgfHwo
KCBfY3B1MGlkX2ZkID09IC0xKSAmJiBJQTY0X2ludmFyaWFudF90c2NfaXNfZW5hYmxlZChOVUxM
LE5VTEwpKQogICAgICApCiAgICApCiAgeyBmcHJpbnRmKHN0ZGVyciwgX19GSUxFX18iOiVkOigl
cyk6IG11c3QgYmUgY2FsbGVkIHdpdGggaW52YXJpYW50IFRTQyBlbmFibGVkLlxuIixfX0xJTkVf
XyxfX0ZVTkNUSU9OX18pOwogICAgcmV0dXJuIDA7CiAgfQogIFUzMl90IHRzY19oaSwgdHNjX2xv
OwogIHJlZ2lzdGVyIFVMX3QgdHNjOwogIGFzbSB2b2xhdGlsZQogICggInJkdHNjcFxuXHQiCiAg
ICAibW92ICUlZWR4LCAlMFxuXHQiCiAgICAibW92ICUlZWF4LCAlMVxuXHQiCiAgICAibW92ICUl
ZWN4LCAlMlxuXHQiICAKICA6ICI9bSIgKHRzY19oaSkgLAogICAgIj1tIiAodHNjX2xvKSAsCiAg
ICAiPW0iIChfaWE2NF90c2NfdXNlcl9jcHUpIDogIAogIDogIiVyYXgiLCIlcmN4IiwiJXJkeCIK
ICApOwogIHRzYz0oKChVTF90KXRzY19oaSkgPDwgMzIpfCgoVUxfdCl0c2NfbG8pOwogIHJldHVy
biB0c2M7Cn0KCl9fdGhyZWFkClU2NF90IF9pYTY0X2ZpcnN0X3RzYyA9IDB4ZmZmZmZmZmZmZmZm
ZmZmZlVMOwoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKVTY0
X3QgSUE2NF90c2NfdGlja3Nfc2luY2Vfc3RhcnQoKQp7IGlmKF9pYTY0X2ZpcnN0X3RzYyA9PSAw
eGZmZmZmZmZmZmZmZmZmZmZVTCkKICB7IF9pYTY0X2ZpcnN0X3RzYyA9IElBNjRfdHNjX25vdygp
OwogICAgcmV0dXJuIDA7CiAgfQogIHJldHVybiAoSUE2NF90c2Nfbm93KCkgLSBfaWE2NF9maXJz
dF90c2MpIDsKfQoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkK
VTY0X3QgSUE2NF9zX25zX3NpbmNlX3N0YXJ0X2EoKQp7IHN0YXRpYyBfX3RocmVhZAogIFUxMjhf
dCBfdHNjX3BfcyA9IH4wVUxMOwogIGlmKCBfdHNjX3BfcyA9PSB+MFVMTCApCiAgICBfdHNjX3Bf
cyA9ICAxMDAwMDAwMDAwMDAwVUxMIC8gIAogICAgICAgKCAoKFUxMjhfdClJQTY0X3RzY19raHoo
KSkgKiAxMDAwVUxMICkKICAgIDsgLyogbnVtYmVyIG9mIHBldGE/LSgxZS0xMilzZWNvbmRzIHBl
ciBUU0MgdGljayAqLwogIHJlZ2lzdGVyIFUxMjhfdCBuX3BzID0gSUE2NF90c2NfdGlja3Nfc2lu
Y2Vfc3RhcnQoKSAqIF90c2NfcF9zOyAgICAgICAgICAgICAgICAgICAgLyogMWUtMTIgc2Vjb25k
cyAqLwogIHJlZ2lzdGVyIFVMX3QgICBuICAgID0gKG5fcHMgLyAxMDAwVUxMKSArICgobl9wcyAl
IDEwMDBVTEw+NDk5KT8xOjApIDsKICByZWdpc3RlciBVTF90ICAgcyAgICA9IG4gLyAxMDAwMDAw
MDAwVUw7CiAgcmVnaXN0ZXIgVUxfdCAgIG5fbnMgPSBuICUgMTAwMDAwMDAwMFVMOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAxZS05ICBzZWNvbmRzICovICAK
ICByZXR1cm4gICggKHMgPDwgMzIpIHwgbl9ucyApOyAgCn0KCnN0YXRpYyBpbmxpbmUgX19hdHRy
aWJ1dGVfXygoYWx3YXlzX2lubGluZSkpClU2NF90IElBNjRfc19uc19zaW5jZV9zdGFydF9iKCkK
eyBzdGF0aWMgX190aHJlYWQKICBkb3VibGUgX3RzY19wX3MgPSAwLjA7CiAgaWYoIF90c2NfcF9z
ID09IDAuMCApCiAgICBfdHNjX3BfcyA9IDEuMCAvIChJQTY0X3RzY19raHooKSAqIDFlMyk7CiAg
cmVnaXN0ZXIgVUxfdCB0aWNrcyAgPSBJQTY0X3RzY190aWNrc19zaW5jZV9zdGFydCgpIDsKICBy
ZWdpc3RlciBkb3VibGUgdHMgICA9IHRpY2tzICogX3RzY19wX3M7CiAgcmVnaXN0ZXIgVUxfdCAg
IHMgICAgPSBmbG9vciggKCB0cyAqIDFlOSApIC8gMWU5ICk7CiAgcmVnaXN0ZXIgVUxfdCAgIG5f
bnMgPSAoIHRzICogMWU5ICkgLSBzOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiAxZS05ICBzZWNvbmRzICovICAKICByZXR1cm4gICggKHMgPDwgMzIpIHwgbl9u
cyApOyAgCn0KCiNkZWZpbmUgTlNFQ19QRVJfU0VDIDEwMDAwMDAwMDAKCnN0YXRpYyBpbmxpbmUg
X19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCnZvaWQKaWE2NF90c2NfY2FsY19tdWx0X3No
aWZ0CiggcmVnaXN0ZXIgVTMyX3QgKm11bHQsCiAgcmVnaXN0ZXIgVTMyX3QgKnNoaWZ0CikKeyAv
KiBwYXJhcGhyYXNlcyBMaW51eCBjbG9ja3NvdXJjZS5jJ3MgY2xvY2tzX2NhbGNfbXVsdF9zaGlm
dCgpIGZ1bmN0aW9uOgogICAqIGNhbGN1bGF0ZXMgc2Vjb25kICsgbmFub3NlY29uZCBtdWx0ICsg
c2hpZnQgaW4gc2FtZSB3YXkgbGludXggZG9lcy4gCiAgICogSXQgaXMgYSBzaGFtZSB3ZSBjYW5u
b3QgdXNlIG51bWVyaWNhbGx5IGFjY3VyYXRlIHZhbHVlcyBjYWxjdWxhdGVkIGFzIGluIElBNjRf
c19uc19zaW5jZV9zdGFydF9iKCkKICAgKiBvciBJQTY0X3NfbnNfc2luY2Vfc3RhcnRfYSgpIGFi
b3ZlLCBidXQgdGhleSB0YWtlIG11Y2ggbG9uZ2VyIGFzIHRoZXkgdXNlIGxvbmcgcmVnaXN0ZXJz
LCBhbmQgCiAgICogd2Ugd2FudCB0byBiZSBjb21wYXRpYmxlIHdpdGggd2hhdCBsaW51eCByZXR1
cm5zIGluIHN0cnVjdCB0aW1lc3BlYyB0cyBhZnRlciBjYWxsIHRvIAogICAqIGNsb2NrX2dldHRp
bWUoQ0xPQ0tfTU9OT1RPTklDX1JBVywgJnRzKS4KICAgKi8KICBjb25zdCBVMzJfdCBzY2FsZT0x
MDAwVTsKICByZWdpc3RlciBVMzJfdCBmcm9tPSBJQTY0X3RzY19raHooKTsKICByZWdpc3RlciBV
MzJfdCB0byAgPSBOU0VDX1BFUl9TRUMgLyBzY2FsZTsKICByZWdpc3RlciBVNjRfdCBzZWMgPSAo
IH4wVUwgLyBmcm9tICkgLyBzY2FsZTsgIAogIHNlYyA9IChzZWMgPiA2MDApID8gNjAwIDogKChz
ZWMgPiAwKSA/IHNlYyA6IDEpOwogIHJlZ2lzdGVyIFU2NF90IG1heHNlYyA9IHNlYyAqIHNjYWxl
OwogIFVMX3QgdG1wOwogIFUzMl90IHNmdCwgc2Z0YWNjPTMyOwogIC8qCiAgICogQ2FsY3VsYXRl
IHRoZSBzaGlmdCBmYWN0b3Igd2hpY2ggaXMgbGltaXRpbmcgdGhlIGNvbnZlcnNpb24KICAgKiBy
YW5nZToKICAgKi8KICB0bXAgPSAobWF4c2VjICogZnJvbSkgPj4gMzI7CiAgd2hpbGUgKHRtcCkK
ICB7IHRtcCA+Pj0xOwogICAgc2Z0YWNjLS07CiAgfQogIC8qCiAgICogRmluZCB0aGUgY29udmVy
c2lvbiBzaGlmdC9tdWx0IHBhaXIgd2hpY2ggaGFzIHRoZSBiZXN0CiAgICogYWNjdXJhY3kgYW5k
IGZpdHMgdGhlIG1heHNlYyBjb252ZXJzaW9uIHJhbmdlOgogICAqLwogIGZvciAoc2Z0ID0gMzI7
IHNmdCA+IDA7IHNmdC0tKSAKICB7IHRtcCA9ICgoVUxfdCkgdG8pIDw8IHNmdDsKICAgIHRtcCAr
PSBmcm9tIC8gMjsKICAgIHRtcCA9IHRtcCAvIGZyb207CiAgICBpZiAoKHRtcCA+PiBzZnRhY2Mp
ID09IDApCiAgICAgIGJyZWFrOwogIH0KICAqbXVsdCA9IHRtcDsKICAqc2hpZnQgPSBzZnQ7Cn0K
Cl9fdGhyZWFkClUzMl90IF9pYTY0X3RzY19tdWx0ID0gfjBVLCBfaWE2NF90c2Nfc2hpZnQ9fjBV
OwoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKVTY0X3QgSUE2
NF9zX25zX3NpbmNlX3N0YXJ0KCkKeyBpZiggKCBfaWE2NF90c2NfbXVsdCA9PSB+MFUgKSB8fCAo
IF9pYTY0X3RzY19zaGlmdCA9PSB+MFUgKSApCiAgICBpYTY0X3RzY19jYWxjX211bHRfc2hpZnQo
ICZfaWE2NF90c2NfbXVsdCwgJl9pYTY0X3RzY19zaGlmdCk7CiAgcmVnaXN0ZXIgVTY0X3QgY3lj
bGVzID0gSUE2NF90c2NfdGlja3Nfc2luY2Vfc3RhcnQoKTsgICAKICByZWdpc3RlciBVNjRfdCBu
cyA9ICgoY3ljbGVzICooKFVMX3QpX2lhNjRfdHNjX211bHQpKT4+X2lhNjRfdHNjX3NoaWZ0KTsK
ICByZXR1cm4oICgoKG5zIC8gTlNFQ19QRVJfU0VDKSYweGZmZmZmZmZmVUwpIDw8IDMyKSB8ICgo
bnMgJSBOU0VDX1BFUl9TRUMpJjB4M2ZmZmZmZmZVTCkgKTsKICAvKiBZZXMsIHdlIGFyZSBwdXJw
b3NlZnVsbHkgaWdub3JpbmcgZHVyYXRpb25zIG9mIG1vcmUgdGhhbiA0LjIgYmlsbGlvbiBzZWNv
bmRzIGhlcmUhICovCn0KCi8qY3Jhc2g+IHAveCAgdnN5c2NhbGxfZ3RvZF9kYXRhCiQ0ID0gewog
IHNlcSA9IDB4YjMxYjY0LAogIHZjbG9ja19tb2RlID0gMHgxLAogIGN5Y2xlX2xhc3QgPSAweDYz
MThmNmU5MzFhZSwKICBtYXNrID0gMHhmZmZmZmZmZmZmZmZmZmZmLAogIG11bHQgPSAweDU4N2Fm
ZCwKICBzaGlmdCA9IDB4MTgsCiAgd2FsbF90aW1lX3Nuc2VjID0gMHgzN2NjZDVkYjljY2I4YSwK
ICB3YWxsX3RpbWVfc2VjID0gMHg1OGE2Nzg4YiwKICBtb25vdG9uaWNfdGltZV9zZWMgPSAweDkz
MGMsCiAgbW9ub3RvbmljX3RpbWVfc25zZWMgPSAweDM4NDhhNjI1OWNjYjhhLAogIHdhbGxfdGlt
ZV9jb2Fyc2Vfc2VjID0gMHg1OGE2Nzg4YiwKICB3YWxsX3RpbWVfY29hcnNlX25zZWMgPSAweDM3
Y2NkNWRiLAogIG1vbm90b25pY190aW1lX2NvYXJzZV9zZWMgPSAweDkzMGMsCiAgbW9ub3Rvbmlj
X3RpbWVfY29hcnNlX25zZWMgPSAweDM4NDhhNjI1LAogIHR6X21pbnV0ZXN3ZXN0ID0gMHgwLAog
IHR6X2RzdHRpbWUgPSAweDAKfQoKCmNyYXNoPiBwICB2c3lzY2FsbF9ndG9kX2RhdGEKdnN5c2Nh
bGxfZ3RvZF9kYXRhID0gJDMgPSB7CiAgc2VxID0gMTE0MzU1MjgsCiAgdmNsb2NrX21vZGUgPSAx
LAogIGN5Y2xlX2xhc3QgPSAxMDYyNDE1NTI5Njc3NDcsCiAgbWFzayA9IDE4NDQ2NzQ0MDczNzA5
NTUxNjE1LAogIG11bHQgPSA1Nzk4NjUzLAogIHNoaWZ0ID0gMjQsCiAgd2FsbF90aW1lX3Nuc2Vj
ID0gMTI3MTc2MTY1NTA4ODk3MzIsCiAgd2FsbF90aW1lX3NlYyA9IDE0ODczMDM5MDQsCiAgbW9u
b3RvbmljX3RpbWVfc2VjID0gMzY3MDUsCiAgbW9ub3RvbmljX3RpbWVfc25zZWMgPSAxMjg1Mzc1
MTA3NTgxNzczMiwKICB3YWxsX3RpbWVfY29hcnNlX3NlYyA9IDE0ODczMDM5MDQsCiAgd2FsbF90
aW1lX2NvYXJzZV9uc2VjID0gNzU4MDI5MDE2LAogIG1vbm90b25pY190aW1lX2NvYXJzZV9zZWMg
PSAzNjcwNSwKICBtb25vdG9uaWNfdGltZV9jb2Fyc2VfbnNlYyA9IDc2NjE0MzI2NiwKICB0el9t
aW51dGVzd2VzdCA9IDAsCiAgdHpfZHN0dGltZSA9IDAKfQoKSW5zcGVjdGlvbiBzaG93cyB0aGF0
IGFib3ZlIGNvZGUgY2FsY3VsYXRlcyBTQU1FIG11bHQgYW5kIHNoaWZ0IHZhbHVlcyBhcyBpbiAK
dGhlIGFjdHVhbCBsaW51eCB2c3lzY2FsbF9ndG9kX2RhdGEgJ3NoaWZ0JyBhbmQgJ211bHQnIHZh
bHVlcywgYW5kIHRoYXQgCnRoZSBleHByZXNzaW9uIDoKICAgICgoY3ljbGVzICooKFVMX3QpX2lh
NjRfdHNjX211bHQpKT4+X2lhNjRfdHNjX3NoaWZ0KQphY3R1YWxseSBkb2VzIGNvcnJlc3BvbmQg
dG8gd2hhdCBsaW51eCB3b3VsZCBkbyB3aXRoIHRoZSBUU0MgdmFsdWUgdG8gZ2V0IHRpbWVzcGVj
IHR2X3NlYyAoaGlnaCA2NCBiaXRzKSAKYW5kIHRpbWVzcGVjIHR2X25zZWMgKGxvdyAzMCBiaXRz
KSAuCgpJTUhPLCBJdCBpcyBhIHNoYW1lIHRoYXQgdGhlIGFjdHVhbCBoYXJkd2FyZSBBUlQgbnVt
ZXJhdG9yICsgZGVub21pbmF0b3IgKyBDcnlzdGFsIENsb2NrIGZyZXF1ZW5jeSBhcmVuJ3QKYWN0
dWFsbHkgdXNlZCBpbiBMaW51eCdzIGNhbGN1bGF0aW9ucyEgKGV4Y2VwdCBpbiBlMTAwMCBkcml2
ZXIncyAnUFRQJyB0aW1lc3RhbXAtc3luY2hyb25pemF0aW9uLXdpdGgtcmVtb3RlLWhvc3QgY29k
ZSkuCiAqLwojZW5kaWYKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAdHRzYy90dHNjMS5jAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQA
MDAwMDAwMAAwMDAwMDAwADAwMDAwMDEwNTQwADEzMDUzNjE1NDUyADAxMTczNwAgMAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAvKiB0dHNjMS5jIDogRGVtb25zdHJhdGVzIGxhdGVuY3kgb2YgdXNlIG9mIElBNjRfcmR0
c2MuaCdzIElBNjRfc19uc19zaW5jZV9zdGFydCgpICB2cy4gdXNpbmcgY2xvY2tfZ2V0dGltZShD
TE9DS19NT05PVE9OSUNfUkFXKQogKi8KI2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZmVh
dHVyZXMuaD4KI2luY2x1ZGUgPHN5cy90eXBlcy5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNs
dWRlIDxzdGRhcmcuaD4KI2luY2x1ZGUgPHN0ZGJvb2wuaD4KI2luY2x1ZGUgPHRpbWUuaD4KI2lu
Y2x1ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPGVycm5vLmg+
CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHB0aHJlYWQuaD4KI2luY2x1ZGUgPHNldGpt
cC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgoKI2luY2x1ZGUgIklB
NjRfdHNjX2luZm8uaCIKI2luY2x1ZGUgIklBNjRfcmR0c2MuaCIKCmludCBtYWluKGludCBhcmdj
LCBjb25zdCBjaGFyICpjb25zdCogYXJndiwgY29uc3QgY2hhciAqY29uc3QqIGVudnApCnsgYm9v
bAogICAgaGFzX3RzYyAgICAgICAgID1JQTY0X2hhc190c2MoKQogICwgaGFzX2NvbnN0YW50X3Rz
Yz1JQTY0X2hhc19jb25zdGFudF90c2MoKQogICwgaGFzXzE1aCAgICAgICAgID1JQTY0X2hhc19j
cHVpZF9sZWFmXzE1aCgpCiAgLCBoYXNfODAwMDAwMDdoICAgPUlBNjRfaGFzX2NwdWlkX2xlYWZf
ODAwMDAwMDdoKCk7CiAgZnByaW50ZihzdGRlcnIsImhhcyB0c2M6ICV1IGNvbnN0YW50OiAldVxu
IixoYXNfdHNjLCBoYXNfY29uc3RhbnRfdHNjKTsKICBpZiggaGFzX3RzYyAmJiBoYXNfY29uc3Rh
bnRfdHNjICkKICB7IFVMX3QgdHNjX2toeiA9IElBNjRfdHNjX2toeigpOwogICAgSUE2NF9uY2Nj
X3QgbmNjYz17MH07CiAgICBkb3VibGUgdHNjX25fZnJlcT0wLjA7CiAgICBib29sIHRzY19pc19l
bmFibGVkID0gSUE2NF9pbnZhcmlhbnRfdHNjX2lzX2VuYWJsZWQoJm5jY2MsICZ0c2Nfbl9mcmVx
KTsKICAgIGlmKCB0c2NfaXNfZW5hYmxlZCAmJiAgaGFzXzE1aCApCiAgICAgICAgZnByaW50Zihz
dGRlcnIsIkludmFyaWFudCBUU0MgaXMgZW5hYmxlZCA6IFRTQyAvIENDQzogJXUgLyAldSA9ICV1
IDsgQ0NDIGZyZXE6ICV1SHogIE5vbWluYWwgVFNDIGZyZXE6OiAlLjlFSHogOiBBY3R1YWwgVFND
IGZyZXE6ICUuOUdHSHogLSBUU0MgYWRqdXN0OiAldS5cbiIKICAgICAgICAsIG5jY2MudHNjX2Nj
Y19uICwgbmNjYy50c2NfY2NjX2QKICAgICAgICAsIG5jY2MudHNjX2NjY19uIC8gbmNjYy50c2Nf
Y2NjX2QKICAgICAgICAsIG5jY2MudHNjX2NjY19mCiAgICAgICAgLCB0c2Nfbl9mcmVxCiAgICAg
ICAgLCAoKChkb3VibGUpdHNjX2toeikqMWUzKS8xZTkKICAgICAgICAsIElBNjRfaGFzX3RzY19h
ZGp1c3QoKQogICAgICAgICk7CiAgICBlbHNlIGlmKCB0c2NfaXNfZW5hYmxlZCAmJiAgaGFzXzgw
MDAwMDA3aCApICAgICAKICAgICAgZnByaW50ZihzdGRlcnIsIkludmFyaWFudCBUU0MgaXMgZW5h
YmxlZDogQWN0dWFsIFRTQyBmcmVxOiAlLjlHR0h6IC0gVFNDIGFkanVzdDogJXUuXG4iLCgoKGRv
dWJsZSl0c2Nfa2h6KSoxZTMpLzFlOSwgSUE2NF9oYXNfdHNjX2FkanVzdCgpKTsKICAgIGlmKHRz
Y19pc19lbmFibGVkKQogICAgeyBzdHJ1Y3QgdGltZXNwZWMgdHNwMSwgdHNwMiwgdHNwX2IsIHRz
cF9lOwogICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQ19SQVcsJnRzcF9iKTsKICAg
ICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUNfUkFXLCZ0c3AxKTsKICAgICAgY2xvY2tf
Z2V0dGltZShDTE9DS19NT05PVE9OSUNfUkFXLCZ0c3AyKTsgICAgICAgICAgICAKICAgICAgcmVn
aXN0ZXIgVUxfdCB0czAgPSBJQTY0X3NfbnNfc2luY2Vfc3RhcnQoKTsgICAgICAKICAgICAgcmVn
aXN0ZXIgVUxfdCB0czIgPSBJQTY0X3NfbnNfc2luY2Vfc3RhcnQoKTsKICAgICAgcmVnaXN0ZXIg
VUxfdCB0czEgPSB0czI7CiAgICAgIHJlZ2lzdGVyIFVMX3QgdHMzID0gSUE2NF9zX25zX3NpbmNl
X3N0YXJ0KCk7CiAgICAgIGNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDX1JBVywmdHNwX2Up
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICByZWdpc3RlciBVMTI4
X3QKICAgICAgICBuX25zMT0oKCgoKFUxMjhfdCl0c3AyLnR2X3NlYykgKiAxMDAwMDAwMDAwVUxM
KSArICgoVTEyOF90KSB0c3AyLnR2X25zZWMpKSAtICAgICAgCiAgICAgICAgICAgICAgICgoKChV
MTI4X3QpdHNwMS50dl9zZWMpICogMTAwMDAwMDAwMFVMTCkgKyAoKFUxMjhfdCkgdHNwMS50dl9u
c2VjKSkpCiAgICAgICwgbl9uczI9KCgoKChVMTI4X3QpdHNwX2UudHZfc2VjKSAqIDEwMDAwMDAw
MDBVTEwpICsgKChVMTI4X3QpIHRzcF9lLnR2X25zZWMpKSAtICAgICAgCiAgICAgICAgICAgICAg
ICgoKChVMTI4X3QpdHNwX2IudHZfc2VjKSAqIDEwMDAwMDAwMDBVTEwpICsgKChVMTI4X3QpIHRz
cF9iLnR2X25zZWMpKSk7CiAgICAgIGZwcmludGYoc3RkZXJyLCAidHMyIC0gdHMxOiAlbHUgdHMz
IC0gdHMyOiAlbHUgbnMxOiAldS4lLjl1IG5zMjogJXUuJS45dVxuIiwKICAgICAgICB0czIgLSB0
czAsIHRzMy10czIKICAgICAgLCAoVTMyX3QpKChuX25zMSAvIDEwMDAwMDAwMDBVTEwpJjB4ZmZm
ZmZmZmZVTCksIChVMzJfdCkoKG5fbnMxICUgMTAwMDAwMDAwMFVMTCkgJiAweGZmZmZmZmZmVUwp
CiAgICAgICwgKFUzMl90KSgobl9uczIgLyAxMDAwMDAwMDAwVUxMKSYweGZmZmZmZmZmVUwpLCAo
VTMyX3QpKChuX25zMiAlIDEwMDAwMDAwMDBVTEwpICYgMHhmZmZmZmZmZlVMKQogICAgICApOwog
ICAgICByZWdpc3RlciBieXRlX3QgaTsgICAgCiAgICAgIGZvciggaSA9IDA7IGkgPCAxMDsgaSs9
MSApCiAgICAgIHsgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUNfUkFXLCZ0c3AxKTsKICAg
ICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQ19SQVcsJnRzcDIpOyAgICAgIAogICAg
ICAgIHRzMiA9IElBNjRfc19uc19zaW5jZV9zdGFydCgpOyAgICAgIAogICAgICAgIHRzMyA9IElB
NjRfc19uc19zaW5jZV9zdGFydCgpOwogICAgICAgIG5fbnMxPSgoKCgoVTEyOF90KXRzcDIudHZf
c2VjKSAqIDEwMDAwMDAwMDBVTEwpICsgKChVMTI4X3QpIHRzcDIudHZfbnNlYykpIC0gICAgICAK
ICAgICAgICAgICAgICAgKCgoKFUxMjhfdCl0c3AxLnR2X3NlYykgKiAxMDAwMDAwMDAwVUxMKSAr
ICgoVTEyOF90KSB0c3AxLnR2X25zZWMpKSkKICAgICAgICAgICAgICA7CiAgICAgICAgZnByaW50
ZihzdGRlcnIsICJ0czMgLSB0czI6ICVsdSBuczE6ICV1LiUuOXVcbiIsCiAgICAgICAgICB0czMg
LSB0czIKICAgICAgICAsIChVMzJfdCkoKG5fbnMxIC8gMTAwMDAwMDAwMFVMTCkmMHhmZmZmZmZm
ZlUpCiAgICAgICAgLCAoVTMyX3QpKChuX25zMSAlIDEwMDAwMDAwMDBVTEwpICYgMHhmZmZmZmZm
ZlVMKQogICAgICAgICk7CiAgICAgICAgdHMxPSBJQTY0X3NfbnNfc2luY2Vfc3RhcnQoKTsKICAg
ICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQ19SQVcsJnRzcF9lKTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKICAgICAgfQogICAgICBuX25zMj0oKCgoKFUxMjhfdCl0c3Bf
ZS50dl9zZWMpICogMTAwMDAwMDAwMFVMTCkgKyAoKFUxMjhfdCkgdHNwX2UudHZfbnNlYykpIC0g
ICAgICAKICAgICAgICAgICAgKCgoKFUxMjhfdCl0c3BfYi50dl9zZWMpICogMTAwMDAwMDAwMFVM
TCkgKyAoKFUxMjhfdCkgdHNwX2IudHZfbnNlYykpKTsgICAgICAKICAgICAgZnByaW50ZihzdGRl
cnIsICJ0MSAtIHQwOiAlbHUgLSBuczI6ICV1LiUuOXVcbiIsCiAgICAgICAgdHMxIC0gdHMwCiAg
ICAgICwgKFUzMl90KSgobl9uczIgLyAxMDAwMDAwMDAwVUxMKSYweGZmZmZmZmZmVSksIChVMzJf
dCkoKG5fbnMyICUgMTAwMDAwMDAwMFVMTCkgJiAweGZmZmZmZmZmVUwpCiAgICAgICk7ICAgICAg
CiAgICB9IGVsc2UKICAgIHsgIGZwcmludGYoc3RkZXJyLF9fRklMRV9fIiVkOiglcyk6IHNvcnJ5
LCBtb2Rlcm4gN3RoLWdlbmVyYXRpb24gSW50ZWwgXCJJbnZhcmlhbnQgVFNDXCIgd2l0aCBBUlQg
KGFsd2F5cyBydW5uaW5nIHRpbWVyKSBpcyBub3QgZnVsbHkgZW5hYmxlZCBvbiB0aGlzIHBsYXRm
b3JtIDpcblx0aGFzX3RzYzogJXUgaGFzX2xlYWZfMTVoOiAldSBoYXNfbGVhZl84MDAwMDAwN2g6
ICV1IGhhc19jb25zdGFudF90c2M6ICV1IGhhc19yZHRzY3A6ICV1IGhhc19ub25zdG9wX3RzYzog
JXUgXG4iLF9fTElORV9fLF9fRlVOQ1RJT05fXywKICAgICAgIGhhc190c2MgLCBoYXNfMTVoLCBo
YXNfODAwMDAwMDdoLCBoYXNfY29uc3RhbnRfdHNjLAogICAgICAgSUE2NF9oYXNfcmR0c2NwKCks
CiAgICAgICBJQTY0X2hhc19ub25zdG9wX3RzYygpCiAgICAgICk7CiAgICB9CiAgfQogIHJldHVy
biAwOwp9CgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0dHNj
L2xpbnV4X2d0b2RfcGFnZS5oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMDAwMDY0NAAwMDAwMDAwADAw
MDAwMDAAMDAwMDAwMTA2NjEAMTMwNTM2MTU2MzEAMDE0MDYxACAwAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzdGFyICAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAByb290AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACNpZm5k
ZWYgX0xJTlVYX0dUT0RfUEFHRV9IXwojZGVmaW5lIF9MSU5VWF9HVE9EX1BBR0VfSF8KI2RlZmlu
ZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZmVhdHVyZXMuaD4KI2luY2x1ZGUgPHN5cy90eXBlcy5o
PgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRhcmcuaD4KI2luY2x1ZGUgPHN0ZGJv
b2wuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8dGltZS5oPgojaW5jbHVkZSA8c3lz
L3N0YXQuaD4KI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDxzeXMvbW1hbi5oPgojaW5j
bHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2lu
Y2x1ZGUgPHB0aHJlYWQuaD4KI2luY2x1ZGUgPHNldGptcC5oPgojaW5jbHVkZSA8c3RkaW8uaD4K
I2luY2x1ZGUgPHN0ZGxpYi5oPgoKI2luY2x1ZGUgImJhc2VfdHlwZXMuaCIKCnR5cGVkZWYgdW5z
aWduZWQgbG9uZyBndG9kX2xvbmdfdDsKLyogY29waWVkIGZyb20gTGludXgncyBhcmNoL3g4Ni9p
bmNsdWRlL2FzbS92Z3RvZC5oIDoKICovICAKc3RydWN0IHZzeXNjYWxsX2d0b2RfZGF0YSB7Cgl1
bnNpZ25lZCBzZXE7CgoJaW50IHZjbG9ja19tb2RlOwoJVTY0X3QJY3ljbGVfbGFzdDsKCVU2NF90
CW1hc2s7CglVMzJfdAltdWx0OwoJVTMyX3QJc2hpZnQ7CgoJLyogb3BlbiBjb2RlZCAnc3RydWN0
IHRpbWVzcGVjJyAqLwoJVTY0X3QJCXdhbGxfdGltZV9zbnNlYzsKCWd0b2RfbG9uZ190CXdhbGxf
dGltZV9zZWM7CglndG9kX2xvbmdfdAltb25vdG9uaWNfdGltZV9zZWM7CglVNjRfdAkJbW9ub3Rv
bmljX3RpbWVfc25zZWM7CglndG9kX2xvbmdfdAl3YWxsX3RpbWVfY29hcnNlX3NlYzsKCWd0b2Rf
bG9uZ190CXdhbGxfdGltZV9jb2Fyc2VfbnNlYzsKCWd0b2RfbG9uZ190CW1vbm90b25pY190aW1l
X2NvYXJzZV9zZWM7CglndG9kX2xvbmdfdAltb25vdG9uaWNfdGltZV9jb2Fyc2VfbnNlYzsKCglp
bnQJCXR6X21pbnV0ZXN3ZXN0OwoJaW50CQl0el9kc3R0aW1lOwp9OwoKI2lmbmRlZiBQQUdFX1NJ
WkUKI2RlZmluZSBQQUdFX1NJWkUgNDA5NlUKI2VuZGlmCgpfX3RocmVhZCAKICBzdHJ1Y3QgdnN5
c2NhbGxfZ3RvZF9kYXRhIF9sbnhfZ3RvZCA9IHswfTsKICA7Cl9fdGhyZWFkIAogIGludCBfbG54
X2tjb3JlX2ZkPUJBRF9GRAogIDsKX190aHJlYWQgCiAgVUxfdCBfbG54X2d0b2RfcGFnZT0wCiAg
ICAgLCBfbG54X2d0b2Rfb2Zmcz0wCiAgOwpfX3RocmVhZAogIGJvb2wgX2xueF9jbG9zZV9rY29y
ZV9mZD1mYWxzZTsKCnN0YXRpYyBjb25zdCBjaGFyIF9sbnhfZ3RvZF9nZXRfYWRkcmVzc19jbWRb
XSA9CiIvYmluL2Jhc2ggLWMgJ2tzeW0gdnN5c2NhbGxfZ3RvZF9kYXRhIDQgfCB3aGlsZSByZWFk
IGFkZHIgbmFtZSByZXN0OyBkbyBrYWRkcjJvZmZzICRhZGRyOyBkb25lJyIKICA7CgpzdGF0aWMg
dm9pZCBfaW5pdF9sbnhfZ3RvZF9wYWdlKHZvaWQpCnsgY2hhciBidWZbNjRdOwogIHJlZ2lzdGVy
IGJvb2wgbmVlZHNfcHV0ZW52PWZhbHNlOyAKICBpZiggX2xueF9ndG9kX3BhZ2UgPT0gMCApCiAg
eyByZWdpc3RlciBjb25zdCBjaGFyICpwID0gZ2V0ZW52KCJMSU5VWF9HVE9EX1BBR0VfQU5EX09G
RlNFVCIpIDsKICAgIHJlZ2lzdGVyIGNvbnN0IGNoYXIgKmI9cDsKICAgIGlmKCBwID09IE5VTEwg
KQogICAgeyBGSUxFICpwZnA9cG9wZW4oX2xueF9ndG9kX2dldF9hZGRyZXNzX2NtZCwgInIiKTsK
ICAgICAgaWYoIHBmcCAhPSBOVUxMICkKICAgICAgeyBpZihmc2NhbmYocGZwLCAiJTYzcyIsICZi
dWZbMF0pICE9IDEpCiAgICAgICAgeyBmcHJpbnRmKHN0ZGVyciwiT29wcywgZmFpbGVkIHRvIGRl
dGVybWluZSBhZGRyZXNzIG9mIHZzeXNjYWxsX2d0b2RfZGF0YSB1c2luZyBjb21tYW5kOiAnJXMn
LlxuIiwgX2xueF9ndG9kX2dldF9hZGRyZXNzX2NtZCk7CiAgICAgICAgICBmY2xvc2UocGZwKTsK
ICAgICAgICAgIHJldHVybjsKICAgICAgICB9CiAgICAgICAgZmNsb3NlKHBmcCk7CiAgICAgIH0K
ICAgICAgcCA9ICZidWZbMF07CiAgICAgIGIgPSBwOwogICAgICBuZWVkc19wdXRlbnY9dHJ1ZTsK
ICAgIH0KICAgIGZvcig7ICgqcCAhPSAnXDAnKSAmJiAoKnAgIT0gJzonKTsgcCs9MSk7CiAgICBp
ZiggKnAgIT0gJzonICkKICAgIHsgZnByaW50ZihzdGRlcnIsIk9vcHMsIHRoZSBlbnZpcm9ubWVu
dCB2YXJpYWJsZSBMSU5VWF9HVE9EX1BBR0VfQU5EX09GRlNFVD0lcyBjb250YWlucyBubyBvZmZz
ZXQgKGFmdGVyICc6JykuIFBsZWFzZSB1c2Uga2FkZHIyb2ZmcyB0byBzZXQgdGhpcyB2YWx1ZS5c
biIsIGIpOwogICAgICByZXR1cm47CiAgICB9IAogICAgcmVnaXN0ZXIgY2hhciAqcHM9YWxsb2Nh
KCAocCAtIGIpICsgMSApOwogICAgbWVtY3B5KCBwcywgYiwgcCAtIGIpOwogICAgcHNbcC1iXT0n
XDAnOwogICAgX2xueF9ndG9kX3BhZ2UgPSBzdHJ0b3VsKHBzLCBOVUxMLDApOwogICAgX2xueF9n
dG9kX29mZnMgPSBzdHJ0b3VsKHArMSxOVUxMLDApOwogIH0KICByZWdpc3RlciBVTF90IHBhZ2Ug
PSBfbG54X2d0b2RfcGFnZTsKICByZWdpc3RlciBVTF90IG9mZnMgPSBfbG54X2d0b2Rfb2ZmczsK
ICByZWdpc3RlciBvZmZfdCBvZmZzZXQgPSAocGFnZSAqIFBBR0VfU0laRSkgKyBvZmZzOwogIHJl
Z2lzdGVyIGJ5dGVfdCAqZDsKICByZWdpc3RlciBpbnQgZmQsIHIsIHM7CiAgaWYoIChwYWdlID4g
MCkgJiYgKHBhZ2UgIT0gfjBVTCkgJiYgKG9mZnMgPiAwKSAmJiAob2ZmcyAhPSB+MFVMKSAmJiAo
ICEgKG9mZnMgJiAzKSApICkKICB7IGlmKCBfbG54X2tjb3JlX2ZkID09IEJBRF9GRCApCiAgICB7
ICBmZCAgPSBvcGVuKCIvcHJvYy9rY29yZSIsIE9fUkRPTkxZKTsKICAgICAgIGlmKCBCQURfRkQg
IT0gZmQgKQogICAgICAgeyAKICAgICAgICAgX2xueF9rY29yZV9mZCA9IGZkOwogICAgICAgfSBl
bHNlCiAgICAgICB7IGZwcmludGYoc3RkZXJyLCJPb3BzLCBmYWlsZWQgdG8gb3BlbiAvcHJvYy9r
Y29yZSAgJWQ6ICclcycuIiwgIGVycm5vLCBzdHJlcnJvcihlcnJubykpOwogICAgICAgICByZXR1
cm47CiAgICAgICB9CiAgICB9IGVsc2UKICAgICAgZmQgPSBfbG54X2tjb3JlX2ZkOwogIH0gZWxz
ZQogIHsgZnByaW50ZihzdGRlcnIsIk9vcHMsIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBMSU5V
WF9HVE9EX1BBR0VfQU5EX09GRlNFVD0lcyBjb250YWlucyBhbiBpbnZhbGlkIHBhZ2UgKCVseCkg
b3IgKG5vdCA0LWJ5dGUgYWxpZ25lZCkgb2Zmc2V0ICglbHgpIC4gUGxlYXNlIHVzZSBrYWRkcjJv
ZmZzIHRvIHNldCB0aGlzIHZhbHVlLlxuIiwKICAgICAgYnVmLCBwYWdlLCBvZmZzCiAgICAgKTsK
ICAgIF9sbnhfZ3RvZF9wYWdlID0gX2xueF9ndG9kX29mZnM9MDsKICAgIHJldHVybjsKICB9CiAg
aWYoIG9mZnNldCAhPSBsc2VlayhmZCwgb2Zmc2V0LCBTRUVLX1NFVCkgKQogIHsgZnByaW50Zihz
dGRlcnIsIk9vcHMsIGZhaWxlZCB0byBsc2VlayAvcHJvYy9rY29yZSB0byAlbHg6ICVkOiAnJXMn
LiIsIG9mZnNldCwgZXJybm8sIHN0cmVycm9yKGVycm5vKSk7CiAgICBjbG9zZShmZCk7CiAgICBy
ZXR1cm47CiAgfSAgCiAgZXJybm89MDsKICBzPXNpemVvZihzdHJ1Y3QgdnN5c2NhbGxfZ3RvZF9k
YXRhKTsKICBkPShieXRlX3QqKSZfbG54X2d0b2Q7CiAgd2hpbGUoIHMgPiAwICkKICB7IHIgPSBy
ZWFkKCBmZCwgZCArIChzaXplb2Yoc3RydWN0IHZzeXNjYWxsX2d0b2RfZGF0YSktcyksIHMpOwog
ICAgaWYoIHIgPD0gMCApCiAgICB7IGZwcmludGYoc3RkZXJyLCJPb3BzLCBmYWlsZWQgdG8gb3Bl
biAvcHJvYy9rY29yZTogJWQ6ICclcycuIiwgZXJybm8sIHN0cmVycm9yKGVycm5vKSk7CiAgICAg
IGNsb3NlKGZkKTsgICAgICAgICAgCiAgICAgIHJldHVybjsgICAgICAgICAgCiAgICB9CiAgICBz
IC09IHI7CiAgfQogIGlmKCBfbG54X2Nsb3NlX2tjb3JlX2ZkICkKICB7IGNsb3NlKGZkKTsKICAg
IF9sbnhfa2NvcmVfZmQgPSBCQURfRkQ7ICAKICB9ZWxzZQogICAgbHNlZWsoZmQsIG9mZnNldCwg
U0VFS19TRVQpOwogIGlmKG5lZWRzX3B1dGVudikKICB7IHNucHJpbnRmKGJ1Ziw2MywiTElOVVhf
R1RPRF9QQUdFX0FORF9PRkZTRVQ9JWx4OiVseCIscGFnZSxvZmZzKTsKICAgIHB1dGVudihidWYp
OwogIH0KICAvKgogIGlmKCBfbG54X2d0b2QudmNsb2NrX21vZGUgIT0gMCApCiAgewogICAgZnBy
aW50ZihzdGRlcnIsICIlczogcmVhZCBsaW51eCBHVE9EIHN0cnVjdHVyZSBAIDB4JWx4OiVseCBp
biAvcHJvYy9rY29yZVxuR1RPRCBEQVRBIDogJXUgJXUgJXVcbiIsCiAgICBfX0ZVTkNUSU9OX18s
cGFnZSAqUEFHRV9TSVpFLCAgb2ZmcywgX2xueF9ndG9kLnZjbG9ja19tb2RlLCBfbG54X2d0b2Qu
bXVsdCwgX2xueF9ndG9kLnNoaWZ0KTsKICB9CiAgKi8KfQoKc3RhdGljIHZvaWQgX2luaXRfbG54
X2d0b2RfcGFnZSh2b2lkKSBfX2F0dHJpYnV0ZV9fKChjb25zdHJ1Y3RvcikpOwoKc3RhdGljIHZv
aWQgbG54X2d0b2Rfc3luYyh2b2lkKSBfX2F0dHJpYnV0ZV9fKChhbGlhcygiX2luaXRfbG54X2d0
b2RfcGFnZSIpKSk7CgojZW5kaWYKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHR0c2Mvdm1hMm9mZnNl
dC5jAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwMDAwNjQ0ADAwMDAwMDAAMDAwMDAwMAAwMDAw
MDAwNDA1NQAxMzA1MzYxNTcwMwAwMTI3NjAAIDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAdXN0YXIgIAByb290AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHJv
b3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALyogdm5zMm9mZnNldC5j
IDogY29udmVydHMgPGFkZHJlc3M+IDxzZWN0aW9uIGFkZHJlc3M+IDxzZWN0aW9uIHNpemU+IDxv
ZmZzZXQ+IDxibG9ja19zaXplPiBhcmd1bWVudHMgaW4gdG8gPHBhZ2U+OjxvZmZzZXQ+CiAqIHVz
ZWQgYnkgcGFyc2VyIG9mICdvYmpkdW1wIC1maCAvcHJvYy9rY29yZScgKC91c3IvYmluL2thZGRy
Mm9mZnMpIHRvIGRldGVybWluZSB3aGljaCBzZWN0aW9uIGNvbnRhaW5zIGtlcm5lbCB2aXJ0dWFs
IG1lbW9yeSBhZGRyZXNzLgogKiBUaGVuIHRoZSBvdXRwdXQgb2YgdGhpcyBpcyBwYXNzZWQgdG8g
ZWcuIHRoZSB0aW1lc3RhbXAgbW9kdWxlIGFzIGl0cyAnYWRkcmVzcyBvZiB2c3lzY2FsbF9ndG9k
X2RhdGEgc3RydWN0dXJlJywgYW5kIGl0IGNhbgogKiBtYXAgYSBwYWdlIG9mIGl0cyBtZW1vcnkg
cmVhZC1vbmx5IHRvIHRoYXQgYWRkcmVzcyBpbiB0aGUga2VybmVsIGFuZCBnZXQgdGhlIHRpbWlu
ZyBwYXJhbWV0ZXJzIHJpZ2h0LgogKi8KI2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZmVh
dHVyZXMuaD4KI2luY2x1ZGUgPHN5cy90eXBlcy5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNs
dWRlIDxzdGRhcmcuaD4KI2luY2x1ZGUgPHN0ZGJvb2wuaD4KI2luY2x1ZGUgPHRpbWUuaD4KI2lu
Y2x1ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPGVycm5vLmg+
CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHB0aHJlYWQuaD4KI2luY2x1ZGUgPHNldGpt
cC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgoKI2luY2x1ZGUgImJh
c2VfdHlwZXMuaCIKCmludCBtYWluKGludCBhcmdjLCBjb25zdCBjaGFyICpjb25zdCAqYXJndiwg
Y29uc3QgY2hhciAqY29uc3QgKmVudnApCnsKICBpZiggYXJnYyA8IDUgKQogIHsgZnByaW50Zihz
dGRlcnIsICIlczogZXhwZWN0cyA8YWRkcmVzcyBpbiBoZXg+IDxzZWN0aW9uIHZtYSBpbiBoZXg+
IDxzZWN0aW9uIHNpemUgaW4gaGV4PiA8c2VjdGlvbiBvZmZzZXQgaW4gaGV4PiBbIDxibG9ja19z
aXplPiAoNDA5NildIGFyZ3VtZW50cy5cblx0SUZGIHRoZSBzZWN0aW9uIGNvbnRhaW5zIHRoZSBh
ZGRyZXNzLCB3aWxsIHByaW50IHRoZSA8YmxvY2s+JzonPG9mZnNldD4gb2YgYmxvY2sgdG8gc2Vl
ayB0byBhbmQgb2Zmc2V0IHdpdGhpbiBibG9jayBvZiBhZGRyZXNzLlxuIiwgYXJndlswXSk7CiAg
ICByZXR1cm4gMTsKICB9CiAgcmVnaXN0ZXIKICBVTF90IGFkZHJlc3M9c3RydG91bChhcmd2WzFd
LCBOVUxMLCAxNikKICAgICAsIHZtYSAgICA9c3RydG91bChhcmd2WzJdLCBOVUxMLCAxNikKICAg
ICAsIHNpemUgICA9c3RydG91bChhcmd2WzNdLCBOVUxMLCAxNikKICAgICAsIG9mZnNldCA9c3Ry
dG91bChhcmd2WzRdLCBOVUxMLCAxNikKICAgICAsIGJzICAgICA9c3RydG91bChhcmd2WzVdLCBO
VUxMLCAwKQogICAgOwogIGlmKChicyA9PSAwKSB8fCAoYnM9PX4wVUwpKQogIHsgZnByaW50Zihz
dGRlcnIsImFzc3VtaW5nIGJsb2NrIHNpemUgaXMgNDA5Ni5cbiIpOwogICAgYnM9NDA5NjsKICB9
CiAgaWYoIGJzICE9ICAoYnMgJiB+KGJzIC0gMSkgKSApCiAgeyBmcHJpbnRmKHN0ZGVyciwib25s
eSBvbmUgYml0IGluIGJsb2NrIHNpemU9JWx4ICglbGQpIG1heSBiZSBzZXQuXG4iLCBicywgYnMp
OwogICAgcmV0dXJuIDE7CiAgfQogIGlmKCAgIChhZGRyZXNzICE9IH4wVUwpICYmICh2bWEgIT0g
fjBVTCkgJiYgKHNpemUgIT0gfjBVTCkgJiYgKG9mZnNldCAhPSB+MFVMKSAKICAgICAmJiAoYWRk
cmVzcyA+IDBVTCkgJiYgKHZtYSA+IDBVTCkgJiYgKHNpemUgPiAwVUwpICYmIChvZmZzZXQgPiAw
VUwpIAogICAgICYmIChhZGRyZXNzID49IHZtYSkKICAgICAmJiAoYWRkcmVzcyA8PSAodm1hICsg
c2l6ZSkpCiAgICApCiAgeyByZWdpc3RlciBVTF90IHBhZ2UgPSAoKGFkZHJlc3MgLSB2bWEpICsg
b2Zmc2V0KSAvIGJzCiAgICAgICAgICAgICAgICAsIG9mZnMgPSAoKGFkZHJlc3MgLSB2bWEpICsg
b2Zmc2V0KSAlIGJzOwogICAgcHJpbnRmKCIlbHU6JWx1XG4iLCBwYWdlLCBvZmZzKTsKICAgIHJl
dHVybiAwOwogIH0KICByZXR1cm4gMTsKfQoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==
--001a114150dcaf9f76054936736d--
