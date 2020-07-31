From: Sean Christopherson <sean.j.christopherson@intel.com>
Date: Fri, 31 Jul 2020 20:18:59 +0000
Subject: Re: [PATCH] KVM: SVM: Fix sev_pin_memory() error handling
Message-Id: <20200731201859.GF31451@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714142351.GA315374@mwanda>
In-Reply-To: <20200714142351.GA315374@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 14, 2020 at 05:23:51PM +0300, Dan Carpenter wrote:
> The sev_pin_memory() function was modified to return error pointers
> instead of NULL but there are two problems.  The first problem is that
> if "npages" is zero then it still returns NULL.  Secondly, several of
> the callers were not updated to check for error pointers instead of
> NULL.
> 
> Either one of these issues will lead to an Oops.
> 
> Fixes: a8d908b5873c ("KVM: x86: report sev_pin_memory errors with PTR_ERR")

Explicit Cc: to stable needed for KVM patches.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Sean Christopherson <sean.j.christopherson@intel.com>
