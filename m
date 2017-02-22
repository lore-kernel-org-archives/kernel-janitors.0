From: Jason Vas Dias <jason.vas.dias@gmail.com>
Date: Wed, 22 Feb 2017 16:07:43 +0000
Subject: Re: [PATCH] arch/x86/kernel/tsc.c : set X86_FEATURE_ART for TSC on CPUs like i7-4910MQ : bug #194609
Message-Id: <CALyZvKyThHz12B7ViO8wyqeVB+mknBQGi=k7+TRUX-mCjkATtA@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="94eb2c122e546d50e0054920b289"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALyZvKyAH8xfj_j2Vh_z2BOgYJeP73LvFwhvQ26-Kyfthdtwiw@mail.gmail.com>
 <CALyZvKwVDP8bTDdteYZT01GJGDd0d+hQ7oib-oXj+DarNHMWnQ@mail.gmail.com>
 <alpine.DEB.2.20.1702201239330.4208@nanos> <CALyZvKxhvGjRou4FcEvvbwPxPzAxpe8Shn=53DUx6WYWqEGSrA@mail.gmail.com>
In-Reply-To: <CALyZvKxhvGjRou4FcEvvbwPxPzAxpe8Shn=53DUx6WYWqEGSrA@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Prarit Bhargava <prarit@redhat.com>, x86@kernel.org

--94eb2c122e546d50e0054920b289
Content-Type: text/plain; charset=UTF-8

RE:
>> 4.10 has  new code which utilizes the TSC_ADJUST MSR.

I just built an unpatched linux v4.10 with tglx's TSC improvements -
much else improved in this kernel (like iwlwifi) - thanks!

I have attached an updated version of the test program which
doesn't print the bogus "Nominal TSC Frequency" (the previous
version printed it, but equally ignored it).

The clock_gettime(CLOCK_MONOTONIC_RAW,&ts) latency has improved by
a factor of 2 - it used to be @140ns and is now @ 70ns  ! Wow!  :

$ uname -r
4.10.0
$ ./ttsc1
max_extended_leaf: 80000008
has tsc: 1 constant: 1
Invariant TSC is enabled: Actual TSC freq: 2.893299GHz.
ts2 - ts1: 144 ts3 - ts2: 96 ns1: 0.000000588 ns2: 0.000002599
ts3 - ts2: 178 ns1: 0.000000592
ts3 - ts2: 14 ns1: 0.000000577
ts3 - ts2: 14 ns1: 0.000000651
ts3 - ts2: 17 ns1: 0.000000625
ts3 - ts2: 17 ns1: 0.000000677
ts3 - ts2: 17 ns1: 0.000000626
ts3 - ts2: 17 ns1: 0.000000627
ts3 - ts2: 17 ns1: 0.000000627
ts3 - ts2: 18 ns1: 0.000000655
ts3 - ts2: 17 ns1: 0.000000631
t1 - t0: 89067 - ns2: 0.000091411

I think this is because under Linux 4.8, the CPU got a fault every
time it read the TSC_ADJUST MSR.

But user programs wanting to use the TSC  and correlate its value to
clock_gettime(CLOCK_MONOTONIC_RAW) values accurately like the above
program still have to  dig the TSC frequency value out of the kernel
with objdump  - this was really the point of the bug #194609.

I would still like to investigate exporting 'tsc_khz' & 'mult' +
'shift' values via sysfs.

Regards,
Jason.





