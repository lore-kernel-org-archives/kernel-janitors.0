From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 18 Dec 2018 00:54:26 +0000
Subject: [PATCH -next] KVM: VMX: Remove duplicated include from vmx.c
Message-Id: <1545094909-85500-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/x86/kvm/vmx/vmx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index c90fffd..0a826c6 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -62,7 +62,6 @@
 #include "vmcs12.h"
 #include "vmx.h"
 #include "x86.h"
-#include "vmx.h"
 
 MODULE_AUTHOR("Qumranet");
 MODULE_LICENSE("GPL");
