From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 20 Sep 2012 05:22:30 +0000
Subject: Re: [kvm:queue 41/42] arch/s390/kvm/interrupt.c:428:12: warning: ignoring return value of 'vcpu_load
Message-Id: <20120920052230.GA5721@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120920001608.GB9337@localhost>
In-Reply-To: <20120920001608.GB9337@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org

On Thu, Sep 20, 2012 at 08:16:08AM +0800, Fengguang Wu wrote:
> Hi Michael,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   879238fecc051d95037ae76332916209a7770709
> commit: 9fc77441e5e1bf80b794cc546d2243ee9f4afb75 [41/42] KVM: make processes waiting on vcpu mutex killable
> config: s390-defconfig
> 
> All error/warnings:
> 
> arch/s390/kvm/interrupt.c: In function 'kvm_s390_handle_wait':
> arch/s390/kvm/interrupt.c:428:12: warning: ignoring return value of 'vcpu_load', declared with attribute warn_unused_result [-Wunused-result]
> 
> vim +428 arch/s390/kvm/interrupt.c
>    418		add_wait_queue(&vcpu->arch.local_int.wq, &wait);
>    419		while (list_empty(&vcpu->arch.local_int.list) &&
>    420			list_empty(&vcpu->arch.local_int.float_int->list) &&
>    421			(!vcpu->arch.local_int.timer_due) &&
>    422			!signal_pending(current)) {
>    423			set_current_state(TASK_INTERRUPTIBLE);
>    424			spin_unlock_bh(&vcpu->arch.local_int.lock);
>    425			spin_unlock(&vcpu->arch.local_int.float_int->lock);
>    426			vcpu_put(vcpu);
>    427			schedule();
>  > 428			vcpu_load(vcpu);
>    429			spin_lock(&vcpu->arch.local_int.float_int->lock);
>    430			spin_lock_bh(&vcpu->arch.local_int.lock);
>    431		}
>    432		__unset_cpu_idle(vcpu);
>    433		__set_current_state(TASK_RUNNING);
>    434		remove_wait_queue(&vcpu->arch.local_int.wq, &wait);
>    435		spin_unlock_bh(&vcpu->arch.local_int.lock);
>    436		spin_unlock(&vcpu->arch.local_int.float_int->lock);
>    437		hrtimer_try_to_cancel(&vcpu->arch.ckc_timer);
>    438		return 0;


Thanks for the report.  This is because vcpu_load can now fail if task
is being killed.  I'm guessing the following is the right fix but have
no way to tell. Warning: completely untested.

--->

kvm/arm: handle vcpu_load failure gracefully

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

-- 

diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index b7bc1aa..5aedf25 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -362,6 +362,7 @@ int kvm_s390_handle_wait(struct kvm_vcpu *vcpu)
 {
 	u64 now, sltime;
 	DECLARE_WAITQUEUE(wait, current);
+	int ret;
 
 	vcpu->stat.exit_wait_state++;
 	if (kvm_cpu_has_interrupt(vcpu))
@@ -407,7 +408,9 @@ no_timer:
 		spin_unlock(&vcpu->arch.local_int.float_int->lock);
 		vcpu_put(vcpu);
 		schedule();
-		vcpu_load(vcpu);
+		ret = vcpu_load(vcpu);
+		if (ret)
+			goto cancel;
 		spin_lock(&vcpu->arch.local_int.float_int->lock);
 		spin_lock_bh(&vcpu->arch.local_int.lock);
 	}
@@ -416,6 +419,7 @@ no_timer:
 	remove_wait_queue(&vcpu->arch.local_int.wq, &wait);
 	spin_unlock_bh(&vcpu->arch.local_int.lock);
 	spin_unlock(&vcpu->arch.local_int.float_int->lock);
+cancel:
 	hrtimer_try_to_cancel(&vcpu->arch.ckc_timer);
 	return 0;
 }

> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
