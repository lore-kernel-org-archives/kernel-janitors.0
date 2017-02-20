From: Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 20 Feb 2017 21:49:14 +0000
Subject: Re: [PATCH] arch/x86/kernel/tsc.c : set X86_FEATURE_ART for TSC on CPUs like i7-4910MQ : bug #194609
Message-Id: <alpine.DEB.2.20.1702201239330.4208@nanos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALyZvKyAH8xfj_j2Vh_z2BOgYJeP73LvFwhvQ26-Kyfthdtwiw@mail.gmail.com> <CALyZvKwVDP8bTDdteYZT01GJGDd0d+hQ7oib-oXj+DarNHMWnQ@mail.gmail.com>
In-Reply-To: <CALyZvKwVDP8bTDdteYZT01GJGDd0d+hQ7oib-oXj+DarNHMWnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Vas Dias <jason.vas.dias@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Prarit Bhargava <prarit@redhat.com>, x86@kernel.org

On Sun, 19 Feb 2017, Jason Vas Dias wrote:

> CPUID:15H is available in user-space, returning the integers : ( 7,
> 832, 832 ) in EAX:EBX:ECX , yet boot_cpu_data.cpuid_level is 13 , so
> in detect_art() in tsc.c,

By some definition of available. You can feed CPUID random leaf numbers and
it will return something, usually the value of the last valid CPUID leaf,
which is 13 on your CPU. A similar CPU model has

0x0000000d 0x00: eax=0x00000007 ebx=0x00000340 ecx=0x00000340 edx=0x00000000

i.e. 7, 832, 832, 0

Looks familiar, right?

You can verify that with 'cpuid -1 -r' on your machine.

> Linux does not think ART is enabled, and does not set the synthesized CPUID +
> ((3*32)+10) bit, so a program looking at /dev/cpu/0/cpuid would not
> see this bit set .

Rightfully so. This is a Haswell Core model.

> if an e1000 NIC card had been installed, PTP would not be available.

PTP is independent of the ART kernel feature . ART just provides enhanced
PTP features. You are confusing things here.

The ART feature as the kernel sees it is a hardware extension which feeds
the ART clock to peripherals for timestamping and time correlation
purposes. The ratio between ART and TSC is described by CPUID leaf 0x15 so
the kernel can make use of that correlation, e.g. for enhanced PTP
accuracy.

It's correct, that the NONSTOP_TSC feature depends on the availability of
ART, but that has nothing to do with the feature bit, which solely
describes the ratio between TSC and the ART frequency which is exposed to
peripherals. That frequency is not necessarily the real ART frequency.

> Also, if the MSR TSC_ADJUST has not yet been written, as it seems to be
> nowhere else in Linux,  the code will always think X86_FEATURE_ART is 0
> because the CPU will always get a fault reading the MSR since it has
> never been written.

Huch? If an access to the TSC ADJUST MSR faults, then something is really
wrong. And writing it unconditionally to 0 is not going to happen. 4.10 has
new code which utilizes the TSC_ADJUST MSR.

> It would be nice for user-space programs that want to use the TSC with
> rdtsc / rdtscp instructions, such as the demo program attached to the
> bug report,
> could have confidence that Linux is actually generating the results of
> clock_gettime(CLOCK_MONOTONIC_RAW, &timespec)
> in a predictable way from the TSC by looking at the
>  /dev/cpu/0/cpuid[bit(((3*32)+10)] value before enabling user-space
> use of TSC values, so that they can correlate TSC values with linux
> clock_gettime() values.

What has ART to do with correct CLOCK_MONOTONIC_RAW values?

Nothing at all, really.

The kernel makes use of the proper information values already.

The TSC frequency is determined from:

    1) CPUID(0x16) if available
    2) MSRs if available
    3) By calibration against a known clock

If the kernel uses TSC as clocksource then the CLOCK_MONOTONIC_* values are
correct whether that machine has ART exposed to peripherals or not.

> has tsc: 1 constant: 1
> 832 / 7 = 118 : 832 - 9.888914286E+04hz : OK:1

And that voodoo math tells us what? That you found a way to correlate
CPUID(0xd) to the TSC frequency on that machine.

Now I'm curious how you do that on this other machine which returns for
cpuid(15): 1, 1, 1

You can't because all of this is completely wrong.

Thanks,

	tglx
