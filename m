From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 15 Apr 2020 14:56:46 +0000
Subject: Re: [PATCH] KVM: remove redundant assignment to variable r
Message-Id: <6d66cb24-b517-1bc3-15c3-9b302215febf@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410113526.13822-1-colin.king@canonical.com>
In-Reply-To: <20200410113526.13822-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/04/20 13:35, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable r is being assigned  with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  virt/kvm/kvm_main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 74bdb7bf3295..03571f6acaa8 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3160,7 +3160,6 @@ static long kvm_vcpu_ioctl(struct file *filp,
>  	case KVM_SET_REGS: {
>  		struct kvm_regs *kvm_regs;
>  
> -		r = -ENOMEM;
>  		kvm_regs = memdup_user(argp, sizeof(*kvm_regs));
>  		if (IS_ERR(kvm_regs)) {
>  			r = PTR_ERR(kvm_regs);
> 

Queued, thanks.

Paolo
