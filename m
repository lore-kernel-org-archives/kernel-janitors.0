From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Nov 2019 08:26:36 +0000
Subject: [PATCH] kvm: Fix NULL dereference doing kvm_create_vm()
Message-Id: <20191106082636.GB31923@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Junaid Shahid <junaids@google.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

If init_srcu_struct() or init_srcu_struct() fails then this function
returns ERR_PTR(0) which is NULL.  It leads to a NULL dereference in the
caller.

Fixes: 9121923c457d ("kvm: Allocate memslots and buses before calling kvm_arch_init_vm")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 virt/kvm/kvm_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d16d2054e937..91971811fa5f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -675,6 +675,7 @@ static struct kvm *kvm_create_vm(unsigned long type)
 	INIT_HLIST_HEAD(&kvm->irq_ack_notifier_list);
 #endif
 
+	r = -ENOMEM;
 	if (init_srcu_struct(&kvm->srcu))
 		goto out_err_no_srcu;
 	if (init_srcu_struct(&kvm->irq_srcu))
-- 
2.20.1
