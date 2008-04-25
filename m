From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 25 Apr 2008 19:50:34 +0000
Subject: [PATCH] Documentation:  Explain 4K stacks in slightly more detail.
Message-Id: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 610aaec..e40d8d4 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -109,11 +109,17 @@ config 4KSTACKS
 	depends on X86_32
 	default y
 	help
-	  If you say Y here the kernel will use a 4Kb stacksize for the
-	  kernel stack attached to each process/thread. This facilitates
-	  running more threads on a system and also reduces the pressure
-	  on the VM subsystem for higher order allocations. This option
-	  will also use IRQ stacks to compensate for the reduced stackspace.
+	  If you say Y here, this will redefine the value of THREAD_SIZE
+	  from 8K to 4K and subsequently use a 4K kernel stack for each
+	  process/thread.  This facilitates running more threads on a
+	  system and also reduces the pressure on the VM subsystem for
+	  higher-order allocations (that is, trying to find two consecutive
+	  4K pages rather than just one for each per-process kernel stack).
+
+	  To compensate for the smaller per-process stack, interrupts will
+	  now be given their own 4K per-cpu stacks.  For more discussion,
+	  see http://lwn.net/Articles/150580/.  Also, see the implementation
+	  in the source file arch/x86/kernel/irq_32.c.

 config X86_FIND_SMP_CONFIG
 	def_bool y

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
