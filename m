From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 May 2017 15:23:44 +0000
Subject: Re: [PATCH v2] kvm: nVMX: off by one in vmx_write_pml_buffer()
Message-Id: <25ace9d8-61c1-e123-ff36-afa217bb6589@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <jpgr2zw4g9f.fsf@linux.bootlegged.copy>
 <20170510204302.ilb7bs3pbr6h7d7u@mwanda>
 <06746553-466d-101f-1bfc-16dc15ec9487@redhat.com>
 <jpga86j1ops.fsf@linux.bootlegged.copy>
In-Reply-To: <jpga86j1ops.fsf@linux.bootlegged.copy>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bandan Das <bsd@redhat.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org



On 11/05/2017 15:56, Bandan Das wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 10/05/2017 22:43, Dan Carpenter wrote:
>>> There are PML_ENTITY_NUM elements in the pml_address[] array so the >
>>> should be >= or we write beyond the end of the array when we do:
>>>
>>> 	pml_address[vmcs12->guest_pml_index--] = gpa;
> 
> Actually, we can never write beyond the end when we do
> pml_address[vmcs12->guest_pml_index--] = gpa (which happens in the
> host hypervisor btw). I think this should be changed.

If vmcs12->guest_pml_index is 512 it will write beyond the end without
Dan's patch.

>>> This causes a static checker warning but the runtime impact is minimal.
>>> The ->guest_pml_index variable can only be set to PML_ENTITY_NUM by a
>>> buggy hypervisor.
>>
>> The v1 commit message is better actually.  You can always replace
>> "buggy" with "malicious".
> 
> I agree, they are interchangeable but what's the worst that can happen ?
> L1 killing itself ?

L0 writing 8 bytes in kernel memory outside the bounds of L1's memory.

Paolo
