From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 01 Feb 2005 22:41:35 +0000
Subject: Re: [KJ] question regarding global symbols & namespace.pl script
Message-Id: <4200059F.8060500@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <719dced3050201104324e53747@mail.gmail.com>
In-Reply-To: <719dced3050201104324e53747@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Godmar Back wrote:
> Hi,
> 
> I have a very basic question regarding global symbols.
> 
> Does the Linux kernel build system provide each kernel module with its own 
> namespace for global symbols?
>
> For instance, Keith Owens points out in an old email that "there are
> guaranteed to
> be conflicts on static and global but unexported symbols" (within one module:
> http://www.ussg.iu.edu/hypermail/linux/kernel/9909.0/0433.html), which seems 
> to imply that only exported symbols of a module  are entered into the global 
> namespace and that programmers can use  global symbols to communicate
> across .o files with a module freely.

That sounds right to me.

> However, if a given subsystem is not built as a module, but rather
> using the 'y'
> option builtin to the kernel, how does the linker know how to respect
> these per-module namespaces?

First one I see is this:

dev is multiply defined in :-
	drivers/isdn/i4l/isdn_common.o
	sound/oss/wavfront.o

and both of these have a variable 'dev' that is not static and not
exported.  It looks like they show up in the System.map file as
having a numbered suffix added to them, like dev.4 and dev.6 .

There was a recent bug where 2 drivers used a variable name of
'debug' for a debug flag (duh).  One of them had to be changed.
Both of them should have been changed IMO.

Why weren't these debug.1 and debug.2 ?  I dunno.  Maybe because
they were module parameters (?).

Anyway, all of this is an experiment that you can do at home.  :)

> Or is it possible that - depending on the configuration - a global symbol might 
> cause a doubly-defined error in one (non-module) build configuration,
> but not when built as a module?
 >
> I tried the namespace.pl script Keith wrote, however, I'm getting numerous 
> messages such as this one when running namespace.pl in the Linux 
> kernel top-level dir:
> 
> No source file found for arch/i386/kernel/process.o

I didn't see that one, or any that were incorrect AFAIK (of the "No
source file found" message).  For me these all came from
objects that were named differently than their source files
by the Makefiles.

> ...
> 
> despite the fact that arch/i386/kernel/process.c exists.
> Could this be due to tool incompatibilities?
> For instance, objdump -s -j .comment shows:
> arch/i386/kernel/process.o:     file format elf32-i386
> 
> Contents of section .comment:
>  0000 00474343 3a202847 4e552920 332e3100  .GCC: (GNU) 3.1.
> 
> whereas namespace.pl seems to expect:
> /GCC\:.*GCC\:/m
> (?)
> Note this is on a 2.6.8.1 kernel build.
> 
> I would be helpful for any answers, particularly to my first question.

Mine also says that (like yours), I don't get it....

Keith is definitely the best person to ask about this.

rddunlap@gargoyle:/mnt/box/linux-2611-rc2-bk5/arch/i386/kernel> 
objdump -s -j .comment process.o

process.o:     file format elf32-i386

Contents of section .comment:
  0000 00474343 3a202847 4e552920 332e332e  .GCC: (GNU) 3.3.
  0010 33202853 75534520 4c696e75 782900    3 (SuSE Linux).

-- 
~Randy


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
