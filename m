From: Godmar Back <godmar@gmail.com>
Date: Tue, 01 Feb 2005 18:43:35 +0000
Subject: [KJ] question regarding global symbols & namespace.pl script
Message-Id: <719dced3050201104324e53747@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============077233344971325835=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============077233344971325835==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I have a very basic question regarding global symbols.

Does the Linux kernel build system provide each kernel module with its own 
namespace for global symbols?

For instance, Keith Owens points out in an old email that "there are
guaranteed to
be conflicts on static and global but unexported symbols" (within one module:
http://www.ussg.iu.edu/hypermail/linux/kernel/9909.0/0433.html), which seems 
to imply that only exported symbols of a module  are entered into the global 
namespace and that programmers can use  global symbols to communicate
across .o files with a module freely.

However, if a given subsystem is not built as a module, but rather
using the 'y'
option builtin to the kernel, how does the linker know how to respect
these per-module
namespaces?

Or is it possible that - depending on the configuration - a global symbol might 
cause a doubly-defined error in one (non-module) build configuration,
but not when
built as a module? 

I tried the namespace.pl script Keith wrote, however, I'm getting numerous 
messages such as this one when running namespace.pl in the Linux 
kernel top-level dir:

No source file found for arch/i386/kernel/process.o
...

despite the fact that arch/i386/kernel/process.c exists.
Could this be due to tool incompatibilities?
For instance, objdump -s -j .comment shows:
arch/i386/kernel/process.o:     file format elf32-i386

Contents of section .comment:
 0000 00474343 3a202847 4e552920 332e3100  .GCC: (GNU) 3.1.

whereas namespace.pl seems to expect:
/GCC\:.*GCC\:/m
(?)
Note this is on a 2.6.8.1 kernel build.

I would be helpful for any answers, particularly to my first question.

Thanks!

 - Godmar

--===============077233344971325835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============077233344971325835==--
