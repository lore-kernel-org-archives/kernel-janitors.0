From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Mar 2019 09:04:48 +0000
Subject: [PATCH] kvm: vmx: Silence a shift wrap warning
Message-Id: <20190325090448.GB16023@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This code generates a Smatch warning:

arch/x86/kvm/vmx/nested.c:4828 handle_vmfunc() warn: should '(1 << function)' be a 64 bit type?

The warning is generated because "vmcs12->vm_function_control" is a u64
but the shift can only test the lower 32 bits.  This doesn't cause a
problem in the current code because we only use BIT(0).  This patch just
silences the static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 arch/x86/kvm/vmx/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index f24a2c225070..1f4398246bd9 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -4825,7 +4825,7 @@ static int handle_vmfunc(struct kvm_vcpu *vcpu)
 	}
 
 	vmcs12 = get_vmcs12(vcpu);
-	if ((vmcs12->vm_function_control & (1 << function)) = 0)
+	if ((vmcs12->vm_function_control & (1ULL << function)) = 0)
 		goto fail;
 
 	switch (function) {
-- 
2.17.1
