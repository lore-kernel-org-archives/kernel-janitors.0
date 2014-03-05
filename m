From: walter harms <wharms@bfs.de>
Date: Wed, 05 Mar 2014 08:27:54 +0000
Subject: Re: My Kernel bug is celebrating 2 years. Can you help me fix it?
Message-Id: <5316E00A.3030704@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDrTNtAHKsiBHz=W4=eJRO=m9EK_HZ7zLxb=4fg5riUQeg@mail.gmail.com>
In-Reply-To: <CA+MoWDrTNtAHKsiBHz=W4=eJRO=m9EK_HZ7zLxb=4fg5riUQeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org



Am 04.03.2014 22:26, schrieb Peter Senna Tschudin:
> I have reported a bug more than two years ago and it is still
> affecting me. The bug report gives some information:
> 
> https://bugzilla.redhat.com/show_bug.cgi?idx7299
> 
> I have tried basic debug instructions from:
> https://www.kernel.org/doc/Documentation/power/basic-pm-debugging.txt
> 
> And everything works as expected when:
> # echo freeze > /sys/power/state
> # echo disk > /sys/power/state
> 
> I have asked for help for fixing it:
> https://lkml.org/lkml/2013/11/1/186
> 
> But I don't have a serial port. How can I debug this issue without a
> "real" serial port? Or what else can I try? 
You need to create a kernel with networksupport,
setup "netconsole" you need a second computer to receive the issues.


>How can I explore the hint
> about the problem only happening with VT-d enabled in BIOS? How can I
> explore the hint about the problem not happening if the option
> nox2apic is passed to the Kernel?

never heard about that until now, obviously there is a bug in several
acpi's that can be triggered. If your systems works with nox2apic
as bootparameter you should be happy since a workaround is available.
Information about it is used can be find here:
http://lxr.free-electrons.com/ident?a=microblaze;i=nox2apic

re,
 wh


> Thank you,
> 
> Peter
> 
> P.S Yes, it works on Windows.
> 
