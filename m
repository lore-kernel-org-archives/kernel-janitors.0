From: "Hao, Xudong" <xudong.hao@intel.com>
Date: Mon, 08 Oct 2012 12:46:50 +0000
Subject: RE: [calxeda:ubuntu-quantal 79/299] arch/x86/kvm/vmx.c:7331:5: error: 'enable_ept_ad_bits' undeclare
Message-Id: <403610A45A2B5242BD291EDAE8B37D300FECC56F@SHSMSX102.ccr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi, Tim

Maybe you did not pull the commit before "Use EPT Access bit in response to memory notifiers " from linus tree to your tree.
The whole EPT A/D bit enabling on KVM include 5 patches, it's better to pull all of them if you want this feature.

commit 00763e41138267a307531397f9745835aecb8c7b
    KVM: x86: change PT_FIRST_AVAIL_BITS_SHIFT to avoid conflict with EPT Dirty bit

commit 3f6d8c8a478dd1ab2a4944b0d65474df06ecd882
    KVM: VMX: Use EPT Access bit in response to memory notifiers

commit b38f99347871d7fc49e6367395dce0d757f6ab8d
    KVM: VMX: Enable EPT A/D bits if supported by turning on relevant bit in EPTP

commit 83c3a3312235220476d3c207f67bd17be6e17ff9
    KVM: VMX: Add parameter to control A/D bits support, default is on

commit aaf07bc291c828189ae5221b370905a89bbb859d
    KVM: VMX: Add EPT A/D bits definitions

Thanks,
-Xudong


> -----Original Message-----
> From: Wu, Fengguang
> Sent: Saturday, September 29, 2012 9:13 PM
> To: Tim Gardner
> Cc: Hao, Xudong; kernel-janitors@vger.kernel.org; Shan, Haitao
> Subject: [calxeda:ubuntu-quantal 79/299] arch/x86/kvm/vmx.c:7331:5: error:
> 'enable_ept_ad_bits' undeclared
> 
> Hi Tim,
> 
> FYI, kernel build failed on
> 
> tree:   git://sources.calxeda.com/kernel/linux.git ubuntu-quantal
> head:   c07f1571f9b6e609109d50bd6ba2b2547e873614
> commit: daac8caf6005a28d709a2a6fa03a48587a35801b [79/299] KVM: VMX:
> Use EPT Access bit in response to memory notifiers
> config: x86_64-allmodconfig
> 
> All error/warnings:
> 
> arch/x86/kvm/vmx.c: In function 'vmx_init':
> arch/x86/kvm/vmx.c:7331:5: error: 'enable_ept_ad_bits' undeclared (first use
> in this function)
> arch/x86/kvm/vmx.c:7331:5: note: each undeclared identifier is reported only
> once for each function it appears in
> arch/x86/kvm/vmx.c:7331:27: error: 'VMX_EPT_ACCESS_BIT' undeclared (first
> use in this function)
> arch/x86/kvm/vmx.c:7332:27: error: 'VMX_EPT_DIRTY_BIT' undeclared (first
> use in this function)
> 
> vim +7331 arch/x86/kvm/vmx.c
> 
> 5897297b arch/x86/kvm/vmx.c (Avi Kivity     2009-02-24  7325)
> 	vmx_disable_intercept_for_msr(MSR_IA32_SYSENTER_CS, false);
> 5897297b arch/x86/kvm/vmx.c (Avi Kivity     2009-02-24  7326)
> 	vmx_disable_intercept_for_msr(MSR_IA32_SYSENTER_ESP, false);
> 5897297b arch/x86/kvm/vmx.c (Avi Kivity     2009-02-24  7327)
> 	vmx_disable_intercept_for_msr(MSR_IA32_SYSENTER_EIP, false);
> fdef3ad1 drivers/kvm/vmx.c  (He, Qing       2007-04-30  7328)
> 089d034e arch/x86/kvm/vmx.c (Avi Kivity     2009-03-23  7329) 	if
> (enable_ept) {
> daac8caf arch/x86/kvm/vmx.c (Xudong Hao     2012-05-22  7330)
> 	kvm_mmu_set_mask_ptes(0ull,
> daac8caf arch/x86/kvm/vmx.c (Xudong Hao     2012-05-22 @7331)
> 	(enable_ept_ad_bits) ? VMX_EPT_ACCESS_BIT : 0ull,
> daac8caf arch/x86/kvm/vmx.c (Xudong Hao     2012-05-22  7332)
> 	(enable_ept_ad_bits) ? VMX_EPT_DIRTY_BIT : 0ull,
> daac8caf arch/x86/kvm/vmx.c (Xudong Hao     2012-05-22  7333)
> 	0ull, VMX_EPT_EXECUTABLE_MASK);
> ce88decf arch/x86/kvm/vmx.c (Xiao Guangrong 2011-07-12  7334)
> 	ept_set_mmio_spte_mask();
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel
> Corporation
