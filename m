From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 13:12:57 +0000
Subject: [calxeda:ubuntu-quantal 79/299] arch/x86/kvm/vmx.c:7331:5: error: 'enable_ept_ad_bits' undeclared
Message-Id: <20120929131257.GA13002@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Tim,

FYI, kernel build failed on

tree:   git://sources.calxeda.com/kernel/linux.git ubuntu-quantal
head:   c07f1571f9b6e609109d50bd6ba2b2547e873614
commit: daac8caf6005a28d709a2a6fa03a48587a35801b [79/299] KVM: VMX: Use EPT Access bit in response to memory notifiers
config: x86_64-allmodconfig

All error/warnings:

arch/x86/kvm/vmx.c: In function 'vmx_init':
arch/x86/kvm/vmx.c:7331:5: error: 'enable_ept_ad_bits' undeclared (first use in this function)
arch/x86/kvm/vmx.c:7331:5: note: each undeclared identifier is reported only once for each function it appears in
arch/x86/kvm/vmx.c:7331:27: error: 'VMX_EPT_ACCESS_BIT' undeclared (first use in this function)
arch/x86/kvm/vmx.c:7332:27: error: 'VMX_EPT_DIRTY_BIT' undeclared (first use in this function)

vim +7331 arch/x86/kvm/vmx.c

5897297b arch/x86/kvm/vmx.c (Avi Kivity     2009-02-24  7325) 	vmx_disable_intercept_for_msr(MSR_IA32_SYSENTER_CS, false);
5897297b arch/x86/kvm/vmx.c (Avi Kivity     2009-02-24  7326) 	vmx_disable_intercept_for_msr(MSR_IA32_SYSENTER_ESP, false);
5897297b arch/x86/kvm/vmx.c (Avi Kivity     2009-02-24  7327) 	vmx_disable_intercept_for_msr(MSR_IA32_SYSENTER_EIP, false);
fdef3ad1 drivers/kvm/vmx.c  (He, Qing       2007-04-30  7328) 
089d034e arch/x86/kvm/vmx.c (Avi Kivity     2009-03-23  7329) 	if (enable_ept) {
daac8caf arch/x86/kvm/vmx.c (Xudong Hao     2012-05-22  7330) 		kvm_mmu_set_mask_ptes(0ull,
daac8caf arch/x86/kvm/vmx.c (Xudong Hao     2012-05-22 @7331) 			(enable_ept_ad_bits) ? VMX_EPT_ACCESS_BIT : 0ull,
daac8caf arch/x86/kvm/vmx.c (Xudong Hao     2012-05-22  7332) 			(enable_ept_ad_bits) ? VMX_EPT_DIRTY_BIT : 0ull,
daac8caf arch/x86/kvm/vmx.c (Xudong Hao     2012-05-22  7333) 			0ull, VMX_EPT_EXECUTABLE_MASK);
ce88decf arch/x86/kvm/vmx.c (Xiao Guangrong 2011-07-12  7334) 		ept_set_mmio_spte_mask();

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
