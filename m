From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Wed, 10 Jun 2020 08:32:55 +0000
Subject: Re: [PATCH] kvm: i8254: remove redundant assignment to pointer s
Message-Id: <875zbzb9s8.fsf@vitty.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200609233121.1118683-1-colin.king@canonical.com>
In-Reply-To: <20200609233121.1118683-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer s is being assigned a value that is never read, the
> assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

It seems it wasn't used since the very beginning,

Fixes: 7837699fa6d7 ("KVM: In kernel PIT model")

QEMU code (from where KVM's implementation originates), however, 
does make use of 's' here as it open codes pit_latch_status().

> ---
>  arch/x86/kvm/i8254.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
> index febca334c320..a6e218c6140d 100644
> --- a/arch/x86/kvm/i8254.c
> +++ b/arch/x86/kvm/i8254.c
> @@ -462,7 +462,6 @@ static int pit_ioport_write(struct kvm_vcpu *vcpu,
>  		if (channel = 3) {
>  			/* Read-Back Command. */
>  			for (channel = 0; channel < 3; channel++) {
> -				s = &pit_state->channels[channel];
>  				if (val & (2 << channel)) {
>  					if (!(val & 0x20))
>  						pit_latch_count(pit, channel);

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly
