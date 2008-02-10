From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 10 Feb 2008 19:22:08 +0000
Subject: removing arrays of "SPIN_LOCK_UNLOCKED"
Message-Id: <alpine.LFD.1.00.0802101418510.14421@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  given that explicit usage of SPIN_LOCK_UNLOCKED is deprecated, i
just want to clarify that getting rid of the few remaining
declarations of arrays of those would be represented by the general
patch:

==diff --git a/arch/cris/arch-v32/kernel/smp.c b/arch/cris/arch-v32/kernel/smp.c
index 77e655f..f5aa705 100644
--- a/arch/cris/arch-v32/kernel/smp.c
+++ b/arch/cris/arch-v32/kernel/smp.c
@@ -24,7 +24,7 @@
 #define FLUSH_ALL (void*)0xffffffff

 /* Vector of locks used for various atomic operations */
-spinlock_t cris_atomic_locks[] = { [0 ... LOCK_COUNT - 1] = SPIN_LOCK_UNLOCKED};
+raw_spinlock_t cris_atomic_locks[] = { [0 ... LOCK_COUNT - 1] = __RAW_SPIN_LOCK_UNLOCKED};

 /* CPU masks */
 cpumask_t cpu_online_map = CPU_MASK_NONE;
==
  that is, you obviously can't use the preferred DEFINE_SPINLOCK since
you have an array, so the only other option is to use
__RAW_SPIN_LOCK_UNLOCKED, is that correct?

  there's only a few instances of that left and i can easily submit
patches to take care of that.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
====================================
