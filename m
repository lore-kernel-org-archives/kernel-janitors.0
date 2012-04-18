From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 18 Apr 2012 14:34:06 +0000
Subject: Patches that add sparse annotations
Message-Id: <1334759646-16415-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello all,

I just wanted to get your opinion on if maintainers will find the
patch bellow (and other like it) to be annoying or somewhat useful?

In the following lwn article Linus is saying that if you intend to
grab a lock in one function and release it in another, you need to
inform sparse of this by adding annotations to the functions.

http://lwn.net/Articles/109066/

The patch silences the following sparse warnings:
arch/x86/kernel/apic/io_apic.c:1115:6: warning: 
context imbalance in 'lock_vector_lock' - wrong count at exit
arch/x86/kernel/apic/io_apic.c:1123:6: warning: 
context imbalance in 'unlock_vector_lock' - unexpected unlock

Best regards,
Emil Goode
---
 arch/x86/kernel/apic/io_apic.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index c348c57..1ab46b1 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -1112,6 +1112,7 @@ int IO_APIC_get_PCI_irq_vector(int bus, int slot, int pin,
 }
 EXPORT_SYMBOL(IO_APIC_get_PCI_irq_vector);
 
+__acquires(vector_lock)
 void lock_vector_lock(void)
 {
 	/* Used to the online set of cpus does not change
@@ -1120,6 +1121,7 @@ void lock_vector_lock(void)
 	raw_spin_lock(&vector_lock);
 }
 
+__releases(vector_lock)
 void unlock_vector_lock(void)
 {
 	raw_spin_unlock(&vector_lock);
-- 
1.7.9.5

