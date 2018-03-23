From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 23 Mar 2018 19:12:17 +0000
Subject: Re: [PATCH] kvm: x86: hyperv: delete dead code in kvm_hv_hypercall()
Message-Id: <2b856a6f-252f-1b0c-f26d-b55ef95360d0@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180317114827.GA4035@mwanda>
In-Reply-To: <20180317114827.GA4035@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 17/03/2018 12:48, Dan Carpenter wrote:
> "rep_done" is always zero so the "(((u64)rep_done & 0xfff) << 32)"
> expression is just zero.  We can remove the "res" temporary variable as
> well and just use "ret" directly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index 53bd1913b6fd..80c34c83f882 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -1266,8 +1266,8 @@ static u16 kvm_hvcall_signal_event(struct kvm_vcpu *vcpu, bool fast, u64 param)
>  
>  int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>  {
> -	u64 param, ingpa, outgpa, ret;
> -	uint16_t code, rep_idx, rep_cnt, res = HV_STATUS_SUCCESS, rep_done = 0;
> +	u64 param, ingpa, outgpa, ret = HV_STATUS_SUCCESS;
> +	uint16_t code, rep_idx, rep_cnt;
>  	bool fast, longmode;
>  
>  	/*
> @@ -1306,7 +1306,7 @@ int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>  
>  	/* Hypercall continuation is not supported yet */
>  	if (rep_cnt || rep_idx) {
> -		res = HV_STATUS_INVALID_HYPERCALL_CODE;
> +		ret = HV_STATUS_INVALID_HYPERCALL_CODE;
>  		goto set_result;
>  	}
>  
> @@ -1315,14 +1315,14 @@ int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>  		kvm_vcpu_on_spin(vcpu, true);
>  		break;
>  	case HVCALL_SIGNAL_EVENT:
> -		res = kvm_hvcall_signal_event(vcpu, fast, ingpa);
> -		if (res != HV_STATUS_INVALID_PORT_ID)
> +		ret = kvm_hvcall_signal_event(vcpu, fast, ingpa);
> +		if (ret != HV_STATUS_INVALID_PORT_ID)
>  			break;
>  		/* maybe userspace knows this conn_id: fall through */
>  	case HVCALL_POST_MESSAGE:
>  		/* don't bother userspace if it has no way to handle it */
>  		if (!vcpu_to_synic(vcpu)->active) {
> -			res = HV_STATUS_INVALID_HYPERCALL_CODE;
> +			ret = HV_STATUS_INVALID_HYPERCALL_CODE;
>  			break;
>  		}
>  		vcpu->run->exit_reason = KVM_EXIT_HYPERV;
> @@ -1334,12 +1334,11 @@ int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>  				kvm_hv_hypercall_complete_userspace;
>  		return 0;
>  	default:
> -		res = HV_STATUS_INVALID_HYPERCALL_CODE;
> +		ret = HV_STATUS_INVALID_HYPERCALL_CODE;
>  		break;
>  	}
>  
>  set_result:
> -	ret = res | (((u64)rep_done & 0xfff) << 32);
>  	kvm_hv_hypercall_set_result(vcpu, ret);
>  	return 1;
>  }
> 

Queued, thanks.

Paolo
