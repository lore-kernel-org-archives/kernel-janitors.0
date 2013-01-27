From: Emil Goode <emilgoode@gmail.com>
Date: Sun, 27 Jan 2013 16:40:00 +0000
Subject: [PATCH 1/3] x86: KVM: Fix warnings by returning bool
Message-Id: <1359304802-28240-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mtosatti@redhat.com, gleb@redhat.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, avi@redhat.com, mst@redhat.com, perex@perex.cz, tiwai@suse.de, crimsun@ubuntu.com, wfp5p@virginia.edu, peter.senna@gmail.com
Cc: x86@kernel.org, kvm@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The function pointer x2apic_available in struct hypervisor_x86 is
supposed to point to functions that return bool. This patch changes
the return type of the kvm_para_available function to bool.

Sparse warnings:

arch/x86/kernel/kvm.c:508:35: warning:
	incorrect type in initializer (different signedness)
	arch/x86/kernel/kvm.c:508:35:
	expected bool ( *x2apic_available )( ... )
	arch/x86/kernel/kvm.c:508:35:
	got int ( static inline [toplevel] *<noident> )( ... )

arch/x86/kernel/kvm.c:508:2: warning:
	initialization from incompatible pointer type [enabled by default]

arch/x86/kernel/kvm.c:508:2: warning:
	(near initialization for ‘x86_hyper_kvm.x2apic_available’)
	[enabled by default]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 arch/x86/include/asm/kvm_para.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_para.h
index 0be7039..695399f 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -85,13 +85,13 @@ static inline long kvm_hypercall4(unsigned int nr, unsigned long p1,
 	return ret;
 }
 
-static inline int kvm_para_available(void)
+static inline bool kvm_para_available(void)
 {
 	unsigned int eax, ebx, ecx, edx;
 	char signature[13];
 
 	if (boot_cpu_data.cpuid_level < 0)
-		return 0;	/* So we don't blow up on old processors */
+		return false;	/* So we don't blow up on old processors */
 
 	if (cpu_has_hypervisor) {
 		cpuid(KVM_CPUID_SIGNATURE, &eax, &ebx, &ecx, &edx);
@@ -101,10 +101,10 @@ static inline int kvm_para_available(void)
 		signature[12] = 0;
 
 		if (strcmp(signature, "KVMKVMKVM") = 0)
-			return 1;
+			return true;
 	}
 
-	return 0;
+	return false;
 }
 
 static inline unsigned int kvm_arch_para_features(void)
-- 
1.7.10.4

