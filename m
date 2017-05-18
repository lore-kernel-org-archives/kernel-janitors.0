From: Joerg Roedel <joro@8bytes.org>
Date: Thu, 18 May 2017 11:38:48 +0000
Subject: Re: [PATCH 1/2] KVM: Silence underflow warning in avic_get_physical_id_entry()
Message-Id: <20170518113848.GE1912@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170518073853.b3dkw2zibj7ayvwh@mwanda>
In-Reply-To: <20170518073853.b3dkw2zibj7ayvwh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 18, 2017 at 10:38:53AM +0300, Dan Carpenter wrote:
> Smatch complains that we check cap the upper bound of "index" but don't
> check for negatives.  It's a false positive because "index" is never
> negative.  But it's also simple enough to make it unsigned which makes
> the code easier to audit.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
> index c27ac6923a18..183ddb235fb4 100644
> --- a/arch/x86/kvm/svm.c
> +++ b/arch/x86/kvm/svm.c
> @@ -1272,7 +1272,8 @@ static void init_vmcb(struct vcpu_svm *svm)
>  
>  }
>  
> -static u64 *avic_get_physical_id_entry(struct kvm_vcpu *vcpu, int index)
> +static u64 *avic_get_physical_id_entry(struct kvm_vcpu *vcpu,
> +				       unsigned int index)

I would have used 'unsigned', just to annoy checkpatch. But I guess
this is ok too :)


	Joerg

