From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 19 Jan 2017 10:27:52 +0000
Subject: Re: [PATCH v2] MIPS: KVM: Return directly after a failed copy_from_user() in kvm_arch_vcpu_ioctl()
Message-Id: <a1af7ad2-4f3c-36c8-37e8-940e96810cd2@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87aac8b8-4f30-2edd-4688-42d32d815cd1@users.sourceforge.net>
 <88b008c5-552b-7314-94d8-02214f38a456@redhat.com>
 <7a6b5858-9137-9d20-78fe-6b466081920f@users.sourceforge.net>
In-Reply-To: <7a6b5858-9137-9d20-78fe-6b466081920f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, kvm@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 19/01/2017 11:20, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 19 Jan 2017 11:10:26 +0100
> 
> * Return directly after a call of the function "copy_from_user" failed
>   in a case block.
> 
> * Delete the jump label "out" which became unnecessary with
>   this refactoring.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> 
> V2:
> A label was also removed at the end.
> 
>  arch/mips/kvm/mips.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 06a60b19acfb..3534a0b9efed 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1152,10 +1152,8 @@ long kvm_arch_vcpu_ioctl(struct file *filp, unsigned int ioctl,
>  		{
>  			struct kvm_mips_interrupt irq;
>  
> -			r = -EFAULT;
>  			if (copy_from_user(&irq, argp, sizeof(irq)))
> -				goto out;
> -
> +				return -EFAULT;
>  			kvm_debug("[%d] %s: irq: %d\n", vcpu->vcpu_id, __func__,
>  				  irq.irq);
>  
> @@ -1165,17 +1163,14 @@ long kvm_arch_vcpu_ioctl(struct file *filp, unsigned int ioctl,
>  	case KVM_ENABLE_CAP: {
>  		struct kvm_enable_cap cap;
>  
> -		r = -EFAULT;
>  		if (copy_from_user(&cap, argp, sizeof(cap)))
> -			goto out;
> +			return -EFAULT;
>  		r = kvm_vcpu_ioctl_enable_cap(vcpu, &cap);
>  		break;
>  	}
>  	default:
>  		r = -ENOIOCTLCMD;
>  	}
> -
> -out:
>  	return r;
>  }
>  
> 

Removing the label makes the patch worthwhile.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