On 21/02/2017, Jason Vas Dias <jason.vas.dias@gmail.com> wrote:
> Thank You for enlightening me -
>
> I was just having a hard time believing that Intel would ship a chip
> that features a monotonic, fixed frequency timestamp counter
> without specifying in either documentation or on-chip or in ACPI what
> precisely that hard-wired frequency is, but I now know that to
> be the case for the unfortunate i7-4910MQ - I mean, how can the CPU
> assert CPUID:80000007[8] ( InvariantTSC ) which it does, which is
> difficult to reconcile with the statement in the SDM :
>   17.16.4  Invariant Time-Keeping
>     The invariant TSC is based on the invariant timekeeping hardware
>     (called Always Running Timer or ART), that runs at the core crystal
> clock
>     frequency. The ratio defined by CPUID leaf 15H expresses the frequency
>     relationship between the ART hardware and TSC. If CPUID.15H:EBX[31:0] !=
> 0
>     and CPUID.80000007H:EDX[InvariantTSC] = 1, the following linearity
>     relationship holds between TSC and the ART hardware:
>     TSC_Value = (ART_Value * CPUID.15H:EBX[31:0] )
>                          / CPUID.15H:EAX[31:0] + K
>     Where 'K' is an offset that can be adjusted by a privileged agent*2.
>      When ART hardware is reset, both invariant TSC and K are also reset.
>
> So I'm just trying to figure out what CPUID.15H:EBX[31:0]  and
> CPUID.15H:EAX[31:0]  are for my hardware.  I assumed (incorrectly)
> that
> the "Nominal TSC Frequency" formulae in the manul must apply to all
> CPUs with InvariantTSC .
>
> Do I understand correctly , that since I do have InvariantTSC ,  the
> TSC_Value is in fact calculated according to the above formula, but with
> a "hidden" ART Value,  & Core Crystal Clock frequency & its ratio to
> TSC frequency ?
> It was obvious this nominal TSC Frequency had nothing to do with the
> actual TSC frequency used by Linux, which is 'tsc_khz' .
> I guess wishful thinking led me to believe CPUID:15h was actually
> supported somehow , because I thought InvariantTSC meant it had ART
> hardware .
>
> I do strongly suggest that Linux exports its calibrated TSC Khz
> somewhere to user
> space .
>
> I think the best long-term solution would be to allow programs to
> somehow read the TSC without invoking
> clock_gettime(CLOCK_MONOTONIC_RAW,&ts), &
> having to enter the kernel, which incurs an overhead of > 120ns on my system
> .
>
>
> Couldn't linux export its 'tsc_khz' and / or 'clocksource->mult' and
> 'clocksource->shift' values to /sysfs somehow ?
>
> For instance , only  if the 'current_clocksource' is 'tsc', then these
> values could be exported as:
> /sys/devices/system/clocksource/clocksource0/shift
> /sys/devices/system/clocksource/clocksource0/mult
> /sys/devices/system/clocksource/clocksource0/freq
>
> So user-space programs could  know that the value returned by
>     clock_gettime(CLOCK_MONOTONIC_RAW)
>   would be
>     {    .tv_sec =  ( ( rdtsc() * mult ) >> shift ) >> 32,
>       , .tv_nsec = ( ( rdtsc() * mult ) >> shift ) >> &~0U
>     }
>   and that represents ticks of period (1.0 / ( freq * 1000 )) S.
>
> That would save user-space programs from having to know 'tsc_khz' by
> parsing the 'Refined TSC' frequency from log files or by examining the
> running kernel with objdump to obtain this value & figure out 'mult' &
> 'shift' themselves.
>
> And why not a
>   /sys/devices/system/clocksource/clocksource0/value
> file that actually prints this ( ( rdtsc() * mult ) >> shift )
> expression as a long integer?
> And perhaps a
>   /sys/devices/pnp0/XX\:YY/rtc/rtc0/nanoseconds
> file that actually prints out the number of real-time nano-seconds since
> the
> contents of the existing
>   /sys/devices/pnp0/XX\:YY/rtc/rtc0/{time,since_epoch}
> files using the current TSC value?
> To read the rtc0/{date,time} files is already faster than entering the
> kernel to call
> clock_gettime(CLOCK_REALTIME, &ts) & convert to integer for scripts.
>
> I will work on developing a patch to this effect if no-one else is.
>
> Also, am I right in assuming that the maximum granularity of the real-time
> clock
> on my system is 1/64th of a second ? :
>  $ cat /sys/devices/pnp0/00\:02/rtc/rtc0/max_user_freq
>  64
> This is the maximum granularity that can be stored in CMOS , not
> returned by TSC? Couldn't we have something similar that gave an
> accurate idea of TSC frequency and the precise formula applied to TSC
> value to get clock_gettime
> (CLOCK_MONOTONIC_RAW) value ?
>
> Regards,
> Jason
>
>
> This code does produce good timestamps with a latency of @20ns
> that correlate well with clock_gettIme(CLOCK_MONOTONIC_RAW,&ts)
> values, but it depends on a global variable that  is initialized to
> the 'tsc_khz' value
> computed by running kernel parsed from objdump /proc/kcore output :
>
> static inline __attribute__((always_inline))
> U64_t
> IA64_tsc_now()
> { if(!(    _ia64_invariant_tsc_enabled
>       ||(( _cpu0id_fd == -1) && IA64_invariant_tsc_is_enabled(NULL,NULL))
>       )
>     )
>   { fprintf(stderr, __FILE__":%d:(%s): must be called with invariant
> TSC enabled.\n");
>     return 0;
>   }
>   U32_t tsc_hi, tsc_lo;
>   register UL_t tsc;
>   asm volatile
>   ( "rdtscp\n\t"
>     "mov %%edx, %0\n\t"
>     "mov %%eax, %1\n\t"
>     "mov %%ecx, %2\n\t"
>   : "=m" (tsc_hi) ,
>     "=m" (tsc_lo) ,
>     "=m" (_ia64_tsc_user_cpu) :
>   : "%eax","%ecx","%edx"
>   );
>   tsc=(((UL_t)tsc_hi) << 32)|((UL_t)tsc_lo);
>   return tsc;
> }
>
> __thread
> U64_t _ia64_first_tsc = 0xffffffffffffffffUL;
>
> static inline __attribute__((always_inline))
> U64_t IA64_tsc_ticks_since_start()
> { if(_ia64_first_tsc == 0xffffffffffffffffUL)
>   { _ia64_first_tsc = IA64_tsc_now();
>     return 0;
>   }
>   return (IA64_tsc_now() - _ia64_first_tsc) ;
> }
>
> static inline __attribute__((always_inline))
> void
> ia64_tsc_calc_mult_shift
> ( register U32_t *mult,
>   register U32_t *shift
> )
> { /* paraphrases Linux clocksource.c's clocks_calc_mult_shift() function:
>    * calculates second + nanosecond mult + shift in same way linux does.
>    * we want to be compatible with what linux returns in struct
> timespec ts after call to
>    * clock_gettime(CLOCK_MONOTONIC_RAW, &ts).
>    */
>   const U32_t scale=1000U;
>   register U32_t from= IA64_tsc_khz();
>   register U32_t to  = NSEC_PER_SEC / scale;
>   register U64_t sec = ( ~0UL / from ) / scale;
>   sec = (sec > 600) ? 600 : ((sec > 0) ? sec : 1);
>   register U64_t maxsec = sec * scale;
>   UL_t tmp;
>   U32_t sft, sftacc=32;
>   /*
>    * Calculate the shift factor which is limiting the conversion
>    * range:
>    */
>   tmp = (maxsec * from) >> 32;
>   while (tmp)
>   { tmp >>=1;
>     sftacc--;
>   }
>   /*
>    * Find the conversion shift/mult pair which has the best
>    * accuracy and fits the maxsec conversion range:
>    */
>   for (sft = 32; sft > 0; sft--)
>   { tmp = ((UL_t) to) << sft;
>     tmp += from / 2;
>     tmp = tmp / from;
>     if ((tmp >> sftacc) == 0)
>       break;
>   }
>   *mult = tmp;
>   *shift = sft;
> }
>
> __thread
> U32_t _ia64_tsc_mult = ~0U, _ia64_tsc_shift=~0U;
>
> static inline __attribute__((always_inline))
> U64_t IA64_s_ns_since_start()
> { if( ( _ia64_tsc_mult == ~0U ) || ( _ia64_tsc_shift == ~0U ) )
>     ia64_tsc_calc_mult_shift( &_ia64_tsc_mult, &_ia64_tsc_shift);
>   register U64_t cycles = IA64_tsc_ticks_since_start();
>   register U64_t ns = ((cycles *((UL_t)_ia64_tsc_mult))>>_ia64_tsc_shift);
>   return( (((ns / NSEC_PER_SEC)&0xffffffffUL) << 32) | ((ns %
> NSEC_PER_SEC)&0x3fffffffUL) );
>   /* Yes, we are purposefully ignoring durations of more than 4.2
> billion seconds here! */
> }
>
>
> I think Linux should export the 'tsc_khz', 'mult' and 'shift' values
> somehow,
> then user-space libraries could have more confidence in using 'rdtsc'
> or 'rdtscp'
> if Linux's current_clocksource is 'tsc'.
>
> Regards,
> Jason
>
>
>
> On 20/02/2017, Thomas Gleixner <tglx@linutronix.de> wrote:
>> On Sun, 19 Feb 2017, Jason Vas Dias wrote:
>>
>>> CPUID:15H is available in user-space, returning the integers : ( 7,
>>> 832, 832 ) in EAX:EBX:ECX , yet boot_cpu_data.cpuid_level is 13 , so
>>> in detect_art() in tsc.c,
>>
>> By some definition of available. You can feed CPUID random leaf numbers
>> and
>> it will return something, usually the value of the last valid CPUID leaf,
>> which is 13 on your CPU. A similar CPU model has
>>
>> 0x0000000d 0x00: eax=0x00000007 ebx=0x00000340 ecx=0x00000340
>> edx=0x00000000
>>
>> i.e. 7, 832, 832, 0
>>
>> Looks familiar, right?
>>
>> You can verify that with 'cpuid -1 -r' on your machine.
>>
>>> Linux does not think ART is enabled, and does not set the synthesized
>>> CPUID +
>>> ((3*32)+10) bit, so a program looking at /dev/cpu/0/cpuid would not
>>> see this bit set .
>>
>> Rightfully so. This is a Haswell Core model.
>>
>>> if an e1000 NIC card had been installed, PTP would not be available.
>>
>> PTP is independent of the ART kernel feature . ART just provides enhanced
>> PTP features. You are confusing things here.
>>
>> The ART feature as the kernel sees it is a hardware extension which feeds
>> the ART clock to peripherals for timestamping and time correlation
>> purposes. The ratio between ART and TSC is described by CPUID leaf 0x15
>> so
>> the kernel can make use of that correlation, e.g. for enhanced PTP
>> accuracy.
>>
>> It's correct, that the NONSTOP_TSC feature depends on the availability of
>> ART, but that has nothing to do with the feature bit, which solely
>> describes the ratio between TSC and the ART frequency which is exposed to
>> peripherals. That frequency is not necessarily the real ART frequency.
>>
>>> Also, if the MSR TSC_ADJUST has not yet been written, as it seems to be
>>> nowhere else in Linux,  the code will always think X86_FEATURE_ART is 0
>>> because the CPU will always get a fault reading the MSR since it has
>>> never been written.
>>
>> Huch? If an access to the TSC ADJUST MSR faults, then something is really
>> wrong. And writing it unconditionally to 0 is not going to happen. 4.10
>> has
>> new code which utilizes the TSC_ADJUST MSR.
>>
>>> It would be nice for user-space programs that want to use the TSC with
>>> rdtsc / rdtscp instructions, such as the demo program attached to the
>>> bug report,
>>> could have confidence that Linux is actually generating the results of
>>> clock_gettime(CLOCK_MONOTONIC_RAW, &timespec)
>>> in a predictable way from the TSC by looking at the
>>>  /dev/cpu/0/cpuid[bit(((3*32)+10)] value before enabling user-space
>>> use of TSC values, so that they can correlate TSC values with linux
>>> clock_gettime() values.
>>
>> What has ART to do with correct CLOCK_MONOTONIC_RAW values?
>>
>> Nothing at all, really.
>>
>> The kernel makes use of the proper information values already.
>>
>> The TSC frequency is determined from:
>>
>>     1) CPUID(0x16) if available
>>     2) MSRs if available
>>     3) By calibration against a known clock
>>
>> If the kernel uses TSC as clocksource then the CLOCK_MONOTONIC_* values
>> are
>> correct whether that machine has ART exposed to peripherals or not.
>>
>>> has tsc: 1 constant: 1
>>> 832 / 7 = 118 : 832 - 9.888914286E+04hz : OK:1
>>
>> And that voodoo math tells us what? That you found a way to correlate
>> CPUID(0xd) to the TSC frequency on that machine.
>>
>> Now I'm curious how you do that on this other machine which returns for
>> cpuid(15): 1, 1, 1
>>
>> You can't because all of this is completely wrong.
>>
>> Thanks,
>>
>> 	tglx
>>
>

--94eb2c122e546d50e0054920b289
Content-Type: application/x-tar; name="ttsc.tar"
Content-Disposition: attachment; filename="ttsc.tar"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

