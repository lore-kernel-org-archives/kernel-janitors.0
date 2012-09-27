From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Thu, 27 Sep 2012 15:29:45 +0000
Subject: [PATCH] s390/kvm: Fix vcpu_load handling in interrupt code
Message-Id: <1348759785-15394-1-git-send-email-borntraeger@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50646CE7.8020006@redhat.com>
In-Reply-To: <50646CE7.8020006@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcelo Tosatti <mtosatti@redhat.com>, Avi Kivity <avi@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Fengguang Wu <fengguang.wu@intel.com>, Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>

Recent changes (KVM: make processes waiting on vcpu mutex killable)
now requires to check the return value of vcpu_load. This triggered
a warning in s390 specific kvm code. Turns out that we can actually
remove the put/load, since schedule will do the right thing via
the preempt notifiers.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 arch/s390/kvm/interrupt.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index 7556231..ff1e2f8 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -423,9 +423,7 @@ no_timer:
 		set_current_state(TASK_INTERRUPTIBLE);
 		spin_unlock_bh(&vcpu->arch.local_int.lock);
 		spin_unlock(&vcpu->arch.local_int.float_int->lock);
-		vcpu_put(vcpu);
 		schedule();
-		vcpu_load(vcpu);
 		spin_lock(&vcpu->arch.local_int.float_int->lock);
 		spin_lock_bh(&vcpu->arch.local_int.lock);
 	}
-- 
1.7.0.1

