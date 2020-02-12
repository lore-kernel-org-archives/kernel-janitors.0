From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 12 Feb 2020 12:32:06 +0000
Subject: Re: [PATCH][next] KVM: x86: remove redundant WARN_ON check of an unsigned less than zero
Message-Id: <21975038-ae1a-50a1-7fa0-38a1445abe8d@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200207231813.786224-1-colin.king@canonical.com>
 <20200208004722.GB15581@linux.intel.com>
In-Reply-To: <20200208004722.GB15581@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Christopherson <sean.j.christopherson@intel.com>, Colin King <colin.king@canonical.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/02/20 01:47, Sean Christopherson wrote:
> On Fri, Feb 07, 2020 at 11:18:13PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The check cpu->hv_clock.system_time < 0 is redundant since system_time
>> is a u64 and hence can never be less than zero. Remove it.
>>
>> Addresses-Coverity: ("Macro compares unsigned to 0")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  arch/x86/kvm/x86.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index fbabb2f06273..d4967ac47e68 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -2448,7 +2448,6 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
>>  	vcpu->hv_clock.tsc_timestamp = tsc_timestamp;
>>  	vcpu->hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
>>  	vcpu->last_guest_tsc = tsc_timestamp;
>> -	WARN_ON(vcpu->hv_clock.system_time < 0);
> 
> Don't know this code well, but @kernel_ns and @v->kvm->arch.kvmclock_offset
> are both s64, so maybe this was intended and/or desirable?
> 
> 	WARN_ON((s64)vcpu->hv_clock.system_time < 0);

Yes, that's related to the bugfix where kvmclock would get negative.  I
queued the patch with the (s64) cast added.  Thanks to both of you!

Paolo
