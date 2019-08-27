From: Sean Christopherson <sean.j.christopherson@intel.com>
Date: Tue, 27 Aug 2019 13:39:45 +0000
Subject: Re: [PATCH] x86: KVM: svm: Fix a check in nested_svm_vmrun()
Message-Id: <20190827133945.GA27459@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827093852.GA8443@mwanda>
In-Reply-To: <20190827093852.GA8443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 27, 2019 at 12:38:52PM +0300, Dan Carpenter wrote:
> We refactored this code a bit and accidentally deleted the "-" character
> from "-EINVAL".  The kvm_vcpu_map() function never returns positive
> EINVAL.
> 
> Fixes: c8e16b78c614 ("x86: KVM: svm: eliminate hardcoded RIP advancement from vmrun_interception()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Sean Christopherson <sean.j.christopherson@intel.com>
