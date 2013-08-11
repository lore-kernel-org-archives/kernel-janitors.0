From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 11 Aug 2013 18:01:04 +0000
Subject: build regressions 2013-08-11
Message-Id: <5207d160.ixWzirlyOGCNPXY/%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/x86/kernel/kvm.c:535:19: error: 'x86_cpu_to_apicid' undeclared (first use in this function)
arch/x86/include/uapi/asm/vmx.h:110:39: error: expected '}' before string constant
arch/x86/include/uapi/asm/vmx.h:112:2: error: expected '}' before '{' token
arch/x86/include/uapi/asm/vmx.h:110:39: error: expected '}' before string constant
arch/x86/include/uapi/asm/vmx.h:112:2: error: expected '}' before '{' token
arch/x86/include/uapi/asm/vmx.h:110:39: error: expected '}' before string constant
arch/x86/include/uapi/asm/vmx.h:112:2: error: expected '}' before '{' token

[sparse]
drivers/pci/ioapic.c:193:6: sparse: symbol 'acpi_pci_ioapic_add' was not declared. Should it be static?
drivers/pci/ioapic.c:205:6: sparse: symbol 'acpi_pci_ioapic_remove' was not declared. Should it be static?
./arch/x86/kvm/trace.h:190:1: sparse: Expected } at end of initializer
./arch/x86/kvm/trace.h:190:1: sparse: got "INVEPT"

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
