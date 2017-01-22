From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:09:58 +0000
Subject: [PATCH 0/9] KVM: Fine-tuning for several function implementations
Message-Id: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 19:06:54 +0100

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  Return directly after a failed copy_from_user() in kvm_vm_compat_ioctl()
  Move error code settings in kvm_vm_ioctl()
  Move error code settings in kvm_vcpu_compat_ioctl()
  Move error code settings in kvm_vcpu_ioctl()
  Improve size determinations in kvm_vcpu_ioctl()
  Return an error code only as a constant in kvm_get_dirty_log_protect()
  Return an error code only as a constant in kvm_get_dirty_log()
  Adjust seven checks for null pointers
  Improve another size determination in kvm_create_vm()

 virt/kvm/kvm_main.c | 278 +++++++++++++++++++++++-----------------------------
 1 file changed, 120 insertions(+), 158 deletions(-)

-- 
2.11.0

