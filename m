From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 23 Jan 2017 09:22:18 +0000
Subject: Re: [PATCH 0/9] KVM: Fine-tuning for several function implementations
Message-Id: <5e40aa05-ccdf-0995-e1c4-a331d1da998a@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 22/01/2017 19:09, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Jan 2017 19:06:54 +0100
> 
> Several update suggestions were taken into account
> from static source code analysis.

Patches 1, 6 and 7 are acceptable.  The others are useless churn or they
make the result uselessly different from the rest of KVM code.

Paolo

> Markus Elfring (9):
>   Return directly after a failed copy_from_user() in kvm_vm_compat_ioctl()
>   Move error code settings in kvm_vm_ioctl()
>   Move error code settings in kvm_vcpu_compat_ioctl()
>   Move error code settings in kvm_vcpu_ioctl()
>   Improve size determinations in kvm_vcpu_ioctl()
>   Return an error code only as a constant in kvm_get_dirty_log_protect()
>   Return an error code only as a constant in kvm_get_dirty_log()
>   Adjust seven checks for null pointers
>   Improve another size determination in kvm_create_vm()
> 
>  virt/kvm/kvm_main.c | 278 +++++++++++++++++++++++-----------------------------
>  1 file changed, 120 insertions(+), 158 deletions(-)
> 
