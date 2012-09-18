From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 18 Sep 2012 16:36:14 +0000
Subject: [PATCH] arch/x86: Remove unecessary semicolon
Message-Id: <1347986174-30287-7-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347986174-30287-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347986174-30287-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de
Cc: mingo@redhat.com, hpa@zytor.com, x86@kernel.org, avi@redhat.com, mtosatti@redhat.com, a.p.zijlstra@chello.nl, rusty@rustcorp.com.au, masami.hiramatsu.pt@hitachi.com, suresh.b.siddha@intel.com, joerg.roedel@amd.com, agordeev@redhat.com, yinghai@kernel.org, bhelgaas@google.com, liuj97@gmail.com, peter.senna@gmail.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

Found by http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 arch/x86/kernel/alternative.c  | 4 ++--
 arch/x86/kernel/apic/apic.c    | 2 +-
 arch/x86/kvm/vmx.c             | 2 +-
 arch/x86/pci/mmconfig-shared.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 357475a..ef5ccca 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -304,7 +304,7 @@ static void alternatives_smp_lock(const s32 *start, const s32 *end,
 		/* turn DS segment override prefix into lock prefix */
 		if (*ptr = 0x3e)
 			text_poke(ptr, ((unsigned char []){0xf0}), 1);
-	};
+	}
 	mutex_unlock(&text_mutex);
 }
 
@@ -322,7 +322,7 @@ static void alternatives_smp_unlock(const s32 *start, const s32 *end,
 		/* turn lock prefix into DS segment override prefix */
 		if (*ptr = 0xf0)
 			text_poke(ptr, ((unsigned char []){0x3E}), 1);
-	};
+	}
 	mutex_unlock(&text_mutex);
 }
 
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 24deb30..b17416e 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1934,7 +1934,7 @@ void smp_error_interrupt(struct pt_regs *regs)
 			apic_printk(APIC_DEBUG, KERN_CONT " : %s", error_interrupt_reason[i]);
 		i++;
 		v1 >>= 1;
-	};
+	}
 
 	apic_printk(APIC_DEBUG, KERN_CONT "\n");
 
diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
index d62b413..5f1c771 100644
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@ -4501,7 +4501,7 @@ static int handle_cr(struct kvm_vcpu *vcpu)
 				vcpu->run->exit_reason = KVM_EXIT_SET_TPR;
 				return 0;
 			}
-		};
+		}
 		break;
 	case 2: /* clts */
 		handle_clts(vcpu);
diff --git a/arch/x86/pci/mmconfig-shared.c b/arch/x86/pci/mmconfig-shared.c
index 937bcec..704b9ec 100644
--- a/arch/x86/pci/mmconfig-shared.c
+++ b/arch/x86/pci/mmconfig-shared.c
@@ -585,7 +585,7 @@ static int __init pci_parse_mcfg(struct acpi_table_header *header)
 	while (i >= sizeof(struct acpi_mcfg_allocation)) {
 		entries++;
 		i -= sizeof(struct acpi_mcfg_allocation);
-	};
+	}
 	if (entries = 0) {
 		pr_err(PREFIX "MMCONFIG has no entries\n");
 		return -ENODEV;
-- 
1.7.11.4

