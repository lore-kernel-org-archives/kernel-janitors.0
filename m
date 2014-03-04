From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 04 Mar 2014 21:26:37 +0000
Subject: My Kernel bug is celebrating 2 years. Can you help me fix it?
Message-Id: <CA+MoWDrTNtAHKsiBHz=W4=eJRO=m9EK_HZ7zLxb=4fg5riUQeg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

I have reported a bug more than two years ago and it is still
affecting me. The bug report gives some information:

https://bugzilla.redhat.com/show_bug.cgi?idx7299

I have tried basic debug instructions from:
https://www.kernel.org/doc/Documentation/power/basic-pm-debugging.txt

And everything works as expected when:
# echo freeze > /sys/power/state
# echo disk > /sys/power/state

I have asked for help for fixing it:
https://lkml.org/lkml/2013/11/1/186

But I don't have a serial port. How can I debug this issue without a
"real" serial port? Or what else can I try? How can I explore the hint
about the problem only happening with VT-d enabled in BIOS? How can I
explore the hint about the problem not happening if the option
nox2apic is passed to the Kernel?

Thank you,

Peter

P.S Yes, it works on Windows.

-- 
Peter
