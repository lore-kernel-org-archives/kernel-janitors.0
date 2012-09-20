From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 20 Sep 2012 00:16:08 +0000
Subject: [kvm:queue 41/42] arch/s390/kvm/interrupt.c:428:12: warning: ignoring return value of 'vcpu_load', d
Message-Id: <20120920001608.GB9337@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org

Hi Michael,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   879238fecc051d95037ae76332916209a7770709
commit: 9fc77441e5e1bf80b794cc546d2243ee9f4afb75 [41/42] KVM: make processes waiting on vcpu mutex killable
config: s390-defconfig

All error/warnings:

arch/s390/kvm/interrupt.c: In function 'kvm_s390_handle_wait':
arch/s390/kvm/interrupt.c:428:12: warning: ignoring return value of 'vcpu_load', declared with attribute warn_unused_result [-Wunused-result]

vim +428 arch/s390/kvm/interrupt.c
   418		add_wait_queue(&vcpu->arch.local_int.wq, &wait);
   419		while (list_empty(&vcpu->arch.local_int.list) &&
   420			list_empty(&vcpu->arch.local_int.float_int->list) &&
   421			(!vcpu->arch.local_int.timer_due) &&
   422			!signal_pending(current)) {
   423			set_current_state(TASK_INTERRUPTIBLE);
   424			spin_unlock_bh(&vcpu->arch.local_int.lock);
   425			spin_unlock(&vcpu->arch.local_int.float_int->lock);
   426			vcpu_put(vcpu);
   427			schedule();
 > 428			vcpu_load(vcpu);
   429			spin_lock(&vcpu->arch.local_int.float_int->lock);
   430			spin_lock_bh(&vcpu->arch.local_int.lock);
   431		}
   432		__unset_cpu_idle(vcpu);
   433		__set_current_state(TASK_RUNNING);
   434		remove_wait_queue(&vcpu->arch.local_int.wq, &wait);
   435		spin_unlock_bh(&vcpu->arch.local_int.lock);
   436		spin_unlock(&vcpu->arch.local_int.float_int->lock);
   437		hrtimer_try_to_cancel(&vcpu->arch.ckc_timer);
   438		return 0;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
