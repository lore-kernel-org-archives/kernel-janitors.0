From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Apr 2015 09:57:22 +0000
Subject: Re: [PATCH] KVM: x86: drop unneeded null test
Message-Id: <553F5982.4010405@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430166934-30834-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430166934-30834-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Gleb Natapov <gleb@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>, zhanghy@sangfor.com, jasowang@redhat.com
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org



On 27/04/2015 22:35, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> If the null test is needed, the call to cancel_delayed_work_sync would have
> already crashed.  Normally, the destroy function should only be called
> if the init functoin has succeeded, in which case ioapic is not null.
> 
> Problem found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.

Paolo

> ---
>  arch/x86/kvm/ioapic.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/ioapic.c b2/arch/x86/kvm/ioapic.c
> index 28146f0..09828e2 100644
> --- a/arch/x86/kvm/ioapic.c
> +++ b2/arch/x86/kvm/ioapic.c
> @@ -637,11 +637,9 @@ void kvm_ioapic_destroy(struct kvm *kvm)
>  	struct kvm_ioapic *ioapic = kvm->arch.vioapic;
>  
>  	cancel_delayed_work_sync(&ioapic->eoi_inject);
> -	if (ioapic) {
> -		kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &ioapic->dev);
> -		kvm->arch.vioapic = NULL;
> -		kfree(ioapic);
> -	}
> +	kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &ioapic->dev);
> +	kvm->arch.vioapic = NULL;
> +	kfree(ioapic);
>  }
>  
>  int kvm_get_ioapic(struct kvm *kvm, struct kvm_ioapic_state *state)
> 
