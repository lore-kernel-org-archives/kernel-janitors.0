From: Jason Vas Dias <jason.vas.dias@gmail.com>
Date: Wed, 22 Feb 2017 20:26:30 +0000
Subject: Re: [PATCH] arch/x86/kernel/tsc.c : set X86_FEATURE_ART for TSC on CPUs like i7-4910MQ : bug #194609
Message-Id: <CALyZvKyq1MOsdM9j_VoXjG8rR8tQ747xY8m-SAy8haY0o8406A@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="f403045e3476dc54b20549244fc5"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALyZvKyAH8xfj_j2Vh_z2BOgYJeP73LvFwhvQ26-Kyfthdtwiw@mail.gmail.com>
 <CALyZvKwVDP8bTDdteYZT01GJGDd0d+hQ7oib-oXj+DarNHMWnQ@mail.gmail.com>
 <alpine.DEB.2.20.1702201239330.4208@nanos> <CALyZvKxhvGjRou4FcEvvbwPxPzAxpe8Shn=53DUx6WYWqEGSrA@mail.gmail.com>
 <CALyZvKyThHz12B7ViO8wyqeVB+mknBQGi=k7+TRUX-mCjkATtA@mail.gmail.com>
 <CALyZvKz_WpnDCPTy=DobayTTj-3gTUZ=TCv25i3Hb9AcYKa14w@mail.gmail.com>
 <CALyZvKyTGOmXC9DxcS-UR-STSwtJONMQA6srtZAaiLURcOxqvA@mail.gmail.com> <CALyZvKyT_-t9LXiaD-fv=L_WT8DwXJ_ooV6S=914fG8_Fydrhw@mail.gmail.com>
In-Reply-To: <CALyZvKyT_-t9LXiaD-fv=L_WT8DwXJ_ooV6S=914fG8_Fydrhw@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Prarit Bhargava <prarit@redhat.com>, x86@kernel.org

--f403045e3476dc54b20549244fc5
Content-Type: text/plain; charset=UTF-8

OK, last post on this issue today -
can anyone explain why, with standard 4.10.0 kernel & no new
'notsc_adjust' option, and the same maths being used, these two runs
should display
such a wide disparity between clock_gettime(CLOCK_MONOTONIC_RAW,&ts)
values ? :

$ J/pub/ttsc/ttsc1
max_extended_leaf: 80000008
has tsc: 1 constant: 1
Invariant TSC is enabled: Actual TSC freq: 2.893299GHz - TSC adjust: 1.
ts2 - ts1: 162 ts3 - ts2: 110 ns1: 0.000000641 ns2: 0.000002850
ts3 - ts2: 175 ns1: 0.000000659
ts3 - ts2: 18 ns1: 0.000000643
ts3 - ts2: 18 ns1: 0.000000618
ts3 - ts2: 17 ns1: 0.000000620
ts3 - ts2: 17 ns1: 0.000000616
ts3 - ts2: 18 ns1: 0.000000641
ts3 - ts2: 18 ns1: 0.000000709
ts3 - ts2: 20 ns1: 0.000000763
ts3 - ts2: 20 ns1: 0.000000735
ts3 - ts2: 20 ns1: 0.000000761
t1 - t0: 78200 - ns2: 0.000080824
$ J/pub/ttsc/ttsc1
max_extended_leaf: 80000008
has tsc: 1 constant: 1
Invariant TSC is enabled: Actual TSC freq: 2.893299GHz - TSC adjust: 1.
ts2 - ts1: 217 ts3 - ts2: 221 ns1: 0.000001294 ns2: 0.000005375
ts3 - ts2: 210 ns1: 0.000001418
ts3 - ts2: 23 ns1: 0.000001399
ts3 - ts2: 22 ns1: 0.000001445
ts3 - ts2: 25 ns1: 0.000001321
ts3 - ts2: 20 ns1: 0.000001428
ts3 - ts2: 25 ns1: 0.000001367
ts3 - ts2: 23 ns1: 0.000001425
ts3 - ts2: 23 ns1: 0.000001357
ts3 - ts2: 22 ns1: 0.000001487
ts3 - ts2: 25 ns1: 0.000001377
t1 - t0: 145753 - ns2: 0.000150781

(complete source of test program ttsc1 attached in ttsc.tar
 $ tar -xpf ttsc.tar
 $ cd ttsc
 $ make
).

