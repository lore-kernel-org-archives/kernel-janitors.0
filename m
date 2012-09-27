From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Thu, 27 Sep 2012 15:02:03 +0000
Subject: Re: [kvm:queue 41/42] arch/s390/kvm/interrupt.c:428:12: warning: ignoring return value of 'vcpu_load
Message-Id: <50646A6B.4040207@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120920001608.GB9337@localhost> <20120920052230.GA5721@redhat.com>
In-Reply-To: <20120920052230.GA5721@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, Avi Kivity <avi@redhat.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

On 20/09/12 07:22, Michael S. Tsirkin wrote:
> On Thu, Sep 20, 2012 at 08:16:08AM +0800, Fengguang Wu wrote:
>> Hi Michael,
>>
>> FYI, there are new compile warnings show up in
>>
>> tree:   git://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
>> head:   879238fecc051d95037ae76332916209a7770709
>> commit: 9fc77441e5e1bf80b794cc546d2243ee9f4afb75 [41/42] KVM: make processes waiting on vcpu mutex killable
>> config: s390-defconfig
>>
>> All error/warnings:
>>
>> arch/s390/kvm/interrupt.c: In function 'kvm_s390_handle_wait':
>> arch/s390/kvm/interrupt.c:428:12: warning: ignoring return value of 'vcpu_load', declared with attribute warn_unused_result [-Wunused-result]
>>
>> vim +428 arch/s390/kvm/interrupt.c
>>    418		add_wait_queue(&vcpu->arch.local_int.wq, &wait);
>>    419		while (list_empty(&vcpu->arch.local_int.list) &&
>>    420			list_empty(&vcpu->arch.local_int.float_int->list) &&
>>    421			(!vcpu->arch.local_int.timer_due) &&
>>    422			!signal_pending(current)) {
>>    423			set_current_state(TASK_INTERRUPTIBLE);
>>    424			spin_unlock_bh(&vcpu->arch.local_int.lock);
>>    425			spin_unlock(&vcpu->arch.local_int.float_int->lock);
>>    426			vcpu_put(vcpu);
>>    427			schedule();
>>  > 428			vcpu_load(vcpu);
>>    429			spin_lock(&vcpu->arch.local_int.float_int->lock);
>>    430			spin_lock_bh(&vcpu->arch.local_int.lock);

IIRC schedule will do vcpu put/load anyway via the preempt notifiers. So the right fix
is probably to just remove the vcpu_put/load around that schedule.
Will double check and send a patch.


