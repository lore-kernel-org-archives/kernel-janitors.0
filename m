From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 07 Feb 2005 23:14:41 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <4207F661.5040905@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

S wrote:
> Using gcc-core-4.0-20050130.tar, the "internal
> consisteny problem" has gone away.
> However, during the 2.6.10 kernel compilation, some
> #warnings stopped the compilation. Any ideas on what
> needs to be done with the #warnings ?
>>From the looks of it, a newer snapshot may not have
> the  #warnings possibly.

What CPU arch. are you building on?
I see that sparc64 and alpha use -Werror (treat warnings
as errors, which is what you show below), but other arches
don't do that (unless it's in -mm) AFAIK.

If you are using sparc64 or alpha, you can just edit
the Makefile(s) to use -Wall instead of -Werror .
Or change .config to omit these (few) drivers.

> <snip>
> drivers/cpufreq/cpufreq_userspace.c:140:2: warning:
> #warning The /proc/sys/cpu/ and sysctl interface to
> cpufreq will be removed from the 2.6. kernel series
> soon after 2005-01-01
>   CC [M]  drivers/cpufreq/cpufreq_ondemand.o
>   CC [M]  drivers/cpufreq/freq_table.o
>   CC [M]  drivers/cpufreq/proc_intf.o
> drivers/cpufreq/proc_intf.c:15:2: warning: #warning
> This module will be removed
> from the 2.6. kernel series soon after 2005-01-01
>   GEN     drivers/eisa/devlist.h
>   CC      drivers/eisa/eisa-bus.o
> cc1: warnings being treated as errors
> drivers/eisa/eisa-bus.c:421: warning: pointer targets
> in initialization differ in signedness
> drivers/eisa/eisa-bus.c:422: warning: pointer targets
> in initialization differ in signedness
> make[2]: *** [drivers/eisa/eisa-bus.o] Error 1
> make[1]: *** [drivers/eisa] Error 2
> make: *** [drivers] Error 2
> 
> 
> -----------------------------------------------------
> List:       kernel-janitor-discuss
> Subject:    [KJ] janitor project: fix gcc 4 warnings
> From:       Andi Kleen <ak () muc ! de>
> Date:       2004-12-19 19:09:03
> Message-ID: <20041219190903.GA30192 () muc ! de>
> [Download message RAW]
> 
> Here's a proposed janitor project if anybody is
> interested:
> 
> The current gcc 4.0 snapshots include some more
> warnings in -Wall
> and changed some existing ones which makes a kernel
> compilation quite noisy. 
> 
> The project would be to fix all these warnings.
> 
> Short howto: 
> 
> Get
> ftp://gcc.gnu.org/pub/gcc/snapshots/4.0-20041219/gcc-core-4.0-20041219.tar.bz2
> 
> Untar it and compile with 
> 
> mkdir obj
> ../gcc-*/configure --disable-checking
> --enable-languages=c --prefix=/usr/local/gcc4
> make bootstrap
> <as root> 
> make install
> 
> 
> Then compile an uptodate 2.6 kernel with:
> 
> make allmodconfig
> make CC=/usr/local/gcc4/bin/gcc 2>&1 | tee LOG
> grep warning LOG 
> 
> You'll see lots of warnings in LOG. Fix them all and
> submit patches
> through the usual janitor channels.
> 
> -Andi


-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
