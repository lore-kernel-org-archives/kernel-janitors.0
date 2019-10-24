From: Steven Price <steven.price@arm.com>
Date: Thu, 24 Oct 2019 13:31:11 +0000
Subject: [PATCH v2] KVM: arm64: Select TASK_DELAY_ACCT+TASKSTATS rather than SCHEDSTATS
Message-Id: <20191024133111.27758-1-steven.price@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3abfc893613caf529b0f6a933e74068d@www.loen.fr>
In-Reply-To: <3abfc893613caf529b0f6a933e74068d@www.loen.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>, linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>, will@kernel.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org

SCHEDSTATS requires DEBUG_KERNEL (and PROC_FS) and therefore isn't a
good choice for enabling the scheduling statistics required for stolen
time.

Instead match the x86 configuration and select TASK_DELAY_ACCT and
TASKSTATS. This adds the dependencies of NET && MULTIUSER for arm64 KVM.

Suggested-by: Marc Zyngier <maz@kernel.org>
Fixes: 8564d6372a7d ("KVM: arm64: Support stolen time reporting via shared structure")
Signed-off-by: Steven Price <steven.price@arm.com>
---

Let's try again! Somehow I'd got it into my head that TASK_DELAY_ACCT
selected TASKSTATS not depended on. Even though I'd managed to get it
right in the comment!

 arch/arm64/kvm/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index d8b88e40d223..a475c68cbfec 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -21,6 +21,8 @@ if VIRTUALIZATION
 config KVM
 	bool "Kernel-based Virtual Machine (KVM) support"
 	depends on OF
+	# for TASKSTATS/TASK_DELAY_ACCT:
+	depends on NET && MULTIUSER
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
@@ -39,7 +41,8 @@ config KVM
 	select IRQ_BYPASS_MANAGER
 	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
-	select SCHEDSTATS
+	select TASKSTATS
+	select TASK_DELAY_ACCT
 	---help---
 	  Support hosting virtualized guest machines.
 	  We don't support KVM with 16K page tables yet, due to the multiple
-- 
2.20.1
