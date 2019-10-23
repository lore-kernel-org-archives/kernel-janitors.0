From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 23 Oct 2019 06:18:31 +0000
Subject: [PATCH -next] KVM: arm/arm64: Remove duplicated include from arm.c
Message-Id: <20191023061831.196298-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, Julien
 Thierry <julien.thierry.kdev@gmail.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 virt/kvm/arm/arm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
index c11d6613f4ee..db508786ad6b 100644
--- a/virt/kvm/arm/arm.c
+++ b/virt/kvm/arm/arm.c
@@ -41,8 +41,6 @@
 #include <asm/sections.h>
 
 #include <kvm/arm_hypercalls.h>
-#include <kvm/arm_pmu.h>
-#include <kvm/arm_psci.h>
 
 #ifdef REQUIRES_VIRT
 __asm__(".arch_extension	virt");
