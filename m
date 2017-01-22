From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:19:02 +0000
Subject: [PATCH 9/9] KVM: Improve another size determination in kvm_create_vm()
Message-Id: <3de25179-996a-1fc9-2cdd-80f0e524486a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:56:26 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4267a2c6f2aa..0feefe45aa21 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -651,8 +651,7 @@ static struct kvm *kvm_create_vm(unsigned long type)
 	if (init_srcu_struct(&kvm->irq_srcu))
 		goto out_err_no_irq_srcu;
 	for (i = 0; i < KVM_NR_BUSES; i++) {
-		kvm->buses[i] = kzalloc(sizeof(struct kvm_io_bus),
-					GFP_KERNEL);
+		kvm->buses[i] = kzalloc(sizeof(*kvm->buses[i]), GFP_KERNEL);
 		if (!kvm->buses[i])
 			goto out_err;
 	}
-- 
2.11.0

