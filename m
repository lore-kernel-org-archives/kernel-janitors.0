From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 23 Jan 2015 17:50:41 +0000
Subject: Re: [patch] KVM: always initialize *pdata in get_msr()
Message-Id: <54C289F1.7000009@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150123143232.GA4298@mwanda>
In-Reply-To: <20150123143232.GA4298@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Gleb Natapov <gleb@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org



On 23/01/2015 15:32, Dan Carpenter wrote:
> Smatch complains that there are some paths where we use uninitialized
> data in em_sysenter().
> 
>         arch/x86/kvm/emulate.c:2410 em_sysenter()
>         error: potentially using uninitialized 'msr_data'.

The right thing to do is to ensure that the value is set if get_msr
returns 0.  If it returns 1, msr_data is not used.

This one is obviously a false positive, so I'm not applying the patch
for now.

Paolo

> A couple examples of paths which don't set "pdata" are found in
> get_msr_hyperv() and kvm_x2apic_msr_read().  I looked at this code and
> it seems like setting it to zero is a common default behaviour.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis only, not from real life.