dHRzYy8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA3NTUAMDAwMDAw
MAAwMDAwMDAwADAwMDAwMDAwMDAwADEzMDUzMzMzMTUzADAxMDUzMAAgNQAAAAAAAAAAAAAAAAAA
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
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdHRzYy9JQTY0
X3JkdHNjLmgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA2NDQAMDAwMDAwMAAwMDAwMDAw
ADAwMDAwMDE0NDE3ADEzMDUyMDYyNzE3ADAxMjU1NgAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAvKiBARklMRTog
SUE2NF9yZHRzYy5oIDogbWFrZXMgSW50ZWwgQ29yZS1pNyBBcmNoaXRlY3R1cmUgeDg2XzY0IFRT
QyBWYWx1ZXMgYXZhaWxhYmxlIGluIFVzZXIgU3BhY2UKICogICBzZWU6IFNETTogIkludGVswq4g
NjQgYW5kIElBLTMyIEFyY2hpdGVjdHVyZXMgU29mdHdhcmUgRGV2ZWxvcGVy4oCZcyBNYW51YWwi
IDogaHR0cHM6Ly9zb2Z0d2FyZS5pbnRlbC5jb20vZW4tdXMvYXJ0aWNsZXMvaW50ZWwtc2RtCiAq
ICAgICAgICAgdjMsIFNERywgwqcgMTcuMTY6ICJUaW1lIFN0YW1wIENvdW50ZXIiLCB2MiwgY2gg
NCwgwqcgNTQ3ICJSRFRTQ1DigJRSZWFkIFRpbWUtU3RhbXAgQ291bnRlciBhbmQgUHJvY2Vzc29y
IElEIiBpbnN0cnVjdGlvbiA7CiAqICAgICAgICAgTGludXgncyBrZXJuZWwvdGltZS9jbG9ja3Nv
dXJjZS5jIGNsb2Nrc19jYWxjX211bHRfc2hpZnQoKSBmdW5jdGlvbi4KICogQ29weWxlZnQgKEMp
IDIwMTcrIEphc29uIFZhcyBEaWFzIChKVkQpIDxqYXNvbi52YXMuZGlhc0BnbWFpbC5jb20+IC0g
T25seSBBdXRob3JzaGlwIFJpZ2h0cyBSZXNlcnZlZC4KICovCiNpZm5kZWYgX0lBNjRfUkRUU0Nf
SF8KI2RlZmluZSBfSUE2NF9SRFRTQ19IXwojaW5jbHVkZSAiSUE2NF90c2NfaW5mby5oIgojaW5j
bHVkZSA8bWF0aC5oPgpfX3RocmVhZApVMzJfdCBfaWE2NF90c2NfdXNlcl9jcHU7IC8qIFRTQyBB
dXggdmFsdWUgaWRlbnRpZmllcyBDUFUgKi8KCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygo
YWx3YXlzX2lubGluZSkpClU2NF90CklBNjRfdHNjX25vdygpCnsgaWYoISggICAgX2lhNjRfaW52
YXJpYW50X3RzY19lbmFibGVkCiAgICAgIHx8KCggX2NwdTBpZF9mZCA9PSAtMSkgJiYgSUE2NF9p
bnZhcmlhbnRfdHNjX2lzX2VuYWJsZWQoTlVMTCxOVUxMKSkKICAgICAgKQogICAgKQogIHsgZnBy
aW50ZihzdGRlcnIsIF9fRklMRV9fIjolZDooJXMpOiBtdXN0IGJlIGNhbGxlZCB3aXRoIGludmFy
aWFudCBUU0MgZW5hYmxlZC5cbiIpOwogICAgcmV0dXJuIDA7CiAgfQogIFUzMl90IHRzY19oaSwg
dHNjX2xvOwogIHJlZ2lzdGVyIFVMX3QgdHNjOwogIGFzbSB2b2xhdGlsZQogICggInJkdHNjcFxu
XHQiCiAgICAibW92ICUlZWR4LCAlMFxuXHQiCiAgICAibW92ICUlZWF4LCAlMVxuXHQiCiAgICAi
bW92ICUlZWN4LCAlMlxuXHQiICAKICA6ICI9bSIgKHRzY19oaSkgLAogICAgIj1tIiAodHNjX2xv
KSAsCiAgICAiPW0iIChfaWE2NF90c2NfdXNlcl9jcHUpIDogIAogIDogIiVlYXgiLCIlZWN4Iiwi
JWVkeCIKICApOwogIHRzYz0oKChVTF90KXRzY19oaSkgPDwgMzIpfCgoVUxfdCl0c2NfbG8pOwog
IHJldHVybiB0c2M7Cn0KCl9fdGhyZWFkClU2NF90IF9pYTY0X2ZpcnN0X3RzYyA9IDB4ZmZmZmZm
ZmZmZmZmZmZmZlVMOwoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5l
KSkKVTY0X3QgSUE2NF90c2NfdGlja3Nfc2luY2Vfc3RhcnQoKQp7IGlmKF9pYTY0X2ZpcnN0X3Rz
YyA9PSAweGZmZmZmZmZmZmZmZmZmZmZVTCkKICB7IF9pYTY0X2ZpcnN0X3RzYyA9IElBNjRfdHNj
X25vdygpOwogICAgcmV0dXJuIDA7CiAgfQogIHJldHVybiAoSUE2NF90c2Nfbm93KCkgLSBfaWE2
NF9maXJzdF90c2MpIDsKfQoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5s
aW5lKSkKVTY0X3QgSUE2NF9zX25zX3NpbmNlX3N0YXJ0X2EoKQp7IHN0YXRpYyBfX3RocmVhZAog
IFUxMjhfdCBfdHNjX3BfcyA9IH4wVUxMOwogIGlmKCBfdHNjX3BfcyA9PSB+MFVMTCApCiAgICBf
dHNjX3BfcyA9ICAxMDAwMDAwMDAwMDAwVUxMIC8gIAogICAgICAgKCAoKFUxMjhfdClJQTY0X3Rz
Y19raHooKSkgKiAxMDAwVUxMICkKICAgIDsgLyogbnVtYmVyIG9mIHBldGE/LSgxZS0xMilzZWNv
bmRzIHBlciBUU0MgdGljayAqLwogIHJlZ2lzdGVyIFUxMjhfdCBuX3BzID0gSUE2NF90c2NfdGlj
a3Nfc2luY2Vfc3RhcnQoKSAqIF90c2NfcF9zOyAgICAgICAgICAgICAgICAgICAgLyogMWUtMTIg
c2Vjb25kcyAqLwogIHJlZ2lzdGVyIFVMX3QgICBuICAgID0gKG5fcHMgLyAxMDAwVUxMKSArICgo
bl9wcyAlIDEwMDBVTEw+NDk5KT8xOjApIDsKICByZWdpc3RlciBVTF90ICAgcyAgICA9IG4gLyAx
MDAwMDAwMDAwVUw7CiAgcmVnaXN0ZXIgVUxfdCAgIG5fbnMgPSBuICUgMTAwMDAwMDAwMFVMOyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAxZS05ICBzZWNvbmRz
ICovICAKICByZXR1cm4gICggKHMgPDwgMzIpIHwgbl9ucyApOyAgCn0KCnN0YXRpYyBpbmxpbmUg
X19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpClU2NF90IElBNjRfc19uc19zaW5jZV9zdGFy
dF9iKCkKeyBzdGF0aWMgX190aHJlYWQKICBkb3VibGUgX3RzY19wX3MgPSAwLjA7CiAgaWYoIF90
c2NfcF9zID09IDAuMCApCiAgICBfdHNjX3BfcyA9IDEuMCAvIChJQTY0X3RzY19raHooKSAqIDFl
Myk7CiAgcmVnaXN0ZXIgVUxfdCB0aWNrcyAgPSBJQTY0X3RzY190aWNrc19zaW5jZV9zdGFydCgp
IDsKICByZWdpc3RlciBkb3VibGUgdHMgICA9IHRpY2tzICogX3RzY19wX3M7CiAgcmVnaXN0ZXIg
VUxfdCAgIHMgICAgPSBmbG9vciggKCB0cyAqIDFlOSApIC8gMWU5ICk7CiAgcmVnaXN0ZXIgVUxf
dCAgIG5fbnMgPSAoIHRzICogMWU5ICkgLSBzOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiAxZS05ICBzZWNvbmRzICovICAKICByZXR1cm4gICggKHMgPDwgMzIp
IHwgbl9ucyApOyAgCn0KCiNkZWZpbmUgTlNFQ19QRVJfU0VDIDEwMDAwMDAwMDAKCnN0YXRpYyBp
bmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCnZvaWQKaWE2NF90c2NfY2FsY19t
dWx0X3NoaWZ0CiggcmVnaXN0ZXIgVTMyX3QgKm11bHQsCiAgcmVnaXN0ZXIgVTMyX3QgKnNoaWZ0
CikKeyAvKiBwYXJhcGhyYXNlcyBMaW51eCBjbG9ja3NvdXJjZS5jJ3MgY2xvY2tzX2NhbGNfbXVs
dF9zaGlmdCgpIGZ1bmN0aW9uOgogICAqIGNhbGN1bGF0ZXMgc2Vjb25kICsgbmFub3NlY29uZCBt
dWx0ICsgc2hpZnQgaW4gc2FtZSB3YXkgbGludXggZG9lcy4gCiAgICogSXQgaXMgYSBzaGFtZSB3
ZSBjYW5ub3QgdXNlIG51bWVyaWNhbGx5IGFjY3VyYXRlIHZhbHVlcyBjYWxjdWxhdGVkIGFzIGlu
IElBNjRfc19uc19zaW5jZV9zdGFydF9iKCkKICAgKiBvciBJQTY0X3NfbnNfc2luY2Vfc3RhcnRf
YSgpIGFib3ZlLCBidXQgdGhleSB0YWtlIG11Y2ggbG9uZ2VyIGFzIHRoZXkgdXNlIGxvbmcgcmVn
aXN0ZXJzLCBhbmQgCiAgICogd2Ugd2FudCB0byBiZSBjb21wYXRpYmxlIHdpdGggd2hhdCBsaW51
eCByZXR1cm5zIGluIHN0cnVjdCB0aW1lc3BlYyB0cyBhZnRlciBjYWxsIHRvIAogICAqIGNsb2Nr
X2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDX1JBVywgJnRzKS4KICAgKi8KICBjb25zdCBVMzJfdCBz
Y2FsZT0xMDAwVTsKICByZWdpc3RlciBVMzJfdCBmcm9tPSBJQTY0X3RzY19raHooKTsKICByZWdp
c3RlciBVMzJfdCB0byAgPSBOU0VDX1BFUl9TRUMgLyBzY2FsZTsKICByZWdpc3RlciBVNjRfdCBz
ZWMgPSAoIH4wVUwgLyBmcm9tICkgLyBzY2FsZTsgIAogIHNlYyA9IChzZWMgPiA2MDApID8gNjAw
IDogKChzZWMgPiAwKSA/IHNlYyA6IDEpOwogIHJlZ2lzdGVyIFU2NF90IG1heHNlYyA9IHNlYyAq
IHNjYWxlOwogIFVMX3QgdG1wOwogIFUzMl90IHNmdCwgc2Z0YWNjPTMyOwogIC8qCiAgICogQ2Fs
Y3VsYXRlIHRoZSBzaGlmdCBmYWN0b3Igd2hpY2ggaXMgbGltaXRpbmcgdGhlIGNvbnZlcnNpb24K
ICAgKiByYW5nZToKICAgKi8KICB0bXAgPSAobWF4c2VjICogZnJvbSkgPj4gMzI7CiAgd2hpbGUg
KHRtcCkKICB7IHRtcCA+Pj0xOwogICAgc2Z0YWNjLS07CiAgfQogIC8qCiAgICogRmluZCB0aGUg
Y29udmVyc2lvbiBzaGlmdC9tdWx0IHBhaXIgd2hpY2ggaGFzIHRoZSBiZXN0CiAgICogYWNjdXJh
Y3kgYW5kIGZpdHMgdGhlIG1heHNlYyBjb252ZXJzaW9uIHJhbmdlOgogICAqLwogIGZvciAoc2Z0
ID0gMzI7IHNmdCA+IDA7IHNmdC0tKSAKICB7IHRtcCA9ICgoVUxfdCkgdG8pIDw8IHNmdDsKICAg
IHRtcCArPSBmcm9tIC8gMjsKICAgIHRtcCA9IHRtcCAvIGZyb207CiAgICBpZiAoKHRtcCA+PiBz
ZnRhY2MpID09IDApCiAgICAgIGJyZWFrOwogIH0KICAqbXVsdCA9IHRtcDsKICAqc2hpZnQgPSBz
ZnQ7Cn0KCl9fdGhyZWFkClUzMl90IF9pYTY0X3RzY19tdWx0ID0gfjBVLCBfaWE2NF90c2Nfc2hp
ZnQ9fjBVOwoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKVTY0
X3QgSUE2NF9zX25zX3NpbmNlX3N0YXJ0KCkKeyBpZiggKCBfaWE2NF90c2NfbXVsdCA9PSB+MFUg
KSB8fCAoIF9pYTY0X3RzY19zaGlmdCA9PSB+MFUgKSApCiAgICBpYTY0X3RzY19jYWxjX211bHRf
c2hpZnQoICZfaWE2NF90c2NfbXVsdCwgJl9pYTY0X3RzY19zaGlmdCk7CiAgcmVnaXN0ZXIgVTY0
X3QgY3ljbGVzID0gSUE2NF90c2NfdGlja3Nfc2luY2Vfc3RhcnQoKTsgICAKICByZWdpc3RlciBV
NjRfdCBucyA9ICgoY3ljbGVzICooKFVMX3QpX2lhNjRfdHNjX211bHQpKT4+X2lhNjRfdHNjX3No
aWZ0KTsKICByZXR1cm4oICgoKG5zIC8gTlNFQ19QRVJfU0VDKSYweGZmZmZmZmZmVUwpIDw8IDMy
KSB8ICgobnMgJSBOU0VDX1BFUl9TRUMpJjB4M2ZmZmZmZmZVTCkgKTsKICAvKiBZZXMsIHdlIGFy
ZSBwdXJwb3NlZnVsbHkgaWdub3JpbmcgZHVyYXRpb25zIG9mIG1vcmUgdGhhbiA0LjIgYmlsbGlv
biBzZWNvbmRzIGhlcmUhICovCn0KCi8qY3Jhc2g+IHAveCAgdnN5c2NhbGxfZ3RvZF9kYXRhCiQ0
ID0gewogIHNlcSA9IDB4YjMxYjY0LAogIHZjbG9ja19tb2RlID0gMHgxLAogIGN5Y2xlX2xhc3Qg
PSAweDYzMThmNmU5MzFhZSwKICBtYXNrID0gMHhmZmZmZmZmZmZmZmZmZmZmLAogIG11bHQgPSAw
eDU4N2FmZCwKICBzaGlmdCA9IDB4MTgsCiAgd2FsbF90aW1lX3Nuc2VjID0gMHgzN2NjZDVkYjlj
Y2I4YSwKICB3YWxsX3RpbWVfc2VjID0gMHg1OGE2Nzg4YiwKICBtb25vdG9uaWNfdGltZV9zZWMg
PSAweDkzMGMsCiAgbW9ub3RvbmljX3RpbWVfc25zZWMgPSAweDM4NDhhNjI1OWNjYjhhLAogIHdh
bGxfdGltZV9jb2Fyc2Vfc2VjID0gMHg1OGE2Nzg4YiwKICB3YWxsX3RpbWVfY29hcnNlX25zZWMg
PSAweDM3Y2NkNWRiLAogIG1vbm90b25pY190aW1lX2NvYXJzZV9zZWMgPSAweDkzMGMsCiAgbW9u
b3RvbmljX3RpbWVfY29hcnNlX25zZWMgPSAweDM4NDhhNjI1LAogIHR6X21pbnV0ZXN3ZXN0ID0g
MHgwLAogIHR6X2RzdHRpbWUgPSAweDAKfQoKCmNyYXNoPiBwICB2c3lzY2FsbF9ndG9kX2RhdGEK
dnN5c2NhbGxfZ3RvZF9kYXRhID0gJDMgPSB7CiAgc2VxID0gMTE0MzU1MjgsCiAgdmNsb2NrX21v
ZGUgPSAxLAogIGN5Y2xlX2xhc3QgPSAxMDYyNDE1NTI5Njc3NDcsCiAgbWFzayA9IDE4NDQ2NzQ0
MDczNzA5NTUxNjE1LAogIG11bHQgPSA1Nzk4NjUzLAogIHNoaWZ0ID0gMjQsCiAgd2FsbF90aW1l
X3Nuc2VjID0gMTI3MTc2MTY1NTA4ODk3MzIsCiAgd2FsbF90aW1lX3NlYyA9IDE0ODczMDM5MDQs
CiAgbW9ub3RvbmljX3RpbWVfc2VjID0gMzY3MDUsCiAgbW9ub3RvbmljX3RpbWVfc25zZWMgPSAx
Mjg1Mzc1MTA3NTgxNzczMiwKICB3YWxsX3RpbWVfY29hcnNlX3NlYyA9IDE0ODczMDM5MDQsCiAg
d2FsbF90aW1lX2NvYXJzZV9uc2VjID0gNzU4MDI5MDE2LAogIG1vbm90b25pY190aW1lX2NvYXJz
ZV9zZWMgPSAzNjcwNSwKICBtb25vdG9uaWNfdGltZV9jb2Fyc2VfbnNlYyA9IDc2NjE0MzI2NiwK
ICB0el9taW51dGVzd2VzdCA9IDAsCiAgdHpfZHN0dGltZSA9IDAKfQoKSW5zcGVjdGlvbiBzaG93
cyB0aGF0IGFib3ZlIGNvZGUgY2FsY3VsYXRlcyBTQU1FIG11bHQgYW5kIHNoaWZ0IHZhbHVlcyBh
cyBpbiAKdGhlIGFjdHVhbCBsaW51eCB2c3lzY2FsbF9ndG9kX2RhdGEgJ3NoaWZ0JyBhbmQgJ211
bHQnIHZhbHVlcywgYW5kIHRoYXQgCnRoZSBleHByZXNzaW9uIDoKICAgICgoY3ljbGVzICooKFVM
X3QpX2lhNjRfdHNjX211bHQpKT4+X2lhNjRfdHNjX3NoaWZ0KQphY3R1YWxseSBkb2VzIGNvcnJl
c3BvbmQgdG8gd2hhdCBsaW51eCB3b3VsZCBkbyB3aXRoIHRoZSBUU0MgdmFsdWUgdG8gZ2V0IHRp
bWVzcGVjIHR2X3NlYyAoaGlnaCA2NCBiaXRzKSAKYW5kIHRpbWVzcGVjIHR2X25zZWMgKGxvdyAz
MCBiaXRzKSAuCgpJTUhPLCBJdCBpcyBhIHNoYW1lIHRoYXQgdGhlIGFjdHVhbCBoYXJkd2FyZSBB
UlQgbnVtZXJhdG9yICsgZGVub21pbmF0b3IgKyBDcnlzdGFsIENsb2NrIGZyZXF1ZW5jeSBhcmVu
J3QKYWN0dWFsbHkgdXNlZCBpbiBMaW51eCdzIGNhbGN1bGF0aW9ucyEgKGV4Y2VwdCBpbiBlMTAw
MCBkcml2ZXIncyAnUFRQJyB0aW1lc3RhbXAtc3luY2hyb25pemF0aW9uLXdpdGgtcmVtb3RlLWhv
c3QgY29kZSkuCiAqLwojZW5kaWYKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHR0c2MvTWFrZWZpbGUAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAwMDAwNjQ0ADAwMDAwMDAAMDAwMDAwMAAwMDAwMDAwMDM3NwAx
MzA1MjA1NDUxNQAwMTIyMDAAIDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAdXN0YXIgIAByb290AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHJvb3QAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYWxsOnR0c2MxCmNsZWFuOnR0c2MxLmNs
ZWFuCkNDPWdjYwpDUFBGTEFHUzo9JChDUFBGTEFHUykgLUkuCkNGTEFHUzo9JChDRkxBR1MpIC1z
dGQ9Z251MTEgLU8zIC1tdHVuZT1uYXRpdmUgLWcgLWZQSUMgLXB0aHJlYWQKTERGTEFHUz0kKENG
TEFHUykgLWxwdGhyZWFkIC1sbQp0dHNjMS5vOnR0c2MxLmMgSUE2NF90c2NfaW5mby5oIElBNjRf
cmR0c2MuaAp0dHNjMTogdHRzYzEubwp0dHNjMS5jbGVhbjoKCUBybSAtdmYgdHRzYzEgdHRzYzEu
bwoKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0dHNjL2Jhc2VfdHlwZXMuaAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAMDAwMDY0NAAwMDAwMDAwADAwMDAwMDAAMDAwMDAwMDExNDYAMTMw
NTE0NDU0NDQAMDEzMDQ2ACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAHVzdGFyICAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAByb290AAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACNpZm5kZWYgX0JBU0VfVFlQRVNfCiNkZWZp
bmUgX0JBU0VfVFlQRVNfCiNpbmNsdWRlIDxmZWF0dXJlcy5oPgojaW5jbHVkZSA8c3lzL3R5cGVz
Lmg+CiNpbmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGJvb2wuaD4KI2luY2x1ZGUgPHN0
ZGFyZy5oPgp0eXBlZGVmIHVuc2lnbmVkIGxvbmcgIFVMX3QsIFU2NF90Owp0eXBlZGVmIHVuc2ln
bmVkIGxvbmcgbG9uZyAgVUxMX3QsIFUxMjhfdDsKdHlwZWRlZiB1bnNpZ25lZCBpbnQgICBVMzJf
dDsKdHlwZWRlZiB1bnNpZ25lZCBzaG9ydCBVMTZfdDsKdHlwZWRlZiB1bnNpZ25lZCBjaGFyICBi
eXRlX3Q7CiNlbmRpZgojaWZuZGVmIF9TWVNfU1RBVFVTXwojZGVmaW5lIF9TWVNfU1RBVFVTXwoj
aWZkZWYgT0sKI3VuZGVmIE9LCiNlbmRpZgojaWZkZWYgRkFJTAojdW5kZWYgRkFJTAojZW5kaWYK
I2lmZGVmIEVYSVRfT0sKI3VuZGVmIEVYSVRfT0sKI2VuZGlmCiNpZmRlZiBFWElUX0ZBSUwKI3Vu
ZGVmIEVYSVRfRkFJTAojZW5kaWYKdHlwZWRlZiBlbnVtIHN5c19zdGF0dXNfZQp7IE9LICAgICAg
ID0gMCAKLCBGQUlMICAgICA9IC0xCiwgRVhJVF9PSyAgPSAwIAosIEVYSVRfRkFJTD0gMQp9IFN5
c1N0YXR1c190OwojZW5kaWYKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0dHNjL0lBNjRfdHNjX2luZm8uaAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAMDAwMDY0NAAwMDAwMDAwADAwMDAwMDAAMDAwMDAwMTYyNDQAMTMwNTMz
MzAwMTQAMDEzMjMwACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AHVzdGFyICAAcm9vdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAByb290AAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC8qIEBGSUxFOiBJQTY0X3RzY19pbmZvLmggOiBt
YWtlcyBJbnRlbCBDb3JlLWk3IEFyY2hpdGVjdHVyZSB4ODZfNjQgVFNDIEluZm9ybWF0aW9uIGF2
YWlsYWJsZSBpbiBVc2VyIFNwYWNlCiAqICAgc2VlOiBTRE06ICJJbnRlbMKuIDY0IGFuZCBJQS0z
MiBBcmNoaXRlY3R1cmVzIFNvZnR3YXJlIERldmVsb3BlcuKAmXMgTWFudWFsIiA6IGh0dHBzOi8v
c29mdHdhcmUuaW50ZWwuY29tL2VuLXVzL2FydGljbGVzL2ludGVsLXNkbQogKiAgICAgICAgIHYz
LCBTREcsIMKnIDE3LjE2OiAiVGltZSBTdGFtcCBDb3VudGVyIiwgdjIsIENoIDMsIMKnIDE5MCAi
Q1BVSUQgSW5zdHJ1Y3Rpb24iLCAzIMKnIDIwOCwgIkZlYXR1cmUgSW5mb3JtYXRpb24gUmV0dXJu
ZWQgaW4gRURYIFJlZ2lzdGVyIgogKiBDb3B5bGVmdCAoQykgMjAxNysgSmFzb24gVmFzIERpYXMg
KEpWRCkgPGphc29uLnZhcy5kaWFzQGdtYWlsLmNvbT4gLSBPbmx5IEF1dGhvcnNoaXAgUmlnaHRz
IFJlc2VydmVkLgogKi8KI2lmbmRlZiBfSUE2NF9UU0NfSU5GT19IXwojZGVmaW5lIF9JQTY0X1RT
Q19JTkZPX0hfCiNpZm5kZWYgX194ODZfNjQKI2Vycm9yIE9vcHMsIHRoaXMgY29kZSBpcyBqdXN0
IGZvciB0aGUgSW50ZWwgeDg2XzY0IGFyY2hpdGVjdHVyZS4KI2VuZGlmCgojaWZuZGVmIEtTWU1f
TE9DQVRJT04KI2RlZmluZSBLU1lNX0xPQ0FUSU9OICIvdXNyL2Jpbi9rc3ltIgojd2FybmluZyAt
REtTWU1fTE9DQVRJT049IG5vdCBzcGVjaWZpZWQgaW4gQ1BQRkxBR1MgLSBkZWZhdWx0IHZhbHVl
IC91c3IvYmluL2tzeW0gYmVpbmcgdXNlZC4KI2VuZGlmCgojaWZuZGVmIF9CQVNFX1RZUEVTXwoj
aW5jbHVkZSAiYmFzZV90eXBlcy5oIgojZW5kaWYKI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVk
ZSA8ZmNudGwuaD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1
ZGUgPHN0ZGlvLmg+Cgp0eXBlZGVmIHN0cnVjdCBpYTY0X3RzY19uY2NjX2NwdWlkXzE1SF9zCnsg
VTMyX3QgdHNjX2NjY19kOyAvKiBkZW5vbWluYXRvcjogVFNDICAvIE5DQ0MgZnJlcSAqLwogIFUz
Ml90IHRzY19jY2NfbjsgLyogbnVtZXJhdG9yICA6IFRTQyAgLyBOQ0NDIGZyZXEgKi8KICAgICAg
ICAgICAgICAgICAgIC8qIGJvdGggbnVtYmVycyBhcmUgbm9ybWFsaXplZCAvIG1pbmltdW0gbnVt
YmVyIHRvIGV4cHJlc3MgcmF0aW8sIE5PVCBhY3R1YWwgZnJlcSAqLwogIFUzMl90IHRzY19jY2Nf
ZjsgLyogYWN0dWFsIGNvcmUgY3J5c3RhbCBjbG9jayBmcmVxdWVuY3kgaW4gSFogLSB0aGlzIGlz
IHRoZSBub24tYWRqdXN0YWJsZSBtYXN0ZXIgY2xvY2sgb3NjaWxsYXRvciBmcmVxdWVuY3kuCiAg
ICAgICAgICAgICAgICAgICAgKiBOT1QgcHJvY2Vzc29yIGJhc2UgZnJlcXVlbmN5IG9yIEhQRVQg
b3IgVFNDIG9yIGNvcmUgY2xvY2sgb3IgcmVmZXJlbmNlIGNsb2NrIG9yIGJ1cyBjbG9jayBhbnkg
b3RoZXIgY2xvY2sgZnJlcXVlbmN5ISAqLwp9IElBNjRfbmNjY190LCBJQTY0X1RTQ19Ob21pbmFs
X0NvcmVfQ3J5c3RhbF9DbG9ja190OyAKCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3
YXlzX2lubGluZSkpCmJvb2wKSUE2NF9oYXNfdHNjKHZvaWQpCnsgVTMyX3QgY2Fwcz0wOyAgCiAg
YXNtIHZvbGF0aWxlCiAgKCAibW92ICQxLCAlJWVheFxuXHQiCiAgICAiY3B1aWRcblx0IgogICAg
Im1vdiAlJWVkeCwgJTAiCiAgOiAiPW0iIChjYXBzKSA6CiAgOiAiJWVheCIsIiVlYngiLCIlZWN4
IiwiJWVkeCIKICApOwogIC8vIGJpdCA0IGlzICdoYXNfdHNjJyA6CiAgcmV0dXJuICgoY2FwcyAm
ICgxPDw0KSk/dHJ1ZTpmYWxzZSk7Cn0KCnN0YXRpYyBfX3RocmVhZApVMzJfdCBfaWE2NF9tYXhf
bGVhZj0wOwpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpib29s
CklBNjRfaGFzX2NwdWlkX2xlYWZfMTVoKHZvaWQpCnsgaWYoIF9pYTY0X21heF9sZWFmID09IDAg
KSAgICAKICAgIGFzbSB2b2xhdGlsZQogICAgKCAibW92ICQweDAwMDAwMDAwLCAlJWVheFxuXHQi
CiAgICAgICJjcHVpZFxuXHQiCiAgICAgICJtb3YgJSVlYXgsJTAiCiAgICA6ICI9bSIgKF9pYTY0
X21heF9sZWFmKSA6CiAgICA6ICIlZWF4IiwiJWVieCIsIiVlY3giLCIlZWR4IgogICAgKTsKICBy
ZXR1cm4oMHgwMTRVIDwgX2lhNjRfbWF4X2xlYWYpOwp9CgpzdGF0aWMgX190aHJlYWQKVTMyX3Qg
X2lhNjRfbWF4X2V4dGVuZGVkX2xlYWY9MDsKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChh
bHdheXNfaW5saW5lKSkKYm9vbApJQTY0X2hhc19jcHVpZF9sZWFmXzgwMDAwMDA3aCh2b2lkKQp7
IGlmKCBfaWE2NF9tYXhfZXh0ZW5kZWRfbGVhZiA9PSAwICkKICB7IGFzbSB2b2xhdGlsZQogICAg
KCAibW92ICQweDgwMDAwMDAwLCAlJWVheFxuXHQiCiAgICAgICJjcHVpZFxuXHQiCiAgICAgICJt
b3YgJSVlYXgsJTAiCiAgICA6ICI9bSIgKF9pYTY0X21heF9leHRlbmRlZF9sZWFmKSA6CiAgICA6
ICIlZWF4IiwiJWVieCIsIiVlY3giLCIlZWR4IgogICAgKTsKICAgIGZwcmludGYoc3RkZXJyLCJt
YXhfZXh0ZW5kZWRfbGVhZjogJXhcbiIsIF9pYTY0X21heF9leHRlbmRlZF9sZWFmKTsKICB9CiAg
cmV0dXJuKDB4ODAwMDAwMDZVIDwgX2lhNjRfbWF4X2V4dGVuZGVkX2xlYWYgKTsKfQoKc3RhdGlj
IGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKYm9vbApJQTY0X2hhc19jb25z
dGFudF90c2Modm9pZCkKeyBVMzJfdCBjYXBzPTA7CiAgYXNtIHZvbGF0aWxlCiAgKCAibW92ICQw
eDgwMDAwMDA3LCAlJWVheFxuXHQiCiAgICAiY3B1aWRcblx0IgogICAgIm1vdiAlJWVkeCwgJTAi
CiAgOiAiPW0iIChjYXBzKSA6CiAgOiAiJWVheCIsIiVlYngiLCIlZWN4IiwiJWVkeCIgIAogICk7
CiAgLy8gYml0IDggaXMgJ2NvbnN0YW50X3RzYycgOgogIHJldHVybiAoKGNhcHMgJiAoMTw8OCkp
P3RydWU6ZmFsc2UpOwp9CgpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxp
bmUpKQpib29sCklBNjRfaGFzX3JkdHNjcCh2b2lkKQp7IGlmKCBfaWE2NF9tYXhfZXh0ZW5kZWRf
bGVhZiA9PSAgMFUpCiAgICBJQTY0X2hhc19jcHVpZF9sZWFmXzgwMDAwMDA3aCgpOwogIGlmKDB4
ODAwMDAwMDFVID4gX2lhNjRfbWF4X2V4dGVuZGVkX2xlYWYpCiAgICByZXR1cm4gZmFsc2U7CiAg
VTMyX3QgY2Fwcz0wOwogIGFzbSB2b2xhdGlsZQogICggIm1vdiAkMHg4MDAwMDAwMSwgJSVlYXhc
blx0IgogICAgImNwdWlkXG5cdCIKICAgICJtb3YgJSVlZHgsICUwIgogIDogIj1tIiAoY2Fwcykg
OgogIDogIiVlYXgiLCIlZWJ4IiwiJWVjeCIsIiVlZHgiICAKICApOwogIC8vIGJpdCAyNyBpcyAn
aGFzIHJkdHNjcCAmIElBMzJfVFNDX0FVWCcgOgogIAogIHJldHVybiAoKGNhcHMgJiAoMTw8Mjcp
KT90cnVlOmZhbHNlKTsKfQoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5s
aW5lKSkKSUE2NF9uY2NjX3QKSUE2NF9uY2NjKHZvaWQpCnsgSUE2NF9uY2NjX3QgaT17MCwwLDB9
OwogIFUzMl90IHVudTsKICBhc20gdm9sYXRpbGUKICAoICJtb3YgJDAsICAgICUlZWN4XG5cdCIK
ICAgICJtb3YgJDB4MTUsICUlZWF4XG5cdCIgICAgCiAgICAiY3B1aWRcblx0IgogICAgIm1vdiAl
JWVheCwgJTBcblx0IgogICAgIm1vdiAlJWVieCwgJTFcblx0IgogICAgIm1vdiAlJWVjeCwgJTJc
blx0IgogICAgIm1vdiAlJWVkeCwgJTMiICAgIAogIDogIj1tIiAoaS50c2NfY2NjX2QpICwKICAg
ICI9bSIgKGkudHNjX2NjY19uKSAsCiAgICAiPW0iIChpLnRzY19jY2NfZikgLAogICAgIj1tIiAo
dW51KSA6CiAgOiAiJWVheCIsIiVlYngiLCIlZWN4IiwiJWVkeCIgIAogICk7CiAgcmV0dXJuIGk7
Cn0KCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCmRvdWJsZSBJ
QTY0X25vbWluYWxfdHNjX2ZyZXF1ZW5jeV9oeihyZWdpc3RlciBJQTY0X25jY2NfdCAqbmNjYykK
ewogIGlmKCAobmNjYy0+dHNjX2NjY19mID09IDApIHx8IChuY2NjLT50c2NfY2NjX24gPT0gMCkg
fHwgKG5jY2MtPnRzY19jY2NfZCA9PSAwKSApCiAgICByZXR1cm4gMC4wOwogIHJldHVybiAoICgo
ZG91YmxlKSggbmNjYy0+dHNjX2NjY19mICogbmNjYy0+dHNjX2NjY19uKSkgLyAoKGRvdWJsZSlu
Y2NjLT50c2NfY2NjX2QpICk7Cn0KCnN0YXRpYyBfX3RocmVhZAppbnQgIF9jcHUwaWRfZmQ9LTE7
CnN0YXRpYyBfX3RocmVhZApjaGFyIF9jcHUwaWRfZGF0YVsyNTZdPXswfTsKCnN0YXRpYyBpbmxp
bmUgX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCmJvb2wgSUE2NF9pbml0X2NwdTBpZF9k
YXRhKCkKeyBpZihGQUlMID09IChfY3B1MGlkX2ZkID0gb3BlbigiL2Rldi9jcHUvMC9jcHVpZCIs
IE9fUkRPTkxZKSkpCiAgeyBmcHJpbnRmKHN0ZGVycixfX0ZJTEVfXyI6JWQ6JXM6IGZhaWxlZCB0
byBvcGVuIC9kZXYvY3B1LzAvY3B1aWQ6ICVkOiclcycuXG4iLF9fTElORV9fLF9fRlVOQ1RJT05f
XyxlcnJubyxzdHJlcnJvcihlcnJubykpOwogICAgcmV0dXJuIGZhbHNlOwogIH0KICBpZigyNTYg
ICE9IHJlYWQoX2NwdTBpZF9mZCwgX2NwdTBpZF9kYXRhLCAyNTYpICkKICB7IGNsb3NlKF9jcHUw
aWRfZmQpOwogICAgZnByaW50ZihzdGRlcnIsX19GSUxFX18iOiVkOiVzOiBmYWlsZWQgdG8gcmVh
ZCAldSBieXRlcyBvbiAvZGV2L2NwdS8wL2NwdWlkOiAlZDonJXMnLlxuIixfX0xJTkVfXyxfX0ZV
TkNUSU9OX18sIDI1NiAsIGVycm5vLHN0cmVycm9yKGVycm5vKSk7CiAgICByZXR1cm4gZmFsc2U7
CiAgfQogIGNsb3NlKF9jcHUwaWRfZmQpOyAgCiAgcmV0dXJuIHRydWU7Cn0KCgpzdGF0aWMgaW5s
aW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQpib29sCklBNjRfaGFzX25vbnN0b3Bf
dHNjKHZvaWQpCnsgcmVnaXN0ZXIgY2hhciBjPSdcMCc7CiAgaWYoIF9jcHUwaWRfZmQgPT0gLTEg
KQogICAgaWYoICEgSUE2NF9pbml0X2NwdTBpZF9kYXRhKCkgKQogICAgICByZXR1cm4gZmFsc2U7
CiAgYyA9IF9jcHUwaWRfZGF0YVsgKCgzKjMyKSsyNCkvOCBdOwogIGlmKCBjICYgMSApCiAgeyAv
L2ZwcmludGYoc3RkZXJyLCJoYXMgbm9uc3RvcCBUU0NcbiIpOwogICAgcmV0dXJuIHRydWU7CiAg
fQogIHJldHVybiBmYWxzZTsKfQoKc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNf
aW5saW5lKSkKYm9vbApJQTY0X3RzY19oYXNfYXJ0KHZvaWQpCnsgcmVnaXN0ZXIgY2hhciBjPSdc
MCc7CiAgaWYoIF9jcHUwaWRfZmQgPT0gLTEgKQogICAgaWYoIUlBNjRfaW5pdF9jcHUwaWRfZGF0
YSgpKQogICAgICByZXR1cm4gZmFsc2U7CiAgYyA9IF9jcHUwaWRfZGF0YVsgKCgzKjMyKSsxMCkv
OCBdOyAgCiAgaWYoIGMgJiA0ICkKICB7CiAgICAvLyBmcHJpbnRmKHN0ZGVyciwiaGFzIFRTQyBB
UlQgaGFyZHdhcmVcbiIpOwogICAgcmV0dXJuIHRydWU7CiAgfQogIHJldHVybiBmYWxzZTsKfQoK
X190aHJlYWQKYm9vbCBfaWE2NF9pbnZhcmlhbnRfdHNjX2VuYWJsZWQ9ZmFsc2U7CgpzdGF0aWMg
aW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQogIGJvb2wgSUE2NF9pbnZhcmlh
bnRfdHNjX2lzX2VuYWJsZWQoIHJlZ2lzdGVyIElBNjRfbmNjY190ICpuY2NjcCwgcmVnaXN0ZXIg
ZG91YmxlICpudHNjZnFwICkKeyBpZiggX2NwdTBpZF9mZCAhPSAtMSApCiAgICByZXR1cm4gX2lh
NjRfaW52YXJpYW50X3RzY19lbmFibGVkOwogIElBNjRfbmNjY190IHRuOwogIGRvdWJsZSB0c2Nm
cTsKICBpZihOVUxMID09IG5jY2NwICkKICAgIG5jY2NwID0gJnRuOwogIGlmKE5VTEwgPT0gbnRz
Y2ZxcCApCiAgICBudHNjZnFwID0gJnRzY2ZxOyAgCiAgcmV0dXJuICggX2lhNjRfaW52YXJpYW50
X3RzY19lbmFibGVkID0KICAoIElBNjRfaGFzX3RzYygpICYmCiAgICBJQTY0X2hhc19jb25zdGFu
dF90c2MoKSAmJgogICAgSUE2NF9oYXNfcmR0c2NwKCkgJiYKICAgIElBNjRfaGFzX25vbnN0b3Bf
dHNjKCkgJiYgIAogICAgKCAoSUE2NF9oYXNfY3B1aWRfbGVhZl8xNWgoKSAmJgogICAgICAgKCAw
LjAgPCAoKm50c2NmcXAgPSBJQTY0X25vbWluYWxfdHNjX2ZyZXF1ZW5jeV9oeiggKCpuY2NjcCA9
IElBNjRfbmNjYygpLCBuY2NjcCkgKSApICkKICAgICAgKSB8fAogICAgICBJQTY0X2hhc19jcHVp
ZF9sZWFmXzgwMDAwMDA3aCgpCiAgICApCiAgKSApOyAgIAp9CgpfX3RocmVhZApVMzJfdCBfaWE2
NF90c2Nfa2h6PTA7CgpzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUp
KQpVMzJfdCBJQTY0X3RzY19raHooKQp7IFVMX3Qga3N5bV9hZGRyOyAgICAKICBpZiggX2lhNjRf
dHNjX2toeiAhPSAwICkKICAgIHJldHVybiBfaWE2NF90c2Nfa2h6OwogIGlmKCBfaWE2NF9pbnZh
cmlhbnRfdHNjX2VuYWJsZWQgfHwKICAoKF9jcHUwaWRfZmQgPT0gLTEpICYmIElBNjRfaW52YXJp
YW50X3RzY19pc19lbmFibGVkKE5VTEwsTlVMTCkpCiAgICApCiAgeyByZWdpc3RlciBzaXplX3Qg
c3ogPSBnZXRwYWdlc2l6ZSgpLCBsOwogICAgcmVnaXN0ZXIgY2hhciAqcGFnZSA9IGFsbG9jYShz
eik7CiAgICByZWdpc3RlciBjb25zdCBjaGFyICprc3ltX2xvY2F0aW9uID0gKE9LID09IGFjY2Vz
cyggS1NZTV9MT0NBVElPTiwgWF9PSyApKSA/IEtTWU1fTE9DQVRJT04gOiAoKE9LID09IGFjY2Vz
cyggIi4va3N5bSIsIFhfT0sgKSkgPyAiLi9rc3ltIiA6ICJub3QgZm91bmQiKSA7CiAgICBpZihP
SyAhPSBhY2Nlc3MoIGtzeW1fbG9jYXRpb24sIFhfT0sgKSkKICAgIHsgZnByaW50ZihzdGRlcnIs
X19GSUxFX18iOiVkOiglcyk6IHVuYWJsZSB0byBsb2NhdGUgZXhlY3V0YWJsZSAlcyBzY3JpcHQg
LSBLU1lNX0xPQ0FUSU9OOiAlcy5cbiIsX19MSU5FX18sX19GVU5DVElPTl9fLCBrc3ltX2xvY2F0
aW9uLCBLU1lNX0xPQ0FUSU9OKTsKICAgICAgcmV0dXJuIDA7CiAgICB9CiAgICBsPXNucHJpbnRm
KHBhZ2UsIHN6LCIlcyB0c2Nfa2h6IDQiLCBrc3ltX2xvY2F0aW9uKTsKICAgIHJlZ2lzdGVyIEZJ
TEUgKmtzeW1fZnA9cG9wZW4ocGFnZSwgInIiKTsKICAgIGlmKCBmc2NhbmYoa3N5bV9mcCwgIiVs
eCAlcyAleFxuIiwgJmtzeW1fYWRkciwgcGFnZSwgJl9pYTY0X3RzY19raHopICE9IDMgKQogICAg
eyBmcHJpbnRmKHN0ZGVycixfX0ZJTEVfXyI6JWQ6KCVzKTogL3Vzci9iaW4va3N5bSBmYWlsZWQg
dG8gbG9va3VwIG9yIHByb3ZpZGUgYSB2YWx1ZSBmb3IgdHNjX2toei5cbiIsX19MSU5FX18sX19G
VU5DVElPTl9fKTsKICAgICAgZmNsb3NlKGtzeW1fZnApOwogICAgICByZXR1cm4gMDsKICAgIH0K
ICAgIGZjbG9zZShrc3ltX2ZwKTsgICAgCiAgfQogIHJldHVybiBfaWE2NF90c2Nfa2h6Owp9Cgoj
ZW5kaWYKCgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAHR0c2MvdHRzYzEuYwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAw
MDAwNjQ0ADAwMDAwMDAAMDAwMDAwMAAwMDAwMDAxMDQzMgAxMzA1MzMzMjcwMAAwMTE3MjcAIDAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdXN0YXIgIAByb290AAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHJvb3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAALyogdHRzYzEuYyA6IERlbW9uc3RyYXRlcyBsYXRlbmN5IG9mIHVzZSBvZiBJ
QTY0X3JkdHNjLmgncyBJQTY0X3NfbnNfc2luY2Vfc3RhcnQoKSAgdnMuIHVzaW5nIGNsb2NrX2dl
dHRpbWUoQ0xPQ0tfTU9OT1RPTklDX1JBVykKICovCiNkZWZpbmUgX0dOVV9TT1VSQ0UKI2luY2x1
ZGUgPGZlYXR1cmVzLmg+CiNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KI2luY2x1ZGUgPHN0ZGludC5o
PgojaW5jbHVkZSA8c3RkYXJnLmg+CiNpbmNsdWRlIDxzdGRib29sLmg+CiNpbmNsdWRlIDx0aW1l
Lmg+CiNpbmNsdWRlIDxzeXMvc3RhdC5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxl
cnJuby5oPgojaW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNsdWRl
IDxzZXRqbXAuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KCiNpbmNs
dWRlICJJQTY0X3RzY19pbmZvLmgiCiNpbmNsdWRlICJJQTY0X3JkdHNjLmgiCgppbnQgbWFpbihp
bnQgYXJnYywgY29uc3QgY2hhciAqY29uc3QqIGFyZ3YsIGNvbnN0IGNoYXIgKmNvbnN0KiBlbnZw
KQp7IGJvb2wKICAgIGhhc190c2MgICAgICAgICA9SUE2NF9oYXNfdHNjKCkKICAsIGhhc19jb25z
dGFudF90c2M9SUE2NF9oYXNfY29uc3RhbnRfdHNjKCkKICAsIGhhc18xNWggICAgICAgICA9SUE2
NF9oYXNfY3B1aWRfbGVhZl8xNWgoKQogICwgaGFzXzgwMDAwMDA3aCAgID1JQTY0X2hhc19jcHVp
ZF9sZWFmXzgwMDAwMDA3aCgpOwogIGZwcmludGYoc3RkZXJyLCJoYXMgdHNjOiAldSBjb25zdGFu
dDogJXVcbiIsaGFzX3RzYywgaGFzX2NvbnN0YW50X3RzYyk7CiAgaWYoIGhhc190c2MgJiYgaGFz
X2NvbnN0YW50X3RzYyApCiAgeyBVTF90IHRzY19raHogPSBJQTY0X3RzY19raHooKTsKICAgIElB
NjRfbmNjY190IG5jY2M7CiAgICBkb3VibGUgdHNjX25fZnJlcTsKICAgIGJvb2wgdHNjX2lzX2Vu
YWJsZWQgPSBJQTY0X2ludmFyaWFudF90c2NfaXNfZW5hYmxlZCgmbmNjYywgJnRzY19uX2ZyZXEp
OwogICAgaWYoIHRzY19pc19lbmFibGVkICYmICBoYXNfMTVoICkKICAgICAgICBmcHJpbnRmKHN0
ZGVyciwiSW52YXJpYW50IFRTQyBpcyBlbmFibGVkIDogVFNDIC8gQ0NDOiAldSAvICV1ID0gJXUg
OyBDQ0MgZnJlcTogJXVIeiAgTm9taW5hbCBUU0MgZnJlcTo6ICUuOUVIeiA6IEFjdHVhbCBUU0Mg
ZnJlcTogJS45R0dIei5cbiIsCiAgICAgICAgICAgICAgICBuY2NjLnRzY19jY2NfbiAsIG5jY2Mu
dHNjX2NjY19kLAogICAgICAgICAgICAgICAgbmNjYy50c2NfY2NjX24gLyBuY2NjLnRzY19jY2Nf
ZCwKICAgICAgICAgICAgICAgIG5jY2MudHNjX2NjY19mLAogICAgICAgICAgICAgICAgdHNjX25f
ZnJlcSwKICAgICAgICAgICAgICAgICgoKGRvdWJsZSl0c2Nfa2h6KSoxZTMpLzFlOQogICAgICAg
ICAgICAgICApOyAgICAgICAgCiAgICBlbHNlIGlmKCB0c2NfaXNfZW5hYmxlZCAmJiAgaGFzXzgw
MDAwMDA3aCApICAgICAKICAgICAgZnByaW50ZihzdGRlcnIsIkludmFyaWFudCBUU0MgaXMgZW5h
YmxlZDogQWN0dWFsIFRTQyBmcmVxOiAlLjlHR0h6LlxuIiwoKChkb3VibGUpdHNjX2toeikqMWUz
KS8xZTkpOwogICAgaWYodHNjX2lzX2VuYWJsZWQpCiAgICB7IHN0cnVjdCB0aW1lc3BlYyB0c3Ax
LCB0c3AyLCB0c3BfYiwgdHNwX2U7CiAgICAgIGNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklD
X1JBVywmdHNwX2IpOwogICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQ19SQVcsJnRz
cDEpOwogICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQ19SQVcsJnRzcDIpOyAgICAg
ICAgICAgIAogICAgICByZWdpc3RlciBVTF90IHRzMCA9IElBNjRfc19uc19zaW5jZV9zdGFydCgp
OyAgICAgIAogICAgICByZWdpc3RlciBVTF90IHRzMiA9IElBNjRfc19uc19zaW5jZV9zdGFydCgp
OwogICAgICByZWdpc3RlciBVTF90IHRzMSA9IHRzMjsKICAgICAgcmVnaXN0ZXIgVUxfdCB0czMg
PSBJQTY0X3NfbnNfc2luY2Vfc3RhcnQoKTsKICAgICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05P
VE9OSUNfUkFXLCZ0c3BfZSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAg
ICAgIHJlZ2lzdGVyIFUxMjhfdAogICAgICAgIG5fbnMxPSgoKCgoVTEyOF90KXRzcDIudHZfc2Vj
KSAqIDEwMDAwMDAwMDBVTEwpICsgKChVMTI4X3QpIHRzcDIudHZfbnNlYykpIC0gICAgICAKICAg
ICAgICAgICAgICAgKCgoKFUxMjhfdCl0c3AxLnR2X3NlYykgKiAxMDAwMDAwMDAwVUxMKSArICgo
VTEyOF90KSB0c3AxLnR2X25zZWMpKSkKICAgICAgLCBuX25zMj0oKCgoKFUxMjhfdCl0c3BfZS50
dl9zZWMpICogMTAwMDAwMDAwMFVMTCkgKyAoKFUxMjhfdCkgdHNwX2UudHZfbnNlYykpIC0gICAg
ICAKICAgICAgICAgICAgICAgKCgoKFUxMjhfdCl0c3BfYi50dl9zZWMpICogMTAwMDAwMDAwMFVM
TCkgKyAoKFUxMjhfdCkgdHNwX2IudHZfbnNlYykpKTsKICAgICAgZnByaW50ZihzdGRlcnIsICJ0
czIgLSB0czE6ICVsdSB0czMgLSB0czI6ICVsdSBuczE6ICV1LiUuOXUgbnMyOiAldS4lLjl1XG4i
LCB0czIgLSB0czAsIHRzMy10czIKICAgICAgICAgICAgICAsKChVMzJfdCkobl9uczEgLyAxMDAw
MDAwMDAwVUxMKSYweGZmZmZmZmZmVSksICgoVTMyX3QpIChuX25zMSAlIDEwMDAwMDAwMDBVTEwp
ICYgMHhmZmZmZmZmZlVMKQogICAgICAgICAgICAgICwoKFUzMl90KShuX25zMiAvIDEwMDAwMDAw
MDBVTEwpJjB4ZmZmZmZmZmZVKSwgKChVMzJfdCkgKG5fbnMyICUgMTAwMDAwMDAwMFVMTCkgJiAw
eGZmZmZmZmZmVUwpCiAgICAgICAgICAgICk7CiAgICAgIHJlZ2lzdGVyIGJ5dGVfdCBpOyAgICAK
ICAgICAgZm9yKCBpID0gMDsgaSA8IDEwOyBpKz0xICkKICAgICAgeyBjbG9ja19nZXR0aW1lKENM
T0NLX01PTk9UT05JQ19SQVcsJnRzcDEpOwogICAgICAgIGNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9O
T1RPTklDX1JBVywmdHNwMik7ICAgICAgCiAgICAgICAgdHMyID0gSUE2NF9zX25zX3NpbmNlX3N0
YXJ0KCk7ICAgICAgCiAgICAgICAgdHMzID0gSUE2NF9zX25zX3NpbmNlX3N0YXJ0KCk7CiAgICAg
ICAgbl9uczE9KCgoKChVMTI4X3QpdHNwMi50dl9zZWMpICogMTAwMDAwMDAwMFVMTCkgKyAoKFUx
MjhfdCkgdHNwMi50dl9uc2VjKSkgLSAgICAgIAogICAgICAgICAgICAgICAoKCgoVTEyOF90KXRz
cDEudHZfc2VjKSAqIDEwMDAwMDAwMDBVTEwpICsgKChVMTI4X3QpIHRzcDEudHZfbnNlYykpKQog
ICAgICAgICAgICAgIDsKICAgICAgICBmcHJpbnRmKHN0ZGVyciwgInRzMyAtIHRzMjogJWx1IG5z
MTogJWx1LiUuOWx1XG4iLCB0czMgLSB0czIKICAgICAgICAgICAgICAgLCgoVTMyX3QpKG5fbnMx
IC8gMTAwMDAwMDAwMFVMTCkmMHhmZmZmZmZmZlUpLCAoKFUzMl90KSAobl9uczEgJSAxMDAwMDAw
MDAwVUxMKSAmIDB4ZmZmZmZmZmZVTCkpOwogICAgICAgIHRzMT0gSUE2NF9zX25zX3NpbmNlX3N0
YXJ0KCk7CiAgICAgICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUNfUkFXLCZ0c3BfZSk7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgIH0KICAgICAgbl9uczI9KCgoKChV
MTI4X3QpdHNwX2UudHZfc2VjKSAqIDEwMDAwMDAwMDBVTEwpICsgKChVMTI4X3QpIHRzcF9lLnR2
X25zZWMpKSAtICAgICAgCiAgICAgICAgICAgICgoKChVMTI4X3QpdHNwX2IudHZfc2VjKSAqIDEw
MDAwMDAwMDBVTEwpICsgKChVMTI4X3QpIHRzcF9iLnR2X25zZWMpKSk7ICAgICAgCiAgICAgIGZw
cmludGYoc3RkZXJyLCAidDEgLSB0MDogJWx1IC0gbnMyOiAlbHUuJS45bHVcbiIsIHRzMSAtIHRz
MAogICAgICAsKChVMzJfdCkobl9uczIgLyAxMDAwMDAwMDAwVUxMKSYweGZmZmZmZmZmVSksICgo
VTMyX3QpIChuX25zMiAlIDEwMDAwMDAwMDBVTEwpICYgMHhmZmZmZmZmZlVMKSk7ICAgCiAgICB9
IGVsc2UKICAgIHsgIGZwcmludGYoc3RkZXJyLF9fRklMRV9fIiVkOiglcyk6IHNvcnJ5LCBtb2Rl
cm4gN3RoLWdlbmVyYXRpb24gSW50ZWwgXCJJbnZhcmlhbnQgVFNDXCIgd2l0aCBBUlQgKGFsd2F5
cyBydW5uaW5nIHRpbWVyKSBpcyBub3QgZnVsbHkgZW5hYmxlZCBvbiB0aGlzIHBsYXRmb3JtIDpc
blx0aGFzX3RzYzogJXUgaGFzX2xlYWZfMTVoOiAldSBoYXNfbGVhZl84MDAwMDAwN2g6ICV1IGhh
c19jb25zdGFudF90c2M6ICV1IGhhc19yZHRzY3A6ICV1IGhhc19ub25zdG9wX3RzYzogJXUgXG4i
LF9fTElORV9fLF9fRlVOQ1RJT05fXywKICAgICAgIGhhc190c2MgLCBoYXNfMTVoLCBoYXNfODAw
MDAwMDdoLCBoYXNfY29uc3RhbnRfdHNjLAogICAgICAgSUE2NF9oYXNfcmR0c2NwKCksCiAgICAg
ICBJQTY0X2hhc19ub25zdG9wX3RzYygpCiAgICAgICk7CiAgICB9CiAgfQogIHJldHVybiAwOwp9
CgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
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
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
--94eb2c122e546d50e0054920b289--
