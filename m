From: walter harms <wharms@bfs.de>
Date: Thu, 20 Feb 2014 13:18:21 +0000
Subject: Re: [patch RFC] kvm, cpuid: silence a buffer overflow warning
Message-Id: <5306009D.8040205@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140220123419.GA10110@elgon.mountain> <5305FE1E.6060902@redhat.com>
In-Reply-To: <5305FE1E.6060902@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Gleb Natapov <gleb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 20.02.2014 14:07, schrieb Paolo Bonzini:
> Il 20/02/2014 13:34, Dan Carpenter ha scritto:
>> This seems like a harmless off by one overflow if "i" is the last
>> element in the vcpu->arch.cpuid_entries[] array.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> Not tested.  I always wonder if it's worth fixing these or if it's worth
>> reporting them?  Either of those seem like a lot of work for something
>> harmless.
> 
> Could it oops if cpuid_nent is INT_MAX?  If so, it's not entirely harmless.
> In this case I'd rather take the occasion to cleanup the code like this
> (compile-tested):
> 
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index 9fed5bedaad6..2fd6e7169936 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -656,18 +656,19 @@ out:
>  static int move_to_next_stateful_cpuid_entry(struct kvm_vcpu *vcpu, int i)
>  {
>  	struct kvm_cpuid_entry2 *e = &vcpu->arch.cpuid_entries[i];
> -	int j, nent = vcpu->arch.cpuid_nent;
> +	struct kvm_cpuid_entry2 *ej;
> +	int j = i, nent = vcpu->arch.cpuid_nent;
>  
>  	e->flags &= ~KVM_CPUID_FLAG_STATE_READ_NEXT;
> +
>  	/* when no next entry is found, the current entry[i] is reselected */
> -	for (j = i + 1; ; j = (j + 1) % nent) {
> -		struct kvm_cpuid_entry2 *ej = &vcpu->arch.cpuid_entries[j];
> -		if (ej->function = e->function) {
> -			ej->flags |= KVM_CPUID_FLAG_STATE_READ_NEXT;
> -			return j;
> -		}
> -	}
> -	return 0; /* silence gcc, even though control never reaches here */
> +	do {
> +		j = (j + 1) % nent;
> +		ej = &vcpu->arch.cpuid_entries[j];
> +	} while (ej->function != e->function);
> +
> +	ej->flags |= KVM_CPUID_FLAG_STATE_READ_NEXT;
> +	return j;
>  }
>  
>  /* find an entry with matching function, matching index (if needed), and that
> 
> What do you think?
> 

Is there any guaranty that this will not loop forever ?

an if (i=j) return 0; would be on the save side. (I guess that
these was the idea behind the for).

re,
 wh

> Paolo
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
