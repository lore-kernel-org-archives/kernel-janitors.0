From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 19 Nov 2019 03:06:40 +0000
Subject: [PATCH -next] KVM: x86: remove set but not used variable 'called'
Message-Id: <20191119030640.25097-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com, vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

arch/x86/kvm/x86.c: In function kvm_make_scan_ioapic_request_mask:
arch/x86/kvm/x86.c:7911:7: warning: variable called set but not
used [-Wunused-but-set-variable]

It is not used since commit 7ee30bc132c6 ("KVM: x86: deliver KVM
IOAPIC scan request to target vCPUs")

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 arch/x86/kvm/x86.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0d0a682..870f0bc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7908,12 +7908,11 @@ void kvm_make_scan_ioapic_request_mask(struct kvm *kvm,
 				       unsigned long *vcpu_bitmap)
 {
 	cpumask_var_t cpus;
-	bool called;
 
 	zalloc_cpumask_var(&cpus, GFP_ATOMIC);
 
-	called = kvm_make_vcpus_request_mask(kvm, KVM_REQ_SCAN_IOAPIC,
-					     vcpu_bitmap, cpus);
+	kvm_make_vcpus_request_mask(kvm, KVM_REQ_SCAN_IOAPIC,
+				    vcpu_bitmap, cpus);
 
 	free_cpumask_var(cpus);
 }
-- 
2.7.4
