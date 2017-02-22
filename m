From: Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 22 Feb 2017 19:53:33 +0000
Subject: Re: [PATCH] arch/x86/kernel/tsc.c : set X86_FEATURE_ART for TSC on CPUs like i7-4910MQ : bug #194609
Message-Id: <alpine.DEB.2.20.1702220958590.3782@nanos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALyZvKyAH8xfj_j2Vh_z2BOgYJeP73LvFwhvQ26-Kyfthdtwiw@mail.gmail.com> <CALyZvKwVDP8bTDdteYZT01GJGDd0d+hQ7oib-oXj+DarNHMWnQ@mail.gmail.com> <alpine.DEB.2.20.1702201239330.4208@nanos> <CALyZvKxhvGjRou4FcEvvbwPxPzAxpe8Shn=53DUx6WYWqEGSrA@mail.gmail.com>
 <CALyZvKyThHz12B7ViO8wyqeVB+mknBQGi=k7+TRUX-mCjkATtA@mail.gmail.com> <CALyZvKz_WpnDCPTy=DobayTTj-3gTUZ=TCv25i3Hb9AcYKa14w@mail.gmail.com> <CALyZvKyTGOmXC9DxcS-UR-STSwtJONMQA6srtZAaiLURcOxqvA@mail.gmail.com>
In-Reply-To: <CALyZvKyTGOmXC9DxcS-UR-STSwtJONMQA6srtZAaiLURcOxqvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Vas Dias <jason.vas.dias@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Prarit Bhargava <prarit@redhat.com>, x86@kernel.org

On Wed, 22 Feb 2017, Jason Vas Dias wrote:

> Yes, my CPU is still getting a fault every time the TSC_ADJUST MSR is
> read or written . It is probably because it genuinuely does not support
> any cpuid > 13 , or the modern TSC_ADJUST interface.

Err no. TSC_ADJUST is available when CPUID(70 EBX has bit 1 set.

Please provide the output of:

# cpuid -1 -r

for that machine

> This is probably why my clock_gettime() latencies are so bad. Now I have
> to develop a patch to disable all access to TSC_ADJUST MSR if
> boot_cpu_data.cpuid_level <= 13 .  I really have an unlucky CPU :-) .

Can you just try to boot linux 4.10 on that machine an report whether it
works? It will touch the TSC_ADJUST MRS when the feature bit is set.

> But really, I think this issue goes deeper into the fundamental limits of
> time measurement on Linux : it is never going to be possible to measure
> minimum times with clock_gettime() comparable with those returned by
> rdtscp instruction - the time taken to enter the kernel through the VDSO,
> queue an access to vsyscall_gtod_data via a workqueue, access it & do
> computations & copy value to user-space

Sorry, that's not how the VDSO works. It does not involve workqueues, copy
to user space and whatever. VDSO is mapped into user space and only goes
into the when TSC is not working or the VDSO access is disabled or you want
to access a CLOCKID which is not supported in the VDSO.

> is NEVER going to be up to the job of measuring small real-time durations
> of the order of 10-20 TSC ticks .

clock_gettime(CLOCK_MONOTONIC) via VDSO takes ~20ns on my haswell laptop

> I think the best way to solve this problem going forward would be to store
> the entire vsyscall_gtod_data  data structure representing the current
> clocksource
> in a shared page which is memory-mappable (read-only) by user-space .

This is what VDSO does. It provides the data R/O to user space and it also
provides the accessor functions.

CLOCK_MONOTONIC, CLOCK_REALTIME, CLOCK_MONOTONIC_COARSE and
CLOCK_REALTIME_COARSE are handled in the VDSO (user space) and never enter
the kernel.

I really have a hard time to understand what you are trying to solve.

Thanks,

	tglx


