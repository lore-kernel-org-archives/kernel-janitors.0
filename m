From: David Hildenbrand <david@redhat.com>
Date: Tue, 26 Mar 2019 08:10:00 +0000
Subject: Re: [PATCH] kvm: vmx: Silence a shift wrap warning
Message-Id: <e5e15df1-2d95-9b39-5496-2dfcc24df93d@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325090448.GB16023@kadam>
In-Reply-To: <20190325090448.GB16023@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 26.03.19 08:07, Dan Carpenter wrote:
> On Mon, Mar 25, 2019 at 10:29:40AM +0100, David Hildenbrand wrote:
>> On 25.03.19 10:04, Dan Carpenter wrote:
>>> This code generates a Smatch warning:
>>>
>>> arch/x86/kvm/vmx/nested.c:4828 handle_vmfunc() warn: should '(1 << function)' be a 64 bit type?
>>>
>>> The warning is generated because "vmcs12->vm_function_control" is a u64
>>> but the shift can only test the lower 32 bits.  This doesn't cause a
>>> problem in the current code because we only use BIT(0).  This patch just
>>> silences the static checker warning.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>>  arch/x86/kvm/vmx/nested.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
>>> index f24a2c225070..1f4398246bd9 100644
>>> --- a/arch/x86/kvm/vmx/nested.c
>>> +++ b/arch/x86/kvm/vmx/nested.c
>>> @@ -4825,7 +4825,7 @@ static int handle_vmfunc(struct kvm_vcpu *vcpu)
>>>  	}
>>>  
>>>  	vmcs12 = get_vmcs12(vcpu);
>>> -	if ((vmcs12->vm_function_control & (1 << function)) = 0)
>>> +	if ((vmcs12->vm_function_control & (1ULL << function)) = 0)
>>
>> I guess one set of parentheses could be dropped here, while touching the
>> line.
> 
> The problem is bitwise AND has low precedence so the parenthesis are
> either required or they improve readability.  You could write it like
> this:
> 
> 	if ((vmcs12->vm_function_control & 1ULL << function) = 0)
> 
> but no one does.

Yes, you're right, my intuition was wrong this time :)

Cheers!

> 
>>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>
> 
> Thanks!
> 
> regards,
> dan carpenter
> 


-- 

Thanks,

David / dhildenb
