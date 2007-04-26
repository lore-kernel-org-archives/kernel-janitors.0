From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 26 Apr 2007 11:06:56 +0000
Subject: [KJ] centralizing arch-specific kernel config settings
Message-Id: <Pine.LNX.4.64.0704260706100.533@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i noticed just yesterday the apparent redundancy in duplicating
arch-related kernel config settings across a number of Kconfig files,
as in:

$ grep "config GENERIC_BUG" $(find . -name Kconfig)
./arch/x86_64/Kconfig:config GENERIC_BUG
./arch/i386/Kconfig:config GENERIC_BUG
./arch/ppc/Kconfig:config GENERIC_BUG
./arch/um/Kconfig:config GENERIC_BUG
./arch/parisc/Kconfig:config GENERIC_BUG
./arch/powerpc/Kconfig:config GENERIC_BUG
$

in all of the above cases, the Kconfig directive looks like:

...
config GENERIC_BUG
        bool
        default y
        depends on BUG
...

so the obvious purpose is to define the config setting GENERIC_BUG for
a specific and relevant subset of the supported architectures.  but
isn't this a bit silly and overly verbose?  something like this could
just as easily (and more cleanly) be done using something like this in
init/Kconfig:

...
config AUDITSYSCALL
        bool "Enable system-call auditing support"
        depends on AUDIT && (X86 || PPC || PPC64 || S390 || IA64 || UML || SPARC64)
        default y if SECURITY_SELINUX
...

clearly, a single setting in init/Kconfig now defines AUDITSYSCALL for
just the appropriate subset of architectures, rather than spreading
that across multiple arch-specific Kconfig files.  the same technique
is used for UID16 in that same file:

...
config UID16
        bool "Enable 16-bit UID system calls" if EMBEDDED
        depends on ARM || CRIS || FRV || H8300 || X86_32 || M68K || (S390 && !64BIT) ...
...

  is there any reason config settings like GENERIC_BUG can't be
centralized in a single place like that?  i'm *guessing* a pile of
config settings could be simplified like this.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
