From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 May 2017 07:52:16 +0000
Subject: Re: [PATCH v2] kvm: nVMX: off by one in vmx_write_pml_buffer()
Message-Id: <082570b9-47e3-f259-4ebd-21c0f161b6b6@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <jpgr2zw4g9f.fsf@linux.bootlegged.copy>
 <20170510204302.ilb7bs3pbr6h7d7u@mwanda>
 <06746553-466d-101f-1bfc-16dc15ec9487@redhat.com>
 <20170511074217.dvr5f4qbgoklozr6@mwanda>
In-Reply-To: <20170511074217.dvr5f4qbgoklozr6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bandan Das <bsd@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org



On 11/05/2017 09:42, Dan Carpenter wrote:
> On Thu, May 11, 2017 at 09:31:17AM +0200, Paolo Bonzini wrote:
>>
>>
>> On 10/05/2017 22:43, Dan Carpenter wrote:
>>> There are PML_ENTITY_NUM elements in the pml_address[] array so the >
>>> should be >= or we write beyond the end of the array when we do:
>>>
>>> 	pml_address[vmcs12->guest_pml_index--] = gpa;
>>>
>>> This causes a static checker warning but the runtime impact is minimal.
>>> The ->guest_pml_index variable can only be set to PML_ENTITY_NUM by a
>>> buggy hypervisor.
>>
>> The v1 commit message is better actually.  You can always replace
>> "buggy" with "malicious".
> 
> Can't the hypervisor already basically do what it wants?

Here you have a nested hypervisor, that can force the host hypervisor to
do a kmap and write at offset 4096 inside (well, actually outside...)
that kmap.

Paolo
