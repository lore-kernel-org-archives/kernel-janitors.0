From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 23 Oct 2019 03:22:54 +0000
Subject: [PATCH] KVM: arm64: Select SCHED_INFO before SCHEDSTATS
Message-Id: <20191023032254.159510-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maz@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com
Cc: Mao Wenan <maowenan@huawei.com>, kernel-janitors@vger.kernel.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

If KVM=y, it will select SCHEDSTATS, below erros can
be seen:
kernel/sched/stats.h: In function rq_sched_info_arrive:
kernel/sched/stats.h:12:20: error: struct sched_info
has no member named run_delay
   rq->rq_sched_info.run_delay += delta;
                    ^
kernel/sched/stats.h:13:20: error: struct sched_info
has no member named pcount
   rq->rq_sched_info.pcount++;
                    ^
kernel/sched/stats.h: In function rq_sched_info_dequeued:
kernel/sched/stats.h:31:20: error: struct sched_info has
no member named run_delay
   rq->rq_sched_info.run_delay += delta;

These are because CONFIG_SCHED_INFO is not set, This patch 
is to select SCHED_INFO before SCHEDSTATS.

Fixes: 8564d6372a7d ("KVM: arm64: Support stolen time reporting via shared structure")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 arch/arm64/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index d8b88e4..3c46eac 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -39,6 +39,7 @@ config KVM
 	select IRQ_BYPASS_MANAGER
 	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
+	select SCHED_INFO
 	select SCHEDSTATS
 	---help---
 	  Support hosting virtualized guest machines.
-- 
2.7.4
