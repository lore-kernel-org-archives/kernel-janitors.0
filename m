From: maowenan <maowenan@huawei.com>
Date: Tue, 19 Nov 2019 12:42:36 +0000
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
Message-Id: <b164198f-2418-5f24-3f2f-cf8027af14b1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119030640.25097-1-maowenan@huawei.com>
 <87o8x8gjr5.fsf@vitty.brq.redhat.com>
In-Reply-To: <87o8x8gjr5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vitaly Kuznetsov <vkuznets@redhat.com>, pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



在 2019/11/19 19:58, Vitaly Kuznetsov 写道:
> Mao Wenan <maowenan@huawei.com> writes:
> 
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> arch/x86/kvm/x86.c: In function kvm_make_scan_ioapic_request_mask:
>> arch/x86/kvm/x86.c:7911:7: warning: variable called set but not
>> used [-Wunused-but-set-variable]
>>
>> It is not used since commit 7ee30bc132c6 ("KVM: x86: deliver KVM
>> IOAPIC scan request to target vCPUs")
> 
> Better expressed as 
> 
> Fixes: 7ee30bc132c6 ("KVM: x86: deliver KVM IOAPIC scan request to target vCPUs")

This is just a cleanup, so Fixes tag is no need.
> 
>>
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  arch/x86/kvm/x86.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index 0d0a682..870f0bc 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -7908,12 +7908,11 @@ void kvm_make_scan_ioapic_request_mask(struct kvm *kvm,
>>  				       unsigned long *vcpu_bitmap)
>>  {
>>  	cpumask_var_t cpus;
>> -	bool called;
>>  
>>  	zalloc_cpumask_var(&cpus, GFP_ATOMIC);
>>  
>> -	called = kvm_make_vcpus_request_mask(kvm, KVM_REQ_SCAN_IOAPIC,
>> -					     vcpu_bitmap, cpus);
>> +	kvm_make_vcpus_request_mask(kvm, KVM_REQ_SCAN_IOAPIC,
>> +				    vcpu_bitmap, cpus);
> 
> IMHO as kvm_make_vcpus_request_mask() returns value it would probably
> make sense to explicitly show that we're not interested in the result,
> 
> (void)kvm_make_vcpus_request_mask()

thanks, but I think is no need to add (void) before kvm_make_vcpus_request_mask()
because we are not interested in it's return value.

> 
>>  
>>  	free_cpumask_var(cpus);
>>  }
> 