On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
> I actually tried adding a 'notsc_adjust' kernel option to disable any
> setting or
> access to the TSC_ADJUST MSR, but then I see the problems  - a big
> disparity
> in values depending on which CPU the thread is scheduled -  and no
> improvement in clock_gettime() latency.  So I don't think the new
> TSC_ADJUST
> code in ts_sync.c itself is the issue - but something added @ 460ns
> onto every clock_gettime() call when moving from v4.8.0 -> v4.10.0 .
> As I don't think fixing the clock_gettime() latency issue is my problem or
> even
> possible with current clock architecture approach, it is a non-issue.
>
> But please, can anyone tell me if are there any plans to move the time
> infrastructure  out of the kernel and into glibc along the lines
> outlined
> in previous mail - if not, I am going to concentrate on this more radical
> overhaul approach for my own systems .
>
> At least, I think mapping the clocksource information structure itself in
> some
> kind of sharable page makes sense . Processes could map that page
> copy-on-write
> so they could start off with all the timing parameters preloaded,  then
> keep
> their copy updated using the rdtscp instruction , or msync() (read-only)
> with the kernel's single copy to get the latest time any process has
> requested.
> All real-time parameters & adjustments could be stored in that page ,
> & eventually a single copy of the tzdata could be used by both kernel
> & user-space.
> That is what I am working towards. Any plans to make linux real-time tsc
> clock user-friendly ?
>
>
>
> On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>> Yes, my CPU is still getting a fault every time the TSC_ADJUST MSR is
>> read or written . It is probably because it genuinuely does not
>> support any cpuid > 13 ,
>> or the modern TSC_ADJUST interface . This is probably why my
>> clock_gettime()
>> latencies are so bad. Now I have to develop a patch to disable all access
>> to
>> TSC_ADJUST MSR if boot_cpu_data.cpuid_level <= 13 .
>> I really have an unlucky CPU :-) .
>>
>> But really, I think this issue goes deeper into the fundamental limits of
>> time measurement on Linux : it is never going to be possible to measure
>> minimum times with clock_gettime() comparable with those returned by
>> rdtscp instruction - the time taken to enter the kernel through the VDSO,
>> queue an access to vsyscall_gtod_data via a workqueue, access it & do
>> computations & copy value to user-space is NEVER going to be up to the
>> job of measuring small real-time durations of the order of 10-20 TSC
>> ticks
>> .
>>
>> I think the best way to solve this problem going forward would be to
>> store
>> the entire vsyscall_gtod_data  data structure representing the current
>> clocksource
>> in a shared page which is memory-mappable (read-only) by user-space .
>> I think sser-space programs should be able to do something like :
>>     int fd =
>> open("/sys/devices/system/clocksource/clocksource0/gtod.page",O_RDONLY);
>>     size_t psz = getpagesize();
>>     void *gtod = mmap( 0, psz, PROT_READ, MAP_PRIVATE, fd, 0 );
>>     msync(gtod,psz,MS_SYNC);
>>
>> Then they could all read the real-time clock values as they are updated
>> in real-time by the kernel, and know exactly how to interpret them .
>>
>> I also think that all mktime() / gmtime() / localtime() timezone handling
>> functionality should be
>> moved to user-space, and that the kernel should actually load and link in
>> some
>> /lib/libtzdata.so
>> library, provided by glibc / libc implementations, that is exactly the
>> same library
>> used by glibc() code to parse tzdata ; tzdata should be loaded at boot
>> time
>> by the kernel from the same places glibc loads it, and both the kernel
>> and
>> glibc should use identical mktime(), gmtime(), etc. functions to access
>> it,
>> and
>> glibc using code would not need to enter the kernel at all for any
>> time-handling
>> code. This tzdata-library code be automatically loaded into process
>> images
>> the
>> same way the vdso region is , and the whole system could access only one
>> copy of it and the 'gtod.page' in memory.
>>
>> That's just my two-cents worth, and how I'd like to eventually get
>> things working
>> on my system.
>>
>> All the best, Regards,
>> Jason
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>>> On 22/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>>>> RE:
>>>>>> 4.10 has  new code which utilizes the TSC_ADJUST MSR.
>>>>
>>>> I just built an unpatched linux v4.10 with tglx's TSC improvements -
>>>> much else improved in this kernel (like iwlwifi) - thanks!
>>>>
>>>> I have attached an updated version of the test program which
>>>> doesn't print the bogus "Nominal TSC Frequency" (the previous
>>>> version printed it, but equally ignored it).
>>>>
>>>> The clock_gettime(CLOCK_MONOTONIC_RAW,&ts) latency has improved by
>>>> a factor of 2 - it used to be @140ns and is now @ 70ns  ! Wow!  :
>>>>
>>>> $ uname -r
>>>> 4.10.0
>>>> $ ./ttsc1
>>>> max_extended_leaf: 80000008
>>>> has tsc: 1 constant: 1
>>>> Invariant TSC is enabled: Actual TSC freq: 2.893299GHz.
>>>> ts2 - ts1: 144 ts3 - ts2: 96 ns1: 0.000000588 ns2: 0.000002599
>>>> ts3 - ts2: 178 ns1: 0.000000592
>>>> ts3 - ts2: 14 ns1: 0.000000577
>>>> ts3 - ts2: 14 ns1: 0.000000651
>>>> ts3 - ts2: 17 ns1: 0.000000625
>>>> ts3 - ts2: 17 ns1: 0.000000677
>>>> ts3 - ts2: 17 ns1: 0.000000626
>>>> ts3 - ts2: 17 ns1: 0.000000627
>>>> ts3 - ts2: 17 ns1: 0.000000627
>>>> ts3 - ts2: 18 ns1: 0.000000655
>>>> ts3 - ts2: 17 ns1: 0.000000631
>>>> t1 - t0: 89067 - ns2: 0.000091411
>>>>
>>>
>>>
>>> Oops, going blind in my old age. These latencies are actually 3 times
>>> greater than under 4.8 !!
>>>
>>> Under 4.8, the program printed latencies of @ 140ns for clock_gettime,
>>> as
>>> shown
>>> in bug 194609 as the 'ns1' (timespec_b - timespec_a) value::
>>>
>>> ts3 - ts2: 24 ns1: 0.000000162
>>> ts3 - ts2: 17 ns1: 0.000000143
>>> ts3 - ts2: 17 ns1: 0.000000146
>>> ts3 - ts2: 17 ns1: 0.000000149
>>> ts3 - ts2: 17 ns1: 0.000000141
>>> ts3 - ts2: 16 ns1: 0.000000142
>>>
>>> now the clock_gettime(CLOCK_MONOTONIC_RAW,&ts) latency is @
>>> 600ns, @ 4 times more than under 4.8 .
>>> But I'm glad the TSC_ADJUST problems are fixed.
>>>
>>> Will programs reading :
>>>  $ cat /sys/devices/msr/events/tsc
>>>  event=0x00
>>> read a new event for each setting of the TSC_ADJUST MSR or a wrmsr on
>>> the
>>> TSC ?
>>>
>>>> I think this is because under Linux 4.8, the CPU got a fault every
>>>> time it read the TSC_ADJUST MSR.
>>>
>>> maybe it still is!
>>>
>>>
>>>> But user programs wanting to use the TSC  and correlate its value to
>>>> clock_gettime(CLOCK_MONOTONIC_RAW) values accurately like the above
>>>> program still have to  dig the TSC frequency value out of the kernel
>>>> with objdump  - this was really the point of the bug #194609.
>>>>
>>>> I would still like to investigate exporting 'tsc_khz' & 'mult' +
>>>> 'shift' values via sysfs.
>>>>
>>>> Regards,
>>>> Jason.
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> On 21/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
>>>>> Thank You for enlightening me -
>>>>>
>>>>> I was just having a hard time believing that Intel would ship a chip
>>>>> that features a monotonic, fixed frequency timestamp counter
>>>>> without specifying in either documentation or on-chip or in ACPI what
>>>>> precisely that hard-wired frequency is, but I now know that to
>>>>> be the case for the unfortunate i7-4910MQ - I mean, how can the CPU
>>>>> assert CPUID:80000007[8] ( InvariantTSC ) which it does, which is
>>>>> difficult to reconcile with the statement in the SDM :
>>>>>   17.16.4  Invariant Time-Keeping
>>>>>     The invariant TSC is based on the invariant timekeeping hardware
>>>>>     (called Always Running Timer or ART), that runs at the core
>>>>> crystal
>>>>> clock
>>>>>     frequency. The ratio defined by CPUID leaf 15H expresses the
>>>>> frequency
>>>>>     relationship between the ART hardware and TSC. If
>>>>> CPUID.15H:EBX[31:0]
>>>>> !=
>>>>> 0
>>>>>     and CPUID.80000007H:EDX[InvariantTSC] = 1, the following linearity
>>>>>     relationship holds between TSC and the ART hardware:
>>>>>     TSC_Value = (ART_Value * CPUID.15H:EBX[31:0] )
>>>>>                          / CPUID.15H:EAX[31:0] + K
>>>>>     Where 'K' is an offset that can be adjusted by a privileged
>>>>> agent*2.
>>>>>      When ART hardware is reset, both invariant TSC and K are also
>>>>> reset.
>>>>>
>>>>> So I'm just trying to figure out what CPUID.15H:EBX[31:0]  and
>>>>> CPUID.15H:EAX[31:0]  are for my hardware.  I assumed (incorrectly)
>>>>> that
>>>>> the "Nominal TSC Frequency" formulae in the manul must apply to all
>>>>> CPUs with InvariantTSC .
>>>>>
>>>>> Do I understand correctly , that since I do have InvariantTSC ,  the
>>>>> TSC_Value is in fact calculated according to the above formula, but
>>>>> with
>>>>> a "hidden" ART Value,  & Core Crystal Clock frequency & its ratio to
>>>>> TSC frequency ?
>>>>> It was obvious this nominal TSC Frequency had nothing to do with the
>>>>> actual TSC frequency used by Linux, which is 'tsc_khz' .
>>>>> I guess wishful thinking led me to believe CPUID:15h was actually
>>>>> supported somehow , because I thought InvariantTSC meant it had ART
>>>>> hardware .
>>>>>
>>>>> I do strongly suggest that Linux exports its calibrated TSC Khz
>>>>> somewhere to user
>>>>> space .
>>>>>
>>>>> I think the best long-term solution would be to allow programs to
>>>>> somehow read the TSC without invoking
>>>>> clock_gettime(CLOCK_MONOTONIC_RAW,&ts), &
>>>>> having to enter the kernel, which incurs an overhead of > 120ns on my
>>>>> system
>>>>> .
>>>>>
>>>>>
>>>>> Couldn't linux export its 'tsc_khz' and / or 'clocksource->mult' and
>>>>> 'clocksource->shift' values to /sysfs somehow ?
>>>>>
>>>>> For instance , only  if the 'current_clocksource' is 'tsc', then these
>>>>> values could be exported as:
>>>>> /sys/devices/system/clocksource/clocksource0/shift
>>>>> /sys/devices/system/clocksource/clocksource0/mult
>>>>> /sys/devices/system/clocksource/clocksource0/freq
>>>>>
>>>>> So user-space programs could  know that the value returned by
>>>>>     clock_gettime(CLOCK_MONOTONIC_RAW)
>>>>>   would be
>>>>>     {    .tv_sec =  ( ( rdtsc() * mult ) >> shift ) >> 32,
>>>>>       , .tv_nsec = ( ( rdtsc() * mult ) >> shift ) >> &~0U
>>>>>     }
>>>>>   and that represents ticks of period (1.0 / ( freq * 1000 )) S.
>>>>>
>>>>> That would save user-space programs from having to know 'tsc_khz' by
>>>>> parsing the 'Refined TSC' frequency from log files or by examining the
>>>>> running kernel with objdump to obtain this value & figure out 'mult' &
>>>>> 'shift' themselves.
>>>>>
>>>>> And why not a
>>>>>   /sys/devices/system/clocksource/clocksource0/value
>>>>> file that actually prints this ( ( rdtsc() * mult ) >> shift )
>>>>> expression as a long integer?
>>>>> And perhaps a
>>>>>   /sys/devices/pnp0/XX\:YY/rtc/rtc0/nanoseconds
>>>>> file that actually prints out the number of real-time nano-seconds
>>>>> since
>>>>> the
>>>>> contents of the existing
>>>>>   /sys/devices/pnp0/XX\:YY/rtc/rtc0/{time,since_epoch}
>>>>> files using the current TSC value?
>>>>> To read the rtc0/{date,time} files is already faster than entering the
>>>>> kernel to call
>>>>> clock_gettime(CLOCK_REALTIME, &ts) & convert to integer for scripts.
>>>>>
>>>>> I will work on developing a patch to this effect if no-one else is.
>>>>>
>>>>> Also, am I right in assuming that the maximum granularity of the
>>>>> real-time
>>>>> clock
>>>>> on my system is 1/64th of a second ? :
>>>>>  $ cat /sys/devices/pnp0/00\:02/rtc/rtc0/max_user_freq
>>>>>  64
>>>>> This is the maximum granularity that can be stored in CMOS , not
>>>>> returned by TSC? Couldn't we have something similar that gave an
>>>>> accurate idea of TSC frequency and the precise formula applied to TSC
>>>>> value to get clock_gettime
>>>>> (CLOCK_MONOTONIC_RAW) value ?
>>>>>
>>>>> Regards,
>>>>> Jason
>>>>>
>>>>>
>>>>> This code does produce good timestamps with a latency of @20ns
>>>>> that correlate well with clock_gettIme(CLOCK_MONOTONIC_RAW,&ts)
>>>>> values, but it depends on a global variable that  is initialized to
>>>>> the 'tsc_khz' value
>>>>> computed by running kernel parsed from objdump /proc/kcore output :
>>>>>
>>>>> static inline __attribute__((always_inline))
>>>>> U64_t
>>>>> IA64_tsc_now()
>>>>> { if(!(    _ia64_invariant_tsc_enabled
>>>>>       ||(( _cpu0id_fd == -1) &&
>>>>> IA64_invariant_tsc_is_enabled(NULL,NULL))
>>>>>       )
>>>>>     )
>>>>>   { fprintf(stderr, __FILE__":%d:(%s): must be called with invariant
>>>>> TSC enabled.\n");
>>>>>     return 0;
>>>>>   }
>>>>>   U32_t tsc_hi, tsc_lo;
>>>>>   register UL_t tsc;
>>>>>   asm volatile
>>>>>   ( "rdtscp\n\t"
>>>>>     "mov %%edx, %0\n\t"
>>>>>     "mov %%eax, %1\n\t"
>>>>>     "mov %%ecx, %2\n\t"
>>>>>   : "=m" (tsc_hi) ,
>>>>>     "=m" (tsc_lo) ,
>>>>>     "=m" (_ia64_tsc_user_cpu) :
>>>>>   : "%eax","%ecx","%edx"
>>>>>   );
>>>>>   tsc=(((UL_t)tsc_hi) << 32)|((UL_t)tsc_lo);
>>>>>   return tsc;
>>>>> }
>>>>>
>>>>> __thread
>>>>> U64_t _ia64_first_tsc = 0xffffffffffffffffUL;
>>>>>
>>>>> static inline __attribute__((always_inline))
>>>>> U64_t IA64_tsc_ticks_since_start()
>>>>> { if(_ia64_first_tsc == 0xffffffffffffffffUL)
>>>>>   { _ia64_first_tsc = IA64_tsc_now();
>>>>>     return 0;
>>>>>   }
>>>>>   return (IA64_tsc_now() - _ia64_first_tsc) ;
>>>>> }
>>>>>
>>>>> static inline __attribute__((always_inline))
>>>>> void
>>>>> ia64_tsc_calc_mult_shift
>>>>> ( register U32_t *mult,
>>>>>   register U32_t *shift
>>>>> )
>>>>> { /* paraphrases Linux clocksource.c's clocks_calc_mult_shift()
>>>>> function:
>>>>>    * calculates second + nanosecond mult + shift in same way linux
>>>>> does.
>>>>>    * we want to be compatible with what linux returns in struct
>>>>> timespec ts after call to
>>>>>    * clock_gettime(CLOCK_MONOTONIC_RAW, &ts).
>>>>>    */
>>>>>   const U32_t scale=1000U;
>>>>>   register U32_t from= IA64_tsc_khz();
>>>>>   register U32_t to  = NSEC_PER_SEC / scale;
>>>>>   register U64_t sec = ( ~0UL / from ) / scale;
>>>>>   sec = (sec > 600) ? 600 : ((sec > 0) ? sec : 1);
>>>>>   register U64_t maxsec = sec * scale;
>>>>>   UL_t tmp;
>>>>>   U32_t sft, sftacc=32;
>>>>>   /*
>>>>>    * Calculate the shift factor which is limiting the conversion
>>>>>    * range:
>>>>>    */
>>>>>   tmp = (maxsec * from) >> 32;
>>>>>   while (tmp)
>>>>>   { tmp >>=1;
>>>>>     sftacc--;
>>>>>   }
>>>>>   /*
>>>>>    * Find the conversion shift/mult pair which has the best
>>>>>    * accuracy and fits the maxsec conversion range:
>>>>>    */
>>>>>   for (sft = 32; sft > 0; sft--)
>>>>>   { tmp = ((UL_t) to) << sft;
>>>>>     tmp += from / 2;
>>>>>     tmp = tmp / from;
>>>>>     if ((tmp >> sftacc) == 0)
>>>>>       break;
>>>>>   }
>>>>>   *mult = tmp;
>>>>>   *shift = sft;
>>>>> }
>>>>>
>>>>> __thread
>>>>> U32_t _ia64_tsc_mult = ~0U, _ia64_tsc_shift=~0U;
>>>>>
>>>>> static inline __attribute__((always_inline))
>>>>> U64_t IA64_s_ns_since_start()
>>>>> { if( ( _ia64_tsc_mult == ~0U ) || ( _ia64_tsc_shift == ~0U ) )
>>>>>     ia64_tsc_calc_mult_shift( &_ia64_tsc_mult, &_ia64_tsc_shift);
>>>>>   register U64_t cycles = IA64_tsc_ticks_since_start();
>>>>>   register U64_t ns = ((cycles
>>>>> *((UL_t)_ia64_tsc_mult))>>_ia64_tsc_shift);
>>>>>   return( (((ns / NSEC_PER_SEC)&0xffffffffUL) << 32) | ((ns %
>>>>> NSEC_PER_SEC)&0x3fffffffUL) );
>>>>>   /* Yes, we are purposefully ignoring durations of more than 4.2
>>>>> billion seconds here! */
>>>>> }
>>>>>
>>>>>
>>>>> I think Linux should export the 'tsc_khz', 'mult' and 'shift' values
>>>>> somehow,
>>>>> then user-space libraries could have more confidence in using 'rdtsc'
>>>>> or 'rdtscp'
>>>>> if Linux's current_clocksource is 'tsc'.
>>>>>
>>>>> Regards,
>>>>> Jason
>>>>>
>>>>>
>>>>>
>>>>> On 20/02/2017, Thomas Gleixner <tglx@linutronix.de> wrote:
>>>>>> On Sun, 19 Feb 2017, Jason Vas Dias wrote:
>>>>>>
>>>>>>> CPUID:15H is available in user-space, returning the integers : ( 7,
>>>>>>> 832, 832 ) in EAX:EBX:ECX , yet boot_cpu_data.cpuid_level is 13 , so
>>>>>>> in detect_art() in tsc.c,
>>>>>>
>>>>>> By some definition of available. You can feed CPUID random leaf
>>>>>> numbers
>>>>>> and
>>>>>> it will return something, usually the value of the last valid CPUID
>>>>>> leaf,
>>>>>> which is 13 on your CPU. A similar CPU model has
>>>>>>
>>>>>> 0x0000000d 0x00: eax=0x00000007 ebx=0x00000340 ecx=0x00000340
>>>>>> edx=0x00000000
>>>>>>
>>>>>> i.e. 7, 832, 832, 0
>>>>>>
>>>>>> Looks familiar, right?
>>>>>>
>>>>>> You can verify that with 'cpuid -1 -r' on your machine.
>>>>>>
>>>>>>> Linux does not think ART is enabled, and does not set the
>>>>>>> synthesized
>>>>>>> CPUID +
>>>>>>> ((3*32)+10) bit, so a program looking at /dev/cpu/0/cpuid would not
>>>>>>> see this bit set .
>>>>>>
>>>>>> Rightfully so. This is a Haswell Core model.
>>>>>>
>>>>>>> if an e1000 NIC card had been installed, PTP would not be available.
>>>>>>
>>>>>> PTP is independent of the ART kernel feature . ART just provides
>>>>>> enhanced
>>>>>> PTP features. You are confusing things here.
>>>>>>
>>>>>> The ART feature as the kernel sees it is a hardware extension which
>>>>>> feeds
>>>>>> the ART clock to peripherals for timestamping and time correlation
>>>>>> purposes. The ratio between ART and TSC is described by CPUID leaf
>>>>>> 0x15
>>>>>> so
>>>>>> the kernel can make use of that correlation, e.g. for enhanced PTP
>>>>>> accuracy.
>>>>>>
>>>>>> It's correct, that the NONSTOP_TSC feature depends on the
>>>>>> availability
>>>>>> of
>>>>>> ART, but that has nothing to do with the feature bit, which solely
>>>>>> describes the ratio between TSC and the ART frequency which is
>>>>>> exposed
>>>>>> to
>>>>>> peripherals. That frequency is not necessarily the real ART
>>>>>> frequency.
>>>>>>
>>>>>>> Also, if the MSR TSC_ADJUST has not yet been written, as it seems to
>>>>>>> be
>>>>>>> nowhere else in Linux,  the code will always think X86_FEATURE_ART
>>>>>>> is
>>>>>>> 0
>>>>>>> because the CPU will always get a fault reading the MSR since it has
>>>>>>> never been written.
>>>>>>
>>>>>> Huch? If an access to the TSC ADJUST MSR faults, then something is
>>>>>> really
>>>>>> wrong. And writing it unconditionally to 0 is not going to happen.
>>>>>> 4.10
>>>>>> has
>>>>>> new code which utilizes the TSC_ADJUST MSR.
>>>>>>
>>>>>>> It would be nice for user-space programs that want to use the TSC
>>>>>>> with
>>>>>>> rdtsc / rdtscp instructions, such as the demo program attached to
>>>>>>> the
>>>>>>> bug report,
>>>>>>> could have confidence that Linux is actually generating the results
>>>>>>> of
>>>>>>> clock_gettime(CLOCK_MONOTONIC_RAW, &timespec)
>>>>>>> in a predictable way from the TSC by looking at the
>>>>>>>  /dev/cpu/0/cpuid[bit(((3*32)+10)] value before enabling user-space
>>>>>>> use of TSC values, so that they can correlate TSC values with linux
>>>>>>> clock_gettime() values.
>>>>>>
>>>>>> What has ART to do with correct CLOCK_MONOTONIC_RAW values?
>>>>>>
>>>>>> Nothing at all, really.
>>>>>>
>>>>>> The kernel makes use of the proper information values already.
>>>>>>
>>>>>> The TSC frequency is determined from:
>>>>>>
>>>>>>     1) CPUID(0x16) if available
>>>>>>     2) MSRs if available
>>>>>>     3) By calibration against a known clock
>>>>>>
>>>>>> If the kernel uses TSC as clocksource then the CLOCK_MONOTONIC_*
>>>>>> values
>>>>>> are
>>>>>> correct whether that machine has ART exposed to peripherals or not.
>>>>>>
>>>>>>> has tsc: 1 constant: 1
>>>>>>> 832 / 7 = 118 : 832 - 9.888914286E+04hz : OK:1
>>>>>>
>>>>>> And that voodoo math tells us what? That you found a way to correlate
>>>>>> CPUID(0xd) to the TSC frequency on that machine.
>>>>>>
>>>>>> Now I'm curious how you do that on this other machine which returns
>>>>>> for
>>>>>> cpuid(15): 1, 1, 1
>>>>>>
>>>>>> You can't because all of this is completely wrong.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> 	tglx
>>>>>>
>>>>>
>>>>
>>>
>>
>

