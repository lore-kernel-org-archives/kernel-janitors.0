From: Brijesh Singh <brijesh.singh@amd.com>
Date: Mon, 21 May 2018 15:52:33 +0000
Subject: Re: [PATCH] KVM: X86: prevent integer overflows in KVM_MEMORY_ENCRYPT_REG_REGION
Message-Id: <f8e3af2e-08d2-bcb2-be09-c93f8b6d6bd6@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180519060135.GA4991@mwanda>
In-Reply-To: <20180519060135.GA4991@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Joerg Roedel <joro@8bytes.org>
Cc: brijesh.singh@amd.com, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,


On 05/19/2018 01:01 AM, Dan Carpenter wrote:
> This is a fix from reviewing the code, but it looks like it might be
> able to lead to an Oops.  It affects 32bit systems.
> 

Please note that SEV is not available on 32bit systems.


> The KVM_MEMORY_ENCRYPT_REG_REGION ioctl uses a u64 for range->addr and
> range->size but the high 32 bits would be truncated away on a 32 bit
> system.  This is harmless but it's also harmless to prevent it.
> 
> Then in sev_pin_memory() the "uaddr + ulen" calculation can wrap around.
> The wrap around can happen on 32 bit or 64 bit systems, but I was only
> able to figure out a problem for 32 bit systems.  We would pick a number
> which results in "npages" being zero.  The sev_pin_memory() would then
> return ZERO_SIZE_PTR without allocating anything.
> 
> I made it illegal to call sev_pin_memory() with "ulen" set to zero.
> Hopefully, that doesn't cause any problems.  


I think this should be fine.


I also changed the type of
> "first" and "last" to long, just for cosmetic reasons.  Otherwise on a
> 64 bit system you're saving "uaddr >> 12" in an int and it truncates the
> high 20 bits away.  The math works in the current code so far as I can
> see but it's just weird.
> 

This change looks good. thanks


> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Brijesh Singh <brijesh.singh@amd.com>


> ---
> Again, this is a static checker fix.  The most risky parts of this
> patch are blocking "ulen = 0" and changing the types of "first" and
> "last".  I felt like those changes made the math easier to understand
> 
> diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
> index 220e5a89465a..de21d5c5168b 100644
> --- a/arch/x86/kvm/svm.c
> +++ b/arch/x86/kvm/svm.c
> @@ -1762,7 +1762,10 @@ static struct page **sev_pin_memory(struct kvm *kvm, unsigned long uaddr,
>   	unsigned long npages, npinned, size;
>   	unsigned long locked, lock_limit;
>   	struct page **pages;
> -	int first, last;
> +	unsigned long first, last;
> +
> +	if (ulen = 0 || uaddr + ulen < uaddr)
> +		return NULL;
>   
>   	/* Calculate number of pages. */
>   	first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
> @@ -6925,6 +6928,9 @@ static int svm_register_enc_region(struct kvm *kvm,
>   	if (!sev_guest(kvm))
>   		return -ENOTTY;
>   
> +	if (range->addr > ULONG_MAX || range->size > ULONG_MAX)
> +		return -EINVAL;
> +
>   	region = kzalloc(sizeof(*region), GFP_KERNEL);
>   	if (!region)
>   		return -ENOMEM;
> 