--f403045e3476dc54b20549244fc5
Content-Type: application/x-tar; name="ttsc.tar"
Content-Disposition: attachment; filename="ttsc.tar"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

dHRzYy8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA3NTUAMDAwMDAw
MAAwMDAwMDAwADAwMDAwMDAwMDAwADEzMDUzMzcxNTQwADAxMDUzMgAgNQAAAAAAAAAAAAAAAAAA
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
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdHRzYy9NYWtl
ZmlsZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMDAwMAAwMDAwMDAw
ADAwMDAwMDAwMzc3ADEzMDUyMDU0NTE1ADAxMjIwMAAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABhbGw6dHRzYzEK
Y2xlYW46dHRzYzEuY2xlYW4KQ0M9Z2NjCkNQUEZMQUdTOj0kKENQUEZMQUdTKSAtSS4KQ0ZMQUdT
Oj0kKENGTEFHUykgLXN0ZD1nbnUxMSAtTzMgLW10dW5lPW5hdGl2ZSAtZyAtZlBJQyAtcHRocmVh
ZApMREZMQUdTPSQoQ0ZMQUdTKSAtbHB0aHJlYWQgLWxtCnR0c2MxLm86dHRzYzEuYyBJQTY0X3Rz
Y19pbmZvLmggSUE2NF9yZHRzYy5oCnR0c2MxOiB0dHNjMS5vCnR0c2MxLmNsZWFuOgoJQHJtIC12
ZiB0dHNjMSB0dHNjMS5vCgoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHR0c2MvYmFzZV90
eXBlcy5oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwMDAwNjQ0ADAwMDAwMDAAMDAwMDAwMAAw
MDAwMDAwMTE0NgAxMzA1MTQ0NTQ0NAAwMTMwNDYAIDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAdXN0YXIgIAByb290AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAI2lmbmRlZiBfQkFT
RV9UWVBFU18KI2RlZmluZSBfQkFTRV9UWVBFU18KI2luY2x1ZGUgPGZlYXR1cmVzLmg+CiNpbmNs
dWRlIDxzeXMvdHlwZXMuaD4KI2luY2x1ZGUgPHN0ZGludC5oPgojaW5jbHVkZSA8c3RkYm9vbC5o
PgojaW5jbHVkZSA8c3RkYXJnLmg+CnR5cGVkZWYgdW5zaWduZWQgbG9uZyAgVUxfdCwgVTY0X3Q7
CnR5cGVkZWYgdW5zaWduZWQgbG9uZyBsb25nICBVTExfdCwgVTEyOF90Owp0eXBlZGVmIHVuc2ln
bmVkIGludCAgIFUzMl90Owp0eXBlZGVmIHVuc2lnbmVkIHNob3J0IFUxNl90Owp0eXBlZGVmIHVu
c2lnbmVkIGNoYXIgIGJ5dGVfdDsKI2VuZGlmCiNpZm5kZWYgX1NZU19TVEFUVVNfCiNkZWZpbmUg
X1NZU19TVEFUVVNfCiNpZmRlZiBPSwojdW5kZWYgT0sKI2VuZGlmCiNpZmRlZiBGQUlMCiN1bmRl
ZiBGQUlMCiNlbmRpZgojaWZkZWYgRVhJVF9PSwojdW5kZWYgRVhJVF9PSwojZW5kaWYKI2lmZGVm
IEVYSVRfRkFJTAojdW5kZWYgRVhJVF9GQUlMCiNlbmRpZgp0eXBlZGVmIGVudW0gc3lzX3N0YXR1
c19lCnsgT0sgICAgICAgPSAwIAosIEZBSUwgICAgID0gLTEKLCBFWElUX09LICA9IDAgCiwgRVhJ
VF9GQUlMPSAxCn0gU3lzU3RhdHVzX3Q7CiNlbmRpZgoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHR0c2MvSUE2NF90c2Nf
aW5mby5oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwMDAwNjQ0ADAwMDAwMDAAMDAwMDAwMAAwMDAw
MDAxNjY1MgAxMzA1MzM1MjM3MAAwMTMyNDQAIDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAdXN0YXIgIAByb290AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHJv
b3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALyogQEZJTEU6IElBNjRf
dHNjX2luZm8uaCA6IG1ha2VzIEludGVsIENvcmUtaTcgQXJjaGl0ZWN0dXJlIHg4Nl82NCBUU0Mg
SW5mb3JtYXRpb24gYXZhaWxhYmxlIGluIFVzZXIgU3BhY2UKICogICBzZWU6IFNETTogIkludGVs
wq4gNjQgYW5kIElBLTMyIEFyY2hpdGVjdHVyZXMgU29mdHdhcmUgRGV2ZWxvcGVy4oCZcyBNYW51
YWwiIDogaHR0cHM6Ly9zb2Z0d2FyZS5pbnRlbC5jb20vZW4tdXMvYXJ0aWNsZXMvaW50ZWwtc2Rt
CiAqICAgICAgICAgdjMsIFNERywgwqcgMTcuMTY6ICJUaW1lIFN0YW1wIENvdW50ZXIiLCB2Miwg
Q2ggMywgwqcgMTkwICJDUFVJRCBJbnN0cnVjdGlvbiIsIDMgwqcgMjA4LCAiRmVhdHVyZSBJbmZv
cm1hdGlvbiBSZXR1cm5lZCBpbiBFRFggUmVnaXN0ZXIiCiAqIENvcHlsZWZ0IChDKSAyMDE3KyBK
YXNvbiBWYXMgRGlhcyAoSlZEKSA8amFzb24udmFzLmRpYXNAZ21haWwuY29tPiAtIE9ubHkgQXV0
aG9yc2hpcCBSaWdodHMgUmVzZXJ2ZWQuCiAqLwojaWZuZGVmIF9JQTY0X1RTQ19JTkZPX0hfCiNk
ZWZpbmUgX0lBNjRfVFNDX0lORk9fSF8KI2lmbmRlZiBfX3g4Nl82NAojZXJyb3IgT29wcywgdGhp
cyBjb2RlIGlzIGp1c3QgZm9yIHRoZSBJbnRlbCB4ODZfNjQgYXJjaGl0ZWN0dXJlLgojZW5kaWYK
CiNpZm5kZWYgS1NZTV9MT0NBVElPTgojZGVmaW5lIEtTWU1fTE9DQVRJT04gIi91c3IvYmluL2tz
eW0iCiN3YXJuaW5nIC1ES1NZTV9MT0NBVElPTj0gbm90IHNwZWNpZmllZCBpbiBDUFBGTEFHUyAt
IGRlZmF1bHQgdmFsdWUgL3Vzci9iaW4va3N5bSBiZWluZyB1c2VkLgojZW5kaWYKCiNpZm5kZWYg
X0JBU0VfVFlQRVNfCiNpbmNsdWRlICJiYXNlX3R5cGVzLmgiCiNlbmRpZgojaW5jbHVkZSA8dW5p
c3RkLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPHN0
cmluZy5oPgojaW5jbHVkZSA8c3RkaW8uaD4KCnR5cGVkZWYgc3RydWN0IGlhNjRfdHNjX25jY2Nf
Y3B1aWRfMTVIX3MKeyBVMzJfdCB0c2NfY2NjX2Q7IC8qIGRlbm9taW5hdG9yOiBUU0MgIC8gTkND
QyBmcmVxICovCiAgVTMyX3QgdHNjX2NjY19uOyAvKiBudW1lcmF0b3IgIDogVFNDICAvIE5DQ0Mg
ZnJlcSAqLwogICAgICAgICAgICAgICAgICAgLyogYm90aCBudW1iZXJzIGFyZSBub3JtYWxpemVk
IC8gbWluaW11bSBudW1iZXIgdG8gZXhwcmVzcyByYXRpbywgTk9UIGFjdHVhbCBmcmVxICovCiAg
VTMyX3QgdHNjX2NjY19mOyAvKiBhY3R1YWwgY29yZSBjcnlzdGFsIGNsb2NrIGZyZXF1ZW5jeSBp
biBIWiAtIHRoaXMgaXMgdGhlIG5vbi1hZGp1c3RhYmxlIG1hc3RlciBjbG9jayBvc2NpbGxhdG9y
IGZyZXF1ZW5jeS4KICAgICAgICAgICAgICAgICAgICAqIE5PVCBwcm9jZXNzb3IgYmFzZSBmcmVx
dWVuY3kgb3IgSFBFVCBvciBUU0Mgb3IgY29yZSBjbG9jayBvciByZWZlcmVuY2UgY2xvY2sgb3Ig
YnVzIGNsb2NrIGFueSBvdGhlciBjbG9jayBmcmVxdWVuY3khICovCn0gSUE2NF9uY2NjX3QsIElB
NjRfVFNDX05vbWluYWxfQ29yZV9DcnlzdGFsX0Nsb2NrX3Q7IAoKc3RhdGljIGlubGluZSBfX2F0
dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKYm9vbApJQTY0X2hhc190c2Modm9pZCkKeyBVMzJf
dCBjYXBzPTA7ICAKICBhc20gdm9sYXRpbGUKICAoICJtb3YgJDEsICUlZWF4XG5cdCIKICAgICJj
cHVpZFxuXHQiCiAgICAibW92ICUlZWR4LCAlMCIKICA6ICI9bSIgKGNhcHMpIDoKICA6ICIlcmF4
IiwiJXJieCIsIiVyY3giLCIlcmR4IgogICk7CiAgLy8gYml0IDQgaXMgJ2hhc190c2MnIDoKICBy
ZXR1cm4gKChjYXBzICYgKDE8PDQpKT90cnVlOmZhbHNlKTsKfQoKc3RhdGljIF9fdGhyZWFkClUz
Ml90IF9pYTY0X21heF9sZWFmPTA7CnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlz
X2lubGluZSkpCmJvb2wKSUE2NF9oYXNfY3B1aWRfbGVhZl8xNWgodm9pZCkKeyBpZiggX2lhNjRf
bWF4X2xlYWYgPT0gMCApICAgIAogICAgYXNtIHZvbGF0aWxlCiAgICAoICJtb3YgJDB4MDAwMDAw
MDAsICUlZWF4XG5cdCIKICAgICAgImNwdWlkXG5cdCIKICAgICAgIm1vdiAlJWVheCwlMCIKICAg
IDogIj1tIiAoX2lhNjRfbWF4X2xlYWYpIDoKICAgIDogIiVyYXgiLCIlcmJ4IiwiJXJjeCIsIiVy
ZHgiCiAgICApOwogIHJldHVybigweDAxNFUgPCBfaWE2NF9tYXhfbGVhZik7Cn0KCnN0YXRpYyBf
X3RocmVhZApVMzJfdCBfaWE2NF9tYXhfZXh0ZW5kZWRfbGVhZj0wOwpzdGF0aWMgaW5saW5lIF9f
YXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpib29sCklBNjRfaGFzX2NwdWlkX2xlYWZfODAw
MDAwMDdoKHZvaWQpCnsgaWYoIF9pYTY0X21heF9leHRlbmRlZF9sZWFmID09IDAgKQogIHsgYXNt
IHZvbGF0aWxlCiAgICAoICJtb3YgJDB4ODAwMDAwMDAsICUlZWF4XG5cdCIKICAgICAgImNwdWlk
XG5cdCIKICAgICAgIm1vdiAlJWVheCwlMCIKICAgIDogIj1tIiAoX2lhNjRfbWF4X2V4dGVuZGVk
X2xlYWYpIDoKICAgIDogIiVyYXgiLCIlcmJ4IiwiJXJjeCIsIiVyZHgiCiAgICApOwogICAgZnBy
aW50ZihzdGRlcnIsIm1heF9leHRlbmRlZF9sZWFmOiAleFxuIiwgX2lhNjRfbWF4X2V4dGVuZGVk
X2xlYWYpOwogIH0KICByZXR1cm4oMHg4MDAwMDAwNlUgPCBfaWE2NF9tYXhfZXh0ZW5kZWRfbGVh
ZiApOwp9CgpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpib29s
CklBNjRfaGFzX2NvbnN0YW50X3RzYyh2b2lkKQp7IFUzMl90IGNhcHM9MDsKICBhc20gdm9sYXRp
bGUKICAoICJtb3YgJDB4ODAwMDAwMDcsICUlZWF4XG5cdCIKICAgICJjcHVpZFxuXHQiCiAgICAi
bW92ICUlZWR4LCAlMCIKICA6ICI9bSIgKGNhcHMpIDoKICA6ICIlcmF4IiwiJXJieCIsIiVyY3gi
LCIlcmR4IiAgCiAgKTsKICAvLyBiaXQgOCBpcyAnY29uc3RhbnRfdHNjJyA6CiAgcmV0dXJuICgo
Y2FwcyAmICgxPDw4KSk/dHJ1ZTpmYWxzZSk7Cn0KCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVf
XygoYWx3YXlzX2lubGluZSkpCmJvb2wKSUE2NF9oYXNfcmR0c2NwKHZvaWQpCnsgaWYoIF9pYTY0
X21heF9leHRlbmRlZF9sZWFmID09ICAwVSkKICAgIElBNjRfaGFzX2NwdWlkX2xlYWZfODAwMDAw
MDdoKCk7CiAgaWYoMHg4MDAwMDAwMVUgPiBfaWE2NF9tYXhfZXh0ZW5kZWRfbGVhZikKICAgIHJl
dHVybiBmYWxzZTsKICBVMzJfdCBjYXBzPTA7CiAgYXNtIHZvbGF0aWxlCiAgKCAibW92ICQweDgw
MDAwMDAxLCAlJWVheFxuXHQiCiAgICAiY3B1aWRcblx0IgogICAgIm1vdiAlJWVkeCwgJTAiCiAg
OiAiPW0iIChjYXBzKSA6CiAgOiAiJXJheCIsIiVyYngiLCIlcmN4IiwiJXJkeCIgIAogICk7CiAg
Ly8gYml0IDI3IGlzICdoYXMgcmR0c2NwICYgSUEzMl9UU0NfQVVYJyA6CiAgCiAgcmV0dXJuICgo
Y2FwcyAmICgxPDwyNykpP3RydWU6ZmFsc2UpOwp9CgpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRl
X18oKGFsd2F5c19pbmxpbmUpKQpJQTY0X25jY2NfdApJQTY0X25jY2Modm9pZCkKeyBJQTY0X25j
Y2NfdCBpPXswLDAsMH07CiAgVTMyX3QgdW51OwogIGFzbSB2b2xhdGlsZQogICggIm1vdiAkMCwg
ICAgJSVlY3hcblx0IgogICAgIm1vdiAkMHgxNSwgJSVlYXhcblx0IiAgICAKICAgICJjcHVpZFxu
XHQiCiAgICAibW92ICUlZWF4LCAlMFxuXHQiCiAgICAibW92ICUlZWJ4LCAlMVxuXHQiCiAgICAi
bW92ICUlZWN4LCAlMlxuXHQiCiAgICAibW92ICUlZWR4LCAlMyIgICAgCiAgOiAiPW0iIChpLnRz
Y19jY2NfZCkgLAogICAgIj1tIiAoaS50c2NfY2NjX24pICwKICAgICI9bSIgKGkudHNjX2NjY19m
KSAsCiAgICAiPW0iICh1bnUpIDoKICA6ICIlcmF4IiwiJXJieCIsIiVyY3giLCIlcmR4IiAgCiAg
KTsKICByZXR1cm4gaTsKfQoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5s
aW5lKSkKZG91YmxlIElBNjRfbm9taW5hbF90c2NfZnJlcXVlbmN5X2h6KHJlZ2lzdGVyIElBNjRf
bmNjY190ICpuY2NjKQp7CiAgaWYoIChuY2NjLT50c2NfY2NjX2YgPT0gMCkgfHwgKG5jY2MtPnRz
Y19jY2NfbiA9PSAwKSB8fCAobmNjYy0+dHNjX2NjY19kID09IDApICkKICAgIHJldHVybiAwLjA7
CiAgcmV0dXJuICggKChkb3VibGUpKCBuY2NjLT50c2NfY2NjX2YgKiBuY2NjLT50c2NfY2NjX24p
KSAvICgoZG91YmxlKW5jY2MtPnRzY19jY2NfZCkgKTsKfQoKc3RhdGljIF9fdGhyZWFkCmludCAg
X2NwdTBpZF9mZD0tMTsKc3RhdGljIF9fdGhyZWFkCmNoYXIgX2NwdTBpZF9kYXRhWzI1Nl09ezB9
OwoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKYm9vbCBJQTY0
X2luaXRfY3B1MGlkX2RhdGEoKQp7IGlmKEZBSUwgPT0gKF9jcHUwaWRfZmQgPSBvcGVuKCIvZGV2
L2NwdS8wL2NwdWlkIiwgT19SRE9OTFkpKSkKICB7IGZwcmludGYoc3RkZXJyLF9fRklMRV9fIjol
ZDolczogZmFpbGVkIHRvIG9wZW4gL2Rldi9jcHUvMC9jcHVpZDogJWQ6JyVzJy5cbiIsX19MSU5F
X18sX19GVU5DVElPTl9fLGVycm5vLHN0cmVycm9yKGVycm5vKSk7CiAgICByZXR1cm4gZmFsc2U7
CiAgfQogIGlmKDI1NiAgIT0gcmVhZChfY3B1MGlkX2ZkLCBfY3B1MGlkX2RhdGEsIDI1NikgKQog
IHsgY2xvc2UoX2NwdTBpZF9mZCk7CiAgICBmcHJpbnRmKHN0ZGVycixfX0ZJTEVfXyI6JWQ6JXM6
IGZhaWxlZCB0byByZWFkICV1IGJ5dGVzIG9uIC9kZXYvY3B1LzAvY3B1aWQ6ICVkOiclcycuXG4i
LF9fTElORV9fLF9fRlVOQ1RJT05fXywgMjU2ICwgZXJybm8sc3RyZXJyb3IoZXJybm8pKTsKICAg
IHJldHVybiBmYWxzZTsKICB9CiAgY2xvc2UoX2NwdTBpZF9mZCk7ICAKICByZXR1cm4gdHJ1ZTsK
fQoKCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCmJvb2wKSUE2
NF9oYXNfbm9uc3RvcF90c2Modm9pZCkKeyByZWdpc3RlciBjaGFyIGM9J1wwJzsKICBpZiggX2Nw
dTBpZF9mZCA9PSAtMSApCiAgICBpZiggISBJQTY0X2luaXRfY3B1MGlkX2RhdGEoKSApCiAgICAg
IHJldHVybiBmYWxzZTsKICBjID0gX2NwdTBpZF9kYXRhWyAoKDMqMzIpKzI0KS84IF07CiAgaWYo
IGMgJiAxICkKICB7IC8vZnByaW50ZihzdGRlcnIsImhhcyBub25zdG9wIFRTQ1xuIik7CiAgICBy
ZXR1cm4gdHJ1ZTsKICB9CiAgcmV0dXJuIGZhbHNlOwp9CgpzdGF0aWMgaW5saW5lIF9fYXR0cmli
dXRlX18oKGFsd2F5c19pbmxpbmUpKQpib29sCklBNjRfdHNjX2hhc19hcnQodm9pZCkKeyByZWdp
c3RlciBjaGFyIGM9J1wwJzsKICBpZiggX2NwdTBpZF9mZCA9PSAtMSApCiAgICBpZighSUE2NF9p
bml0X2NwdTBpZF9kYXRhKCkpCiAgICAgIHJldHVybiBmYWxzZTsKICBjID0gX2NwdTBpZF9kYXRh
WyAoKDMqMzIpKzEwKS84IF07ICAKICBpZiggYyAmIDQgKQogIHsKICAgIC8vIGZwcmludGYoc3Rk
ZXJyLCJoYXMgVFNDIEFSVCBoYXJkd2FyZVxuIik7CiAgICByZXR1cm4gdHJ1ZTsKICB9CiAgcmV0
dXJuIGZhbHNlOwp9CgpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUp
KQpib29sCklBNjRfaGFzX3RzY19hZGp1c3Qodm9pZCkKeyByZWdpc3RlciBjaGFyIGM9J1wwJzsK
ICBpZiggX2NwdTBpZF9mZCA9PSAtMSApCiAgICBpZighSUE2NF9pbml0X2NwdTBpZF9kYXRhKCkp
CiAgICAgIHJldHVybiBmYWxzZTsKICBjID0gX2NwdTBpZF9kYXRhWyg5KjMyKzEpLzhdOwogIGlm
KCBjICYgMSApCiAgICByZXR1cm4gdHJ1ZTsKICByZXR1cm4gZmFsc2U7Cn0KICAKX190aHJlYWQK
Ym9vbCBfaWE2NF9pbnZhcmlhbnRfdHNjX2VuYWJsZWQ9ZmFsc2U7CgpzdGF0aWMgaW5saW5lIF9f
YXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQogIGJvb2wgSUE2NF9pbnZhcmlhbnRfdHNjX2lz
X2VuYWJsZWQoIHJlZ2lzdGVyIElBNjRfbmNjY190ICpuY2NjcCwgcmVnaXN0ZXIgZG91YmxlICpu
dHNjZnFwICkKeyBpZiggX2NwdTBpZF9mZCAhPSAtMSApCiAgICByZXR1cm4gX2lhNjRfaW52YXJp
YW50X3RzY19lbmFibGVkOwogIElBNjRfbmNjY190IHRuOwogIGRvdWJsZSB0c2NmcTsKICBpZihO
VUxMID09IG5jY2NwICkKICAgIG5jY2NwID0gJnRuOwogIGlmKE5VTEwgPT0gbnRzY2ZxcCApCiAg
ICBudHNjZnFwID0gJnRzY2ZxOyAgCiAgcmV0dXJuICggX2lhNjRfaW52YXJpYW50X3RzY19lbmFi
bGVkID0KICAoIElBNjRfaGFzX3RzYygpICYmCiAgICBJQTY0X2hhc19jb25zdGFudF90c2MoKSAm
JgogICAgSUE2NF9oYXNfcmR0c2NwKCkgJiYKICAgIElBNjRfaGFzX25vbnN0b3BfdHNjKCkgJiYg
IAogICAgKCAoSUE2NF9oYXNfY3B1aWRfbGVhZl8xNWgoKSAmJgogICAgICAgKCAwLjAgPCAoKm50
c2NmcXAgPSBJQTY0X25vbWluYWxfdHNjX2ZyZXF1ZW5jeV9oeiggKCpuY2NjcCA9IElBNjRfbmNj
YygpLCBuY2NjcCkgKSApICkKICAgICAgKSB8fAogICAgICBJQTY0X2hhc19jcHVpZF9sZWFmXzgw
MDAwMDA3aCgpCiAgICApCiAgKSApOyAgIAp9CgpfX3RocmVhZApVMzJfdCBfaWE2NF90c2Nfa2h6
PTA7CgpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpVMzJfdCBJ
QTY0X3RzY19raHooKQp7IFVMX3Qga3N5bV9hZGRyOyAgICAKICBpZiggX2lhNjRfdHNjX2toeiAh
PSAwICkKICAgIHJldHVybiBfaWE2NF90c2Nfa2h6OwogIGlmKCBfaWE2NF9pbnZhcmlhbnRfdHNj
X2VuYWJsZWQgfHwKICAoKF9jcHUwaWRfZmQgPT0gLTEpICYmIElBNjRfaW52YXJpYW50X3RzY19p
c19lbmFibGVkKE5VTEwsTlVMTCkpCiAgICApCiAgeyByZWdpc3RlciBzaXplX3Qgc3ogPSBnZXRw
YWdlc2l6ZSgpLCBsOwogICAgcmVnaXN0ZXIgY2hhciAqcGFnZSA9IGFsbG9jYShzeik7CiAgICBy
ZWdpc3RlciBjb25zdCBjaGFyICprc3ltX2xvY2F0aW9uID0gKE9LID09IGFjY2VzcyggS1NZTV9M
T0NBVElPTiwgWF9PSyApKSA/IEtTWU1fTE9DQVRJT04gOiAoKE9LID09IGFjY2VzcyggIi4va3N5
bSIsIFhfT0sgKSkgPyAiLi9rc3ltIiA6ICJub3QgZm91bmQiKSA7CiAgICBpZihPSyAhPSBhY2Nl
c3MoIGtzeW1fbG9jYXRpb24sIFhfT0sgKSkKICAgIHsgZnByaW50ZihzdGRlcnIsX19GSUxFX18i
OiVkOiglcyk6IHVuYWJsZSB0byBsb2NhdGUgZXhlY3V0YWJsZSAlcyBzY3JpcHQgLSBLU1lNX0xP
Q0FUSU9OOiAlcy5cbiIsX19MSU5FX18sX19GVU5DVElPTl9fLCBrc3ltX2xvY2F0aW9uLCBLU1lN
X0xPQ0FUSU9OKTsKICAgICAgcmV0dXJuIDA7CiAgICB9CiAgICBsPXNucHJpbnRmKHBhZ2UsIHN6
LCIlcyB0c2Nfa2h6IDQiLCBrc3ltX2xvY2F0aW9uKTsKICAgIHJlZ2lzdGVyIEZJTEUgKmtzeW1f
ZnA9cG9wZW4ocGFnZSwgInIiKTsKICAgIGlmKCBmc2NhbmYoa3N5bV9mcCwgIiVseCAlcyAleFxu
IiwgJmtzeW1fYWRkciwgcGFnZSwgJl9pYTY0X3RzY19raHopICE9IDMgKQogICAgeyBmcHJpbnRm
KHN0ZGVycixfX0ZJTEVfXyI6JWQ6KCVzKTogL3Vzci9iaW4va3N5bSBmYWlsZWQgdG8gbG9va3Vw
IG9yIHByb3ZpZGUgYSB2YWx1ZSBmb3IgdHNjX2toei5cbiIsX19MSU5FX18sX19GVU5DVElPTl9f
KTsKICAgICAgZmNsb3NlKGtzeW1fZnApOwogICAgICByZXR1cm4gMDsKICAgIH0KICAgIGZjbG9z
ZShrc3ltX2ZwKTsgICAgCiAgfQogIHJldHVybiBfaWE2NF90c2Nfa2h6Owp9CgojZW5kaWYKCgAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdHRzYy90dHNjMS5jAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMDAwMAAwMDAwMDAwADAwMDAwMDEwNTA0ADEzMDUzMzUx
NzEyADAxMTczMwAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB1
c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcm9vdAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAvKiB0dHNjMS5jIDogRGVtb25zdHJhdGVzIGxhdGVu
Y3kgb2YgdXNlIG9mIElBNjRfcmR0c2MuaCdzIElBNjRfc19uc19zaW5jZV9zdGFydCgpICB2cy4g
dXNpbmcgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUNfUkFXKQogKi8KI2RlZmluZSBfR05V
X1NPVVJDRQojaW5jbHVkZSA8ZmVhdHVyZXMuaD4KI2luY2x1ZGUgPHN5cy90eXBlcy5oPgojaW5j
bHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRhcmcuaD4KI2luY2x1ZGUgPHN0ZGJvb2wuaD4K
I2luY2x1ZGUgPHRpbWUuaD4KI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDx1bmlzdGQu
aD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHB0aHJl
YWQuaD4KI2luY2x1ZGUgPHNldGptcC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0
ZGxpYi5oPgoKI2luY2x1ZGUgIklBNjRfdHNjX2luZm8uaCIKI2luY2x1ZGUgIklBNjRfcmR0c2Mu
aCIKCmludCBtYWluKGludCBhcmdjLCBjb25zdCBjaGFyICpjb25zdCogYXJndiwgY29uc3QgY2hh
ciAqY29uc3QqIGVudnApCnsgYm9vbAogICAgaGFzX3RzYyAgICAgICAgID1JQTY0X2hhc190c2Mo
KQogICwgaGFzX2NvbnN0YW50X3RzYz1JQTY0X2hhc19jb25zdGFudF90c2MoKQogICwgaGFzXzE1
aCAgICAgICAgID1JQTY0X2hhc19jcHVpZF9sZWFmXzE1aCgpCiAgLCBoYXNfODAwMDAwMDdoICAg
PUlBNjRfaGFzX2NwdWlkX2xlYWZfODAwMDAwMDdoKCk7CiAgZnByaW50ZihzdGRlcnIsImhhcyB0
c2M6ICV1IGNvbnN0YW50OiAldVxuIixoYXNfdHNjLCBoYXNfY29uc3RhbnRfdHNjKTsKICBpZigg
aGFzX3RzYyAmJiBoYXNfY29uc3RhbnRfdHNjICkKICB7IFVMX3QgdHNjX2toeiA9IElBNjRfdHNj
X2toeigpOwogICAgSUE2NF9uY2NjX3QgbmNjYzsKICAgIGRvdWJsZSB0c2Nfbl9mcmVxOwogICAg
Ym9vbCB0c2NfaXNfZW5hYmxlZCA9IElBNjRfaW52YXJpYW50X3RzY19pc19lbmFibGVkKCZuY2Nj
LCAmdHNjX25fZnJlcSk7CiAgICBpZiggdHNjX2lzX2VuYWJsZWQgJiYgIGhhc18xNWggKQogICAg
ICAgIGZwcmludGYoc3RkZXJyLCJJbnZhcmlhbnQgVFNDIGlzIGVuYWJsZWQgOiBUU0MgLyBDQ0M6
ICV1IC8gJXUgPSAldSA7IENDQyBmcmVxOiAldUh6ICBOb21pbmFsIFRTQyBmcmVxOjogJS45RUh6
IDogQWN0dWFsIFRTQyBmcmVxOiAlLjlHR0h6IC0gVFNDIGFkanVzdDogJXUuXG4iCiAgICAgICAg
LCBuY2NjLnRzY19jY2NfbiAsIG5jY2MudHNjX2NjY19kCiAgICAgICAgLCBuY2NjLnRzY19jY2Nf
biAvIG5jY2MudHNjX2NjY19kCiAgICAgICAgLCBuY2NjLnRzY19jY2NfZgogICAgICAgICwgdHNj
X25fZnJlcQogICAgICAgICwgKCgoZG91YmxlKXRzY19raHopKjFlMykvMWU5CiAgICAgICAgLCBJ
QTY0X2hhc190c2NfYWRqdXN0KCkKICAgICAgICApOwogICAgZWxzZSBpZiggdHNjX2lzX2VuYWJs
ZWQgJiYgIGhhc184MDAwMDAwN2ggKSAgICAgCiAgICAgIGZwcmludGYoc3RkZXJyLCJJbnZhcmlh
bnQgVFNDIGlzIGVuYWJsZWQ6IEFjdHVhbCBUU0MgZnJlcTogJS45R0dIeiAtIFRTQyBhZGp1c3Q6
ICV1LlxuIiwoKChkb3VibGUpdHNjX2toeikqMWUzKS8xZTksIElBNjRfaGFzX3RzY19hZGp1c3Qo
KSk7CiAgICBpZih0c2NfaXNfZW5hYmxlZCkKICAgIHsgc3RydWN0IHRpbWVzcGVjIHRzcDEsIHRz
cDIsIHRzcF9iLCB0c3BfZTsKICAgICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUNfUkFX
LCZ0c3BfYik7CiAgICAgIGNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDX1JBVywmdHNwMSk7
CiAgICAgIGNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDX1JBVywmdHNwMik7ICAgICAgICAg
ICAgCiAgICAgIHJlZ2lzdGVyIFVMX3QgdHMwID0gSUE2NF9zX25zX3NpbmNlX3N0YXJ0KCk7ICAg
ICAgCiAgICAgIHJlZ2lzdGVyIFVMX3QgdHMyID0gSUE2NF9zX25zX3NpbmNlX3N0YXJ0KCk7CiAg
ICAgIHJlZ2lzdGVyIFVMX3QgdHMxID0gdHMyOwogICAgICByZWdpc3RlciBVTF90IHRzMyA9IElB
NjRfc19uc19zaW5jZV9zdGFydCgpOwogICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05J
Q19SQVcsJnRzcF9lKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
cmVnaXN0ZXIgVTEyOF90CiAgICAgICAgbl9uczE9KCgoKChVMTI4X3QpdHNwMi50dl9zZWMpICog
MTAwMDAwMDAwMFVMTCkgKyAoKFUxMjhfdCkgdHNwMi50dl9uc2VjKSkgLSAgICAgIAogICAgICAg
ICAgICAgICAoKCgoVTEyOF90KXRzcDEudHZfc2VjKSAqIDEwMDAwMDAwMDBVTEwpICsgKChVMTI4
X3QpIHRzcDEudHZfbnNlYykpKQogICAgICAsIG5fbnMyPSgoKCgoVTEyOF90KXRzcF9lLnR2X3Nl
YykgKiAxMDAwMDAwMDAwVUxMKSArICgoVTEyOF90KSB0c3BfZS50dl9uc2VjKSkgLSAgICAgIAog
ICAgICAgICAgICAgICAoKCgoVTEyOF90KXRzcF9iLnR2X3NlYykgKiAxMDAwMDAwMDAwVUxMKSAr
ICgoVTEyOF90KSB0c3BfYi50dl9uc2VjKSkpOwogICAgICBmcHJpbnRmKHN0ZGVyciwgInRzMiAt
IHRzMTogJWx1IHRzMyAtIHRzMjogJWx1IG5zMTogJXUuJS45dSBuczI6ICV1LiUuOXVcbiIsIHRz
MiAtIHRzMCwgdHMzLXRzMgogICAgICAgICAgICAgICwoKFUzMl90KShuX25zMSAvIDEwMDAwMDAw
MDBVTEwpJjB4ZmZmZmZmZmZVKSwgKChVMzJfdCkgKG5fbnMxICUgMTAwMDAwMDAwMFVMTCkgJiAw
eGZmZmZmZmZmVUwpCiAgICAgICAgICAgICAgLCgoVTMyX3QpKG5fbnMyIC8gMTAwMDAwMDAwMFVM
TCkmMHhmZmZmZmZmZlUpLCAoKFUzMl90KSAobl9uczIgJSAxMDAwMDAwMDAwVUxMKSAmIDB4ZmZm
ZmZmZmZVTCkKICAgICAgICAgICAgKTsKICAgICAgcmVnaXN0ZXIgYnl0ZV90IGk7ICAgIAogICAg
ICBmb3IoIGkgPSAwOyBpIDwgMTA7IGkrPTEgKQogICAgICB7IGNsb2NrX2dldHRpbWUoQ0xPQ0tf
TU9OT1RPTklDX1JBVywmdHNwMSk7CiAgICAgICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9O
SUNfUkFXLCZ0c3AyKTsgICAgICAKICAgICAgICB0czIgPSBJQTY0X3NfbnNfc2luY2Vfc3RhcnQo
KTsgICAgICAKICAgICAgICB0czMgPSBJQTY0X3NfbnNfc2luY2Vfc3RhcnQoKTsKICAgICAgICBu
X25zMT0oKCgoKFUxMjhfdCl0c3AyLnR2X3NlYykgKiAxMDAwMDAwMDAwVUxMKSArICgoVTEyOF90
KSB0c3AyLnR2X25zZWMpKSAtICAgICAgCiAgICAgICAgICAgICAgICgoKChVMTI4X3QpdHNwMS50
dl9zZWMpICogMTAwMDAwMDAwMFVMTCkgKyAoKFUxMjhfdCkgdHNwMS50dl9uc2VjKSkpCiAgICAg
ICAgICAgICAgOwogICAgICAgIGZwcmludGYoc3RkZXJyLCAidHMzIC0gdHMyOiAlbHUgbnMxOiAl
bHUuJS45bHVcbiIsIHRzMyAtIHRzMgogICAgICAgICAgICAgICAsKChVMzJfdCkobl9uczEgLyAx
MDAwMDAwMDAwVUxMKSYweGZmZmZmZmZmVSksICgoVTMyX3QpIChuX25zMSAlIDEwMDAwMDAwMDBV
TEwpICYgMHhmZmZmZmZmZlVMKSk7CiAgICAgICAgdHMxPSBJQTY0X3NfbnNfc2luY2Vfc3RhcnQo
KTsKICAgICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQ19SQVcsJnRzcF9lKTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgfQogICAgICBuX25zMj0oKCgoKFUxMjhf
dCl0c3BfZS50dl9zZWMpICogMTAwMDAwMDAwMFVMTCkgKyAoKFUxMjhfdCkgdHNwX2UudHZfbnNl
YykpIC0gICAgICAKICAgICAgICAgICAgKCgoKFUxMjhfdCl0c3BfYi50dl9zZWMpICogMTAwMDAw
MDAwMFVMTCkgKyAoKFUxMjhfdCkgdHNwX2IudHZfbnNlYykpKTsgICAgICAKICAgICAgZnByaW50
ZihzdGRlcnIsICJ0MSAtIHQwOiAlbHUgLSBuczI6ICVsdS4lLjlsdVxuIiwgdHMxIC0gdHMwCiAg
ICAgICwoKFUzMl90KShuX25zMiAvIDEwMDAwMDAwMDBVTEwpJjB4ZmZmZmZmZmZVKSwgKChVMzJf
dCkgKG5fbnMyICUgMTAwMDAwMDAwMFVMTCkgJiAweGZmZmZmZmZmVUwpKTsgICAgICAKICAgIH0g
ZWxzZQogICAgeyAgZnByaW50ZihzdGRlcnIsX19GSUxFX18iJWQ6KCVzKTogc29ycnksIG1vZGVy
biA3dGgtZ2VuZXJhdGlvbiBJbnRlbCBcIkludmFyaWFudCBUU0NcIiB3aXRoIEFSVCAoYWx3YXlz
IHJ1bm5pbmcgdGltZXIpIGlzIG5vdCBmdWxseSBlbmFibGVkIG9uIHRoaXMgcGxhdGZvcm0gOlxu
XHRoYXNfdHNjOiAldSBoYXNfbGVhZl8xNWg6ICV1IGhhc19sZWFmXzgwMDAwMDA3aDogJXUgaGFz
X2NvbnN0YW50X3RzYzogJXUgaGFzX3JkdHNjcDogJXUgaGFzX25vbnN0b3BfdHNjOiAldSBcbiIs
X19MSU5FX18sX19GVU5DVElPTl9fLAogICAgICAgaGFzX3RzYyAsIGhhc18xNWgsIGhhc184MDAw
MDAwN2gsIGhhc19jb25zdGFudF90c2MsCiAgICAgICBJQTY0X2hhc19yZHRzY3AoKSwKICAgICAg
IElBNjRfaGFzX25vbnN0b3BfdHNjKCkKICAgICAgKTsKICAgIH0KICB9CiAgcmV0dXJuIDA7Cn0K
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAB0dHNjL0lBNjRfcmR0c2MuaH4AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAMDAwMDY0NAAwMDAwMDAwADAwMDAwMDAAMDAwMDAwMTQ0MTcAMTMwNTIwNjI3MTcAMDEyNzU0
ACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzdGFyICAAcm9v
dAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAByb290AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAC8qIEBGSUxFOiBJQTY0X3JkdHNjLmggOiBtYWtlcyBJbnRlbCBDb3Jl
LWk3IEFyY2hpdGVjdHVyZSB4ODZfNjQgVFNDIFZhbHVlcyBhdmFpbGFibGUgaW4gVXNlciBTcGFj
ZQogKiAgIHNlZTogU0RNOiAiSW50ZWzCriA2NCBhbmQgSUEtMzIgQXJjaGl0ZWN0dXJlcyBTb2Z0
d2FyZSBEZXZlbG9wZXLigJlzIE1hbnVhbCIgOiBodHRwczovL3NvZnR3YXJlLmludGVsLmNvbS9l
bi11cy9hcnRpY2xlcy9pbnRlbC1zZG0KICogICAgICAgICB2MywgU0RHLCDCpyAxNy4xNjogIlRp
bWUgU3RhbXAgQ291bnRlciIsIHYyLCBjaCA0LCDCpyA1NDcgIlJEVFNDUOKAlFJlYWQgVGltZS1T
dGFtcCBDb3VudGVyIGFuZCBQcm9jZXNzb3IgSUQiIGluc3RydWN0aW9uIDsKICogICAgICAgICBM
aW51eCdzIGtlcm5lbC90aW1lL2Nsb2Nrc291cmNlLmMgY2xvY2tzX2NhbGNfbXVsdF9zaGlmdCgp
IGZ1bmN0aW9uLgogKiBDb3B5bGVmdCAoQykgMjAxNysgSmFzb24gVmFzIERpYXMgKEpWRCkgPGph
c29uLnZhcy5kaWFzQGdtYWlsLmNvbT4gLSBPbmx5IEF1dGhvcnNoaXAgUmlnaHRzIFJlc2VydmVk
LgogKi8KI2lmbmRlZiBfSUE2NF9SRFRTQ19IXwojZGVmaW5lIF9JQTY0X1JEVFNDX0hfCiNpbmNs
dWRlICJJQTY0X3RzY19pbmZvLmgiCiNpbmNsdWRlIDxtYXRoLmg+Cl9fdGhyZWFkClUzMl90IF9p
YTY0X3RzY191c2VyX2NwdTsgLyogVFNDIEF1eCB2YWx1ZSBpZGVudGlmaWVzIENQVSAqLwoKc3Rh
dGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKVTY0X3QKSUE2NF90c2Nf
bm93KCkKeyBpZighKCAgICBfaWE2NF9pbnZhcmlhbnRfdHNjX2VuYWJsZWQKICAgICAgfHwoKCBf
Y3B1MGlkX2ZkID09IC0xKSAmJiBJQTY0X2ludmFyaWFudF90c2NfaXNfZW5hYmxlZChOVUxMLE5V
TEwpKQogICAgICApCiAgICApCiAgeyBmcHJpbnRmKHN0ZGVyciwgX19GSUxFX18iOiVkOiglcyk6
IG11c3QgYmUgY2FsbGVkIHdpdGggaW52YXJpYW50IFRTQyBlbmFibGVkLlxuIik7CiAgICByZXR1
cm4gMDsKICB9CiAgVTMyX3QgdHNjX2hpLCB0c2NfbG87CiAgcmVnaXN0ZXIgVUxfdCB0c2M7CiAg
YXNtIHZvbGF0aWxlCiAgKCAicmR0c2NwXG5cdCIKICAgICJtb3YgJSVlZHgsICUwXG5cdCIKICAg
ICJtb3YgJSVlYXgsICUxXG5cdCIKICAgICJtb3YgJSVlY3gsICUyXG5cdCIgIAogIDogIj1tIiAo
dHNjX2hpKSAsCiAgICAiPW0iICh0c2NfbG8pICwKICAgICI9bSIgKF9pYTY0X3RzY191c2VyX2Nw
dSkgOiAgCiAgOiAiJWVheCIsIiVlY3giLCIlZWR4IgogICk7CiAgdHNjPSgoKFVMX3QpdHNjX2hp
KSA8PCAzMil8KChVTF90KXRzY19sbyk7CiAgcmV0dXJuIHRzYzsKfQoKX190aHJlYWQKVTY0X3Qg
X2lhNjRfZmlyc3RfdHNjID0gMHhmZmZmZmZmZmZmZmZmZmZmVUw7CgpzdGF0aWMgaW5saW5lIF9f
YXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpVNjRfdCBJQTY0X3RzY190aWNrc19zaW5jZV9z
dGFydCgpCnsgaWYoX2lhNjRfZmlyc3RfdHNjID09IDB4ZmZmZmZmZmZmZmZmZmZmZlVMKQogIHsg
X2lhNjRfZmlyc3RfdHNjID0gSUE2NF90c2Nfbm93KCk7CiAgICByZXR1cm4gMDsKICB9CiAgcmV0
dXJuIChJQTY0X3RzY19ub3coKSAtIF9pYTY0X2ZpcnN0X3RzYykgOwp9CgpzdGF0aWMgaW5saW5l
IF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpVNjRfdCBJQTY0X3NfbnNfc2luY2Vfc3Rh
cnRfYSgpCnsgc3RhdGljIF9fdGhyZWFkCiAgVTEyOF90IF90c2NfcF9zID0gfjBVTEw7CiAgaWYo
IF90c2NfcF9zID09IH4wVUxMICkKICAgIF90c2NfcF9zID0gIDEwMDAwMDAwMDAwMDBVTEwgLyAg
CiAgICAgICAoICgoVTEyOF90KUlBNjRfdHNjX2toeigpKSAqIDEwMDBVTEwgKQogICAgOyAvKiBu
dW1iZXIgb2YgcGV0YT8tKDFlLTEyKXNlY29uZHMgcGVyIFRTQyB0aWNrICovCiAgcmVnaXN0ZXIg
VTEyOF90IG5fcHMgPSBJQTY0X3RzY190aWNrc19zaW5jZV9zdGFydCgpICogX3RzY19wX3M7ICAg
ICAgICAgICAgICAgICAgICAvKiAxZS0xMiBzZWNvbmRzICovCiAgcmVnaXN0ZXIgVUxfdCAgIG4g
ICAgPSAobl9wcyAvIDEwMDBVTEwpICsgKChuX3BzICUgMTAwMFVMTD40OTkpPzE6MCkgOwogIHJl
Z2lzdGVyIFVMX3QgICBzICAgID0gbiAvIDEwMDAwMDAwMDBVTDsKICByZWdpc3RlciBVTF90ICAg
bl9ucyA9IG4gJSAxMDAwMDAwMDAwVUw7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC8qIDFlLTkgIHNlY29uZHMgKi8gIAogIHJldHVybiAgKCAocyA8PCAzMikgfCBu
X25zICk7ICAKfQoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkK
VTY0X3QgSUE2NF9zX25zX3NpbmNlX3N0YXJ0X2IoKQp7IHN0YXRpYyBfX3RocmVhZAogIGRvdWJs
ZSBfdHNjX3BfcyA9IDAuMDsKICBpZiggX3RzY19wX3MgPT0gMC4wICkKICAgIF90c2NfcF9zID0g
MS4wIC8gKElBNjRfdHNjX2toeigpICogMWUzKTsKICByZWdpc3RlciBVTF90IHRpY2tzICA9IElB
NjRfdHNjX3RpY2tzX3NpbmNlX3N0YXJ0KCkgOwogIHJlZ2lzdGVyIGRvdWJsZSB0cyAgID0gdGlj
a3MgKiBfdHNjX3BfczsKICByZWdpc3RlciBVTF90ICAgcyAgICA9IGZsb29yKCAoIHRzICogMWU5
ICkgLyAxZTkgKTsKICByZWdpc3RlciBVTF90ICAgbl9ucyA9ICggdHMgKiAxZTkgKSAtIHM7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIDFlLTkgIHNlY29uZHMg
Ki8gIAogIHJldHVybiAgKCAocyA8PCAzMikgfCBuX25zICk7ICAKfQoKI2RlZmluZSBOU0VDX1BF
Ul9TRUMgMTAwMDAwMDAwMAoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5s
aW5lKSkKdm9pZAppYTY0X3RzY19jYWxjX211bHRfc2hpZnQKKCByZWdpc3RlciBVMzJfdCAqbXVs
dCwKICByZWdpc3RlciBVMzJfdCAqc2hpZnQKKQp7IC8qIHBhcmFwaHJhc2VzIExpbnV4IGNsb2Nr
c291cmNlLmMncyBjbG9ja3NfY2FsY19tdWx0X3NoaWZ0KCkgZnVuY3Rpb246CiAgICogY2FsY3Vs
YXRlcyBzZWNvbmQgKyBuYW5vc2Vjb25kIG11bHQgKyBzaGlmdCBpbiBzYW1lIHdheSBsaW51eCBk
b2VzLiAKICAgKiBJdCBpcyBhIHNoYW1lIHdlIGNhbm5vdCB1c2UgbnVtZXJpY2FsbHkgYWNjdXJh
dGUgdmFsdWVzIGNhbGN1bGF0ZWQgYXMgaW4gSUE2NF9zX25zX3NpbmNlX3N0YXJ0X2IoKQogICAq
IG9yIElBNjRfc19uc19zaW5jZV9zdGFydF9hKCkgYWJvdmUsIGJ1dCB0aGV5IHRha2UgbXVjaCBs
b25nZXIgYXMgdGhleSB1c2UgbG9uZyByZWdpc3RlcnMsIGFuZCAKICAgKiB3ZSB3YW50IHRvIGJl
IGNvbXBhdGlibGUgd2l0aCB3aGF0IGxpbnV4IHJldHVybnMgaW4gc3RydWN0IHRpbWVzcGVjIHRz
IGFmdGVyIGNhbGwgdG8gCiAgICogY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUNfUkFXLCAm
dHMpLgogICAqLwogIGNvbnN0IFUzMl90IHNjYWxlPTEwMDBVOwogIHJlZ2lzdGVyIFUzMl90IGZy
b209IElBNjRfdHNjX2toeigpOwogIHJlZ2lzdGVyIFUzMl90IHRvICA9IE5TRUNfUEVSX1NFQyAv
IHNjYWxlOwogIHJlZ2lzdGVyIFU2NF90IHNlYyA9ICggfjBVTCAvIGZyb20gKSAvIHNjYWxlOyAg
CiAgc2VjID0gKHNlYyA+IDYwMCkgPyA2MDAgOiAoKHNlYyA+IDApID8gc2VjIDogMSk7CiAgcmVn
aXN0ZXIgVTY0X3QgbWF4c2VjID0gc2VjICogc2NhbGU7CiAgVUxfdCB0bXA7CiAgVTMyX3Qgc2Z0
LCBzZnRhY2M9MzI7CiAgLyoKICAgKiBDYWxjdWxhdGUgdGhlIHNoaWZ0IGZhY3RvciB3aGljaCBp
cyBsaW1pdGluZyB0aGUgY29udmVyc2lvbgogICAqIHJhbmdlOgogICAqLwogIHRtcCA9IChtYXhz
ZWMgKiBmcm9tKSA+PiAzMjsKICB3aGlsZSAodG1wKQogIHsgdG1wID4+PTE7CiAgICBzZnRhY2Mt
LTsKICB9CiAgLyoKICAgKiBGaW5kIHRoZSBjb252ZXJzaW9uIHNoaWZ0L211bHQgcGFpciB3aGlj
aCBoYXMgdGhlIGJlc3QKICAgKiBhY2N1cmFjeSBhbmQgZml0cyB0aGUgbWF4c2VjIGNvbnZlcnNp
b24gcmFuZ2U6CiAgICovCiAgZm9yIChzZnQgPSAzMjsgc2Z0ID4gMDsgc2Z0LS0pIAogIHsgdG1w
ID0gKChVTF90KSB0bykgPDwgc2Z0OwogICAgdG1wICs9IGZyb20gLyAyOwogICAgdG1wID0gdG1w
IC8gZnJvbTsKICAgIGlmICgodG1wID4+IHNmdGFjYykgPT0gMCkKICAgICAgYnJlYWs7CiAgfQog
ICptdWx0ID0gdG1wOwogICpzaGlmdCA9IHNmdDsKfQoKX190aHJlYWQKVTMyX3QgX2lhNjRfdHNj
X211bHQgPSB+MFUsIF9pYTY0X3RzY19zaGlmdD1+MFU7CgpzdGF0aWMgaW5saW5lIF9fYXR0cmli
dXRlX18oKGFsd2F5c19pbmxpbmUpKQpVNjRfdCBJQTY0X3NfbnNfc2luY2Vfc3RhcnQoKQp7IGlm
KCAoIF9pYTY0X3RzY19tdWx0ID09IH4wVSApIHx8ICggX2lhNjRfdHNjX3NoaWZ0ID09IH4wVSAp
ICkKICAgIGlhNjRfdHNjX2NhbGNfbXVsdF9zaGlmdCggJl9pYTY0X3RzY19tdWx0LCAmX2lhNjRf
dHNjX3NoaWZ0KTsKICByZWdpc3RlciBVNjRfdCBjeWNsZXMgPSBJQTY0X3RzY190aWNrc19zaW5j
ZV9zdGFydCgpOyAgIAogIHJlZ2lzdGVyIFU2NF90IG5zID0gKChjeWNsZXMgKigoVUxfdClfaWE2
NF90c2NfbXVsdCkpPj5faWE2NF90c2Nfc2hpZnQpOwogIHJldHVybiggKCgobnMgLyBOU0VDX1BF
Ul9TRUMpJjB4ZmZmZmZmZmZVTCkgPDwgMzIpIHwgKChucyAlIE5TRUNfUEVSX1NFQykmMHgzZmZm
ZmZmZlVMKSApOwogIC8qIFllcywgd2UgYXJlIHB1cnBvc2VmdWxseSBpZ25vcmluZyBkdXJhdGlv
bnMgb2YgbW9yZSB0aGFuIDQuMiBiaWxsaW9uIHNlY29uZHMgaGVyZSEgKi8KfQoKLypjcmFzaD4g
cC94ICB2c3lzY2FsbF9ndG9kX2RhdGEKJDQgPSB7CiAgc2VxID0gMHhiMzFiNjQsCiAgdmNsb2Nr
X21vZGUgPSAweDEsCiAgY3ljbGVfbGFzdCA9IDB4NjMxOGY2ZTkzMWFlLAogIG1hc2sgPSAweGZm
ZmZmZmZmZmZmZmZmZmYsCiAgbXVsdCA9IDB4NTg3YWZkLAogIHNoaWZ0ID0gMHgxOCwKICB3YWxs
X3RpbWVfc25zZWMgPSAweDM3Y2NkNWRiOWNjYjhhLAogIHdhbGxfdGltZV9zZWMgPSAweDU4YTY3
ODhiLAogIG1vbm90b25pY190aW1lX3NlYyA9IDB4OTMwYywKICBtb25vdG9uaWNfdGltZV9zbnNl
YyA9IDB4Mzg0OGE2MjU5Y2NiOGEsCiAgd2FsbF90aW1lX2NvYXJzZV9zZWMgPSAweDU4YTY3ODhi
LAogIHdhbGxfdGltZV9jb2Fyc2VfbnNlYyA9IDB4MzdjY2Q1ZGIsCiAgbW9ub3RvbmljX3RpbWVf
Y29hcnNlX3NlYyA9IDB4OTMwYywKICBtb25vdG9uaWNfdGltZV9jb2Fyc2VfbnNlYyA9IDB4Mzg0
OGE2MjUsCiAgdHpfbWludXRlc3dlc3QgPSAweDAsCiAgdHpfZHN0dGltZSA9IDB4MAp9CgoKY3Jh
c2g+IHAgIHZzeXNjYWxsX2d0b2RfZGF0YQp2c3lzY2FsbF9ndG9kX2RhdGEgPSAkMyA9IHsKICBz
ZXEgPSAxMTQzNTUyOCwKICB2Y2xvY2tfbW9kZSA9IDEsCiAgY3ljbGVfbGFzdCA9IDEwNjI0MTU1
Mjk2Nzc0NywKICBtYXNrID0gMTg0NDY3NDQwNzM3MDk1NTE2MTUsCiAgbXVsdCA9IDU3OTg2NTMs
CiAgc2hpZnQgPSAyNCwKICB3YWxsX3RpbWVfc25zZWMgPSAxMjcxNzYxNjU1MDg4OTczMiwKICB3
YWxsX3RpbWVfc2VjID0gMTQ4NzMwMzkwNCwKICBtb25vdG9uaWNfdGltZV9zZWMgPSAzNjcwNSwK
ICBtb25vdG9uaWNfdGltZV9zbnNlYyA9IDEyODUzNzUxMDc1ODE3NzMyLAogIHdhbGxfdGltZV9j
b2Fyc2Vfc2VjID0gMTQ4NzMwMzkwNCwKICB3YWxsX3RpbWVfY29hcnNlX25zZWMgPSA3NTgwMjkw
MTYsCiAgbW9ub3RvbmljX3RpbWVfY29hcnNlX3NlYyA9IDM2NzA1LAogIG1vbm90b25pY190aW1l
X2NvYXJzZV9uc2VjID0gNzY2MTQzMjY2LAogIHR6X21pbnV0ZXN3ZXN0ID0gMCwKICB0el9kc3R0
aW1lID0gMAp9CgpJbnNwZWN0aW9uIHNob3dzIHRoYXQgYWJvdmUgY29kZSBjYWxjdWxhdGVzIFNB
TUUgbXVsdCBhbmQgc2hpZnQgdmFsdWVzIGFzIGluIAp0aGUgYWN0dWFsIGxpbnV4IHZzeXNjYWxs
X2d0b2RfZGF0YSAnc2hpZnQnIGFuZCAnbXVsdCcgdmFsdWVzLCBhbmQgdGhhdCAKdGhlIGV4cHJl
c3Npb24gOgogICAgKChjeWNsZXMgKigoVUxfdClfaWE2NF90c2NfbXVsdCkpPj5faWE2NF90c2Nf
c2hpZnQpCmFjdHVhbGx5IGRvZXMgY29ycmVzcG9uZCB0byB3aGF0IGxpbnV4IHdvdWxkIGRvIHdp
dGggdGhlIFRTQyB2YWx1ZSB0byBnZXQgdGltZXNwZWMgdHZfc2VjIChoaWdoIDY0IGJpdHMpIAph
bmQgdGltZXNwZWMgdHZfbnNlYyAobG93IDMwIGJpdHMpIC4KCklNSE8sIEl0IGlzIGEgc2hhbWUg
dGhhdCB0aGUgYWN0dWFsIGhhcmR3YXJlIEFSVCBudW1lcmF0b3IgKyBkZW5vbWluYXRvciArIENy
eXN0YWwgQ2xvY2sgZnJlcXVlbmN5IGFyZW4ndAphY3R1YWxseSB1c2VkIGluIExpbnV4J3MgY2Fs
Y3VsYXRpb25zISAoZXhjZXB0IGluIGUxMDAwIGRyaXZlcidzICdQVFAnIHRpbWVzdGFtcC1zeW5j
aHJvbml6YXRpb24td2l0aC1yZW1vdGUtaG9zdCBjb2RlKS4KICovCiNlbmRpZgoAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAdHRzYy9JQTY0X3JkdHNjLmgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAw
MDAwMAAwMDAwMDAwADAwMDAwMDE0NDE3ADEzMDUzMzUyMjcwADAxMjU1MwAgMAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAvKiBARklMRTogSUE2NF9yZHRzYy5oIDogbWFrZXMgSW50ZWwgQ29yZS1pNyBBcmNoaXRlY3R1
cmUgeDg2XzY0IFRTQyBWYWx1ZXMgYXZhaWxhYmxlIGluIFVzZXIgU3BhY2UKICogICBzZWU6IFNE
TTogIkludGVswq4gNjQgYW5kIElBLTMyIEFyY2hpdGVjdHVyZXMgU29mdHdhcmUgRGV2ZWxvcGVy
4oCZcyBNYW51YWwiIDogaHR0cHM6Ly9zb2Z0d2FyZS5pbnRlbC5jb20vZW4tdXMvYXJ0aWNsZXMv
aW50ZWwtc2RtCiAqICAgICAgICAgdjMsIFNERywgwqcgMTcuMTY6ICJUaW1lIFN0YW1wIENvdW50
ZXIiLCB2MiwgY2ggNCwgwqcgNTQ3ICJSRFRTQ1DigJRSZWFkIFRpbWUtU3RhbXAgQ291bnRlciBh
bmQgUHJvY2Vzc29yIElEIiBpbnN0cnVjdGlvbiA7CiAqICAgICAgICAgTGludXgncyBrZXJuZWwv
dGltZS9jbG9ja3NvdXJjZS5jIGNsb2Nrc19jYWxjX211bHRfc2hpZnQoKSBmdW5jdGlvbi4KICog
Q29weWxlZnQgKEMpIDIwMTcrIEphc29uIFZhcyBEaWFzIChKVkQpIDxqYXNvbi52YXMuZGlhc0Bn
bWFpbC5jb20+IC0gT25seSBBdXRob3JzaGlwIFJpZ2h0cyBSZXNlcnZlZC4KICovCiNpZm5kZWYg
X0lBNjRfUkRUU0NfSF8KI2RlZmluZSBfSUE2NF9SRFRTQ19IXwojaW5jbHVkZSAiSUE2NF90c2Nf
aW5mby5oIgojaW5jbHVkZSA8bWF0aC5oPgpfX3RocmVhZApVMzJfdCBfaWE2NF90c2NfdXNlcl9j
cHU7IC8qIFRTQyBBdXggdmFsdWUgaWRlbnRpZmllcyBDUFUgKi8KCnN0YXRpYyBpbmxpbmUgX19h
dHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpClU2NF90CklBNjRfdHNjX25vdygpCnsgaWYoISgg
ICAgX2lhNjRfaW52YXJpYW50X3RzY19lbmFibGVkCiAgICAgIHx8KCggX2NwdTBpZF9mZCA9PSAt
MSkgJiYgSUE2NF9pbnZhcmlhbnRfdHNjX2lzX2VuYWJsZWQoTlVMTCxOVUxMKSkKICAgICAgKQog
ICAgKQogIHsgZnByaW50ZihzdGRlcnIsIF9fRklMRV9fIjolZDooJXMpOiBtdXN0IGJlIGNhbGxl
ZCB3aXRoIGludmFyaWFudCBUU0MgZW5hYmxlZC5cbiIpOwogICAgcmV0dXJuIDA7CiAgfQogIFUz
Ml90IHRzY19oaSwgdHNjX2xvOwogIHJlZ2lzdGVyIFVMX3QgdHNjOwogIGFzbSB2b2xhdGlsZQog
ICggInJkdHNjcFxuXHQiCiAgICAibW92ICUlZWR4LCAlMFxuXHQiCiAgICAibW92ICUlZWF4LCAl
MVxuXHQiCiAgICAibW92ICUlZWN4LCAlMlxuXHQiICAKICA6ICI9bSIgKHRzY19oaSkgLAogICAg
Ij1tIiAodHNjX2xvKSAsCiAgICAiPW0iIChfaWE2NF90c2NfdXNlcl9jcHUpIDogIAogIDogIiVy
YXgiLCIlcmN4IiwiJXJkeCIKICApOwogIHRzYz0oKChVTF90KXRzY19oaSkgPDwgMzIpfCgoVUxf
dCl0c2NfbG8pOwogIHJldHVybiB0c2M7Cn0KCl9fdGhyZWFkClU2NF90IF9pYTY0X2ZpcnN0X3Rz
YyA9IDB4ZmZmZmZmZmZmZmZmZmZmZlVMOwoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChh
bHdheXNfaW5saW5lKSkKVTY0X3QgSUE2NF90c2NfdGlja3Nfc2luY2Vfc3RhcnQoKQp7IGlmKF9p
YTY0X2ZpcnN0X3RzYyA9PSAweGZmZmZmZmZmZmZmZmZmZmZVTCkKICB7IF9pYTY0X2ZpcnN0X3Rz
YyA9IElBNjRfdHNjX25vdygpOwogICAgcmV0dXJuIDA7CiAgfQogIHJldHVybiAoSUE2NF90c2Nf
bm93KCkgLSBfaWE2NF9maXJzdF90c2MpIDsKfQoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9f
KChhbHdheXNfaW5saW5lKSkKVTY0X3QgSUE2NF9zX25zX3NpbmNlX3N0YXJ0X2EoKQp7IHN0YXRp
YyBfX3RocmVhZAogIFUxMjhfdCBfdHNjX3BfcyA9IH4wVUxMOwogIGlmKCBfdHNjX3BfcyA9PSB+
MFVMTCApCiAgICBfdHNjX3BfcyA9ICAxMDAwMDAwMDAwMDAwVUxMIC8gIAogICAgICAgKCAoKFUx
MjhfdClJQTY0X3RzY19raHooKSkgKiAxMDAwVUxMICkKICAgIDsgLyogbnVtYmVyIG9mIHBldGE/
LSgxZS0xMilzZWNvbmRzIHBlciBUU0MgdGljayAqLwogIHJlZ2lzdGVyIFUxMjhfdCBuX3BzID0g
SUE2NF90c2NfdGlja3Nfc2luY2Vfc3RhcnQoKSAqIF90c2NfcF9zOyAgICAgICAgICAgICAgICAg
ICAgLyogMWUtMTIgc2Vjb25kcyAqLwogIHJlZ2lzdGVyIFVMX3QgICBuICAgID0gKG5fcHMgLyAx
MDAwVUxMKSArICgobl9wcyAlIDEwMDBVTEw+NDk5KT8xOjApIDsKICByZWdpc3RlciBVTF90ICAg
cyAgICA9IG4gLyAxMDAwMDAwMDAwVUw7CiAgcmVnaXN0ZXIgVUxfdCAgIG5fbnMgPSBuICUgMTAw
MDAwMDAwMFVMOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAx
ZS05ICBzZWNvbmRzICovICAKICByZXR1cm4gICggKHMgPDwgMzIpIHwgbl9ucyApOyAgCn0KCnN0
YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpClU2NF90IElBNjRfc19u
c19zaW5jZV9zdGFydF9iKCkKeyBzdGF0aWMgX190aHJlYWQKICBkb3VibGUgX3RzY19wX3MgPSAw
LjA7CiAgaWYoIF90c2NfcF9zID09IDAuMCApCiAgICBfdHNjX3BfcyA9IDEuMCAvIChJQTY0X3Rz
Y19raHooKSAqIDFlMyk7CiAgcmVnaXN0ZXIgVUxfdCB0aWNrcyAgPSBJQTY0X3RzY190aWNrc19z
aW5jZV9zdGFydCgpIDsKICByZWdpc3RlciBkb3VibGUgdHMgICA9IHRpY2tzICogX3RzY19wX3M7
CiAgcmVnaXN0ZXIgVUxfdCAgIHMgICAgPSBmbG9vciggKCB0cyAqIDFlOSApIC8gMWU5ICk7CiAg
cmVnaXN0ZXIgVUxfdCAgIG5fbnMgPSAoIHRzICogMWU5ICkgLSBzOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAxZS05ICBzZWNvbmRzICovICAKICByZXR1cm4g
ICggKHMgPDwgMzIpIHwgbl9ucyApOyAgCn0KCiNkZWZpbmUgTlNFQ19QRVJfU0VDIDEwMDAwMDAw
MDAKCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCnZvaWQKaWE2
NF90c2NfY2FsY19tdWx0X3NoaWZ0CiggcmVnaXN0ZXIgVTMyX3QgKm11bHQsCiAgcmVnaXN0ZXIg
VTMyX3QgKnNoaWZ0CikKeyAvKiBwYXJhcGhyYXNlcyBMaW51eCBjbG9ja3NvdXJjZS5jJ3MgY2xv
Y2tzX2NhbGNfbXVsdF9zaGlmdCgpIGZ1bmN0aW9uOgogICAqIGNhbGN1bGF0ZXMgc2Vjb25kICsg
bmFub3NlY29uZCBtdWx0ICsgc2hpZnQgaW4gc2FtZSB3YXkgbGludXggZG9lcy4gCiAgICogSXQg
aXMgYSBzaGFtZSB3ZSBjYW5ub3QgdXNlIG51bWVyaWNhbGx5IGFjY3VyYXRlIHZhbHVlcyBjYWxj
dWxhdGVkIGFzIGluIElBNjRfc19uc19zaW5jZV9zdGFydF9iKCkKICAgKiBvciBJQTY0X3NfbnNf
c2luY2Vfc3RhcnRfYSgpIGFib3ZlLCBidXQgdGhleSB0YWtlIG11Y2ggbG9uZ2VyIGFzIHRoZXkg
dXNlIGxvbmcgcmVnaXN0ZXJzLCBhbmQgCiAgICogd2Ugd2FudCB0byBiZSBjb21wYXRpYmxlIHdp
dGggd2hhdCBsaW51eCByZXR1cm5zIGluIHN0cnVjdCB0aW1lc3BlYyB0cyBhZnRlciBjYWxsIHRv
IAogICAqIGNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDX1JBVywgJnRzKS4KICAgKi8KICBj
b25zdCBVMzJfdCBzY2FsZT0xMDAwVTsKICByZWdpc3RlciBVMzJfdCBmcm9tPSBJQTY0X3RzY19r
aHooKTsKICByZWdpc3RlciBVMzJfdCB0byAgPSBOU0VDX1BFUl9TRUMgLyBzY2FsZTsKICByZWdp
c3RlciBVNjRfdCBzZWMgPSAoIH4wVUwgLyBmcm9tICkgLyBzY2FsZTsgIAogIHNlYyA9IChzZWMg
PiA2MDApID8gNjAwIDogKChzZWMgPiAwKSA/IHNlYyA6IDEpOwogIHJlZ2lzdGVyIFU2NF90IG1h
eHNlYyA9IHNlYyAqIHNjYWxlOwogIFVMX3QgdG1wOwogIFUzMl90IHNmdCwgc2Z0YWNjPTMyOwog
IC8qCiAgICogQ2FsY3VsYXRlIHRoZSBzaGlmdCBmYWN0b3Igd2hpY2ggaXMgbGltaXRpbmcgdGhl
IGNvbnZlcnNpb24KICAgKiByYW5nZToKICAgKi8KICB0bXAgPSAobWF4c2VjICogZnJvbSkgPj4g
MzI7CiAgd2hpbGUgKHRtcCkKICB7IHRtcCA+Pj0xOwogICAgc2Z0YWNjLS07CiAgfQogIC8qCiAg
ICogRmluZCB0aGUgY29udmVyc2lvbiBzaGlmdC9tdWx0IHBhaXIgd2hpY2ggaGFzIHRoZSBiZXN0
CiAgICogYWNjdXJhY3kgYW5kIGZpdHMgdGhlIG1heHNlYyBjb252ZXJzaW9uIHJhbmdlOgogICAq
LwogIGZvciAoc2Z0ID0gMzI7IHNmdCA+IDA7IHNmdC0tKSAKICB7IHRtcCA9ICgoVUxfdCkgdG8p
IDw8IHNmdDsKICAgIHRtcCArPSBmcm9tIC8gMjsKICAgIHRtcCA9IHRtcCAvIGZyb207CiAgICBp
ZiAoKHRtcCA+PiBzZnRhY2MpID09IDApCiAgICAgIGJyZWFrOwogIH0KICAqbXVsdCA9IHRtcDsK
ICAqc2hpZnQgPSBzZnQ7Cn0KCl9fdGhyZWFkClUzMl90IF9pYTY0X3RzY19tdWx0ID0gfjBVLCBf
aWE2NF90c2Nfc2hpZnQ9fjBVOwoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNf
aW5saW5lKSkKVTY0X3QgSUE2NF9zX25zX3NpbmNlX3N0YXJ0KCkKeyBpZiggKCBfaWE2NF90c2Nf
bXVsdCA9PSB+MFUgKSB8fCAoIF9pYTY0X3RzY19zaGlmdCA9PSB+MFUgKSApCiAgICBpYTY0X3Rz
Y19jYWxjX211bHRfc2hpZnQoICZfaWE2NF90c2NfbXVsdCwgJl9pYTY0X3RzY19zaGlmdCk7CiAg
cmVnaXN0ZXIgVTY0X3QgY3ljbGVzID0gSUE2NF90c2NfdGlja3Nfc2luY2Vfc3RhcnQoKTsgICAK
ICByZWdpc3RlciBVNjRfdCBucyA9ICgoY3ljbGVzICooKFVMX3QpX2lhNjRfdHNjX211bHQpKT4+
X2lhNjRfdHNjX3NoaWZ0KTsKICByZXR1cm4oICgoKG5zIC8gTlNFQ19QRVJfU0VDKSYweGZmZmZm
ZmZmVUwpIDw8IDMyKSB8ICgobnMgJSBOU0VDX1BFUl9TRUMpJjB4M2ZmZmZmZmZVTCkgKTsKICAv
KiBZZXMsIHdlIGFyZSBwdXJwb3NlZnVsbHkgaWdub3JpbmcgZHVyYXRpb25zIG9mIG1vcmUgdGhh
biA0LjIgYmlsbGlvbiBzZWNvbmRzIGhlcmUhICovCn0KCi8qY3Jhc2g+IHAveCAgdnN5c2NhbGxf
Z3RvZF9kYXRhCiQ0ID0gewogIHNlcSA9IDB4YjMxYjY0LAogIHZjbG9ja19tb2RlID0gMHgxLAog
IGN5Y2xlX2xhc3QgPSAweDYzMThmNmU5MzFhZSwKICBtYXNrID0gMHhmZmZmZmZmZmZmZmZmZmZm
LAogIG11bHQgPSAweDU4N2FmZCwKICBzaGlmdCA9IDB4MTgsCiAgd2FsbF90aW1lX3Nuc2VjID0g
MHgzN2NjZDVkYjljY2I4YSwKICB3YWxsX3RpbWVfc2VjID0gMHg1OGE2Nzg4YiwKICBtb25vdG9u
aWNfdGltZV9zZWMgPSAweDkzMGMsCiAgbW9ub3RvbmljX3RpbWVfc25zZWMgPSAweDM4NDhhNjI1
OWNjYjhhLAogIHdhbGxfdGltZV9jb2Fyc2Vfc2VjID0gMHg1OGE2Nzg4YiwKICB3YWxsX3RpbWVf
Y29hcnNlX25zZWMgPSAweDM3Y2NkNWRiLAogIG1vbm90b25pY190aW1lX2NvYXJzZV9zZWMgPSAw
eDkzMGMsCiAgbW9ub3RvbmljX3RpbWVfY29hcnNlX25zZWMgPSAweDM4NDhhNjI1LAogIHR6X21p
bnV0ZXN3ZXN0ID0gMHgwLAogIHR6X2RzdHRpbWUgPSAweDAKfQoKCmNyYXNoPiBwICB2c3lzY2Fs
bF9ndG9kX2RhdGEKdnN5c2NhbGxfZ3RvZF9kYXRhID0gJDMgPSB7CiAgc2VxID0gMTE0MzU1Mjgs
CiAgdmNsb2NrX21vZGUgPSAxLAogIGN5Y2xlX2xhc3QgPSAxMDYyNDE1NTI5Njc3NDcsCiAgbWFz
ayA9IDE4NDQ2NzQ0MDczNzA5NTUxNjE1LAogIG11bHQgPSA1Nzk4NjUzLAogIHNoaWZ0ID0gMjQs
CiAgd2FsbF90aW1lX3Nuc2VjID0gMTI3MTc2MTY1NTA4ODk3MzIsCiAgd2FsbF90aW1lX3NlYyA9
IDE0ODczMDM5MDQsCiAgbW9ub3RvbmljX3RpbWVfc2VjID0gMzY3MDUsCiAgbW9ub3RvbmljX3Rp
bWVfc25zZWMgPSAxMjg1Mzc1MTA3NTgxNzczMiwKICB3YWxsX3RpbWVfY29hcnNlX3NlYyA9IDE0
ODczMDM5MDQsCiAgd2FsbF90aW1lX2NvYXJzZV9uc2VjID0gNzU4MDI5MDE2LAogIG1vbm90b25p
Y190aW1lX2NvYXJzZV9zZWMgPSAzNjcwNSwKICBtb25vdG9uaWNfdGltZV9jb2Fyc2VfbnNlYyA9
IDc2NjE0MzI2NiwKICB0el9taW51dGVzd2VzdCA9IDAsCiAgdHpfZHN0dGltZSA9IDAKfQoKSW5z
cGVjdGlvbiBzaG93cyB0aGF0IGFib3ZlIGNvZGUgY2FsY3VsYXRlcyBTQU1FIG11bHQgYW5kIHNo
aWZ0IHZhbHVlcyBhcyBpbiAKdGhlIGFjdHVhbCBsaW51eCB2c3lzY2FsbF9ndG9kX2RhdGEgJ3No
aWZ0JyBhbmQgJ211bHQnIHZhbHVlcywgYW5kIHRoYXQgCnRoZSBleHByZXNzaW9uIDoKICAgICgo
Y3ljbGVzICooKFVMX3QpX2lhNjRfdHNjX211bHQpKT4+X2lhNjRfdHNjX3NoaWZ0KQphY3R1YWxs
eSBkb2VzIGNvcnJlc3BvbmQgdG8gd2hhdCBsaW51eCB3b3VsZCBkbyB3aXRoIHRoZSBUU0MgdmFs
dWUgdG8gZ2V0IHRpbWVzcGVjIHR2X3NlYyAoaGlnaCA2NCBiaXRzKSAKYW5kIHRpbWVzcGVjIHR2
X25zZWMgKGxvdyAzMCBiaXRzKSAuCgpJTUhPLCBJdCBpcyBhIHNoYW1lIHRoYXQgdGhlIGFjdHVh
bCBoYXJkd2FyZSBBUlQgbnVtZXJhdG9yICsgZGVub21pbmF0b3IgKyBDcnlzdGFsIENsb2NrIGZy
ZXF1ZW5jeSBhcmVuJ3QKYWN0dWFsbHkgdXNlZCBpbiBMaW51eCdzIGNhbGN1bGF0aW9ucyEgKGV4
Y2VwdCBpbiBlMTAwMCBkcml2ZXIncyAnUFRQJyB0aW1lc3RhbXAtc3luY2hyb25pemF0aW9uLXdp
dGgtcmVtb3RlLWhvc3QgY29kZSkuCiAqLwojZW5kaWYKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
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
--f403045e3476dc54b20549244fc5--
