From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 May 2017 21:26:54 +0000
Subject: [PATCH] KVM: irqchip: make a variable unsigned
Message-Id: <20170519212654.tg6ilfod6n5pqrb6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andre Przywara <andre.przywara@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, David Hildenbrand <david@redhat.com>, Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

This doesn't change runtime behavior, but we're passing u32 values to
here so let's make everything consistent.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8c0664309815..e9ee5f17ae8d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -875,7 +875,7 @@ struct kvm_irq_ack_notifier {
 };
 
 int kvm_irq_map_gsi(struct kvm *kvm,
-		    struct kvm_kernel_irq_routing_entry *entries, int gsi);
+		    struct kvm_kernel_irq_routing_entry *entries, u32 gsi);
 int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin);
 
 int kvm_set_irq(struct kvm *kvm, int irq_source_id, u32 irq, int level,
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index 31e40c9e81df..493a7cdba1d7 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -32,7 +32,8 @@
 #include "irq.h"
 
 int kvm_irq_map_gsi(struct kvm *kvm,
-		    struct kvm_kernel_irq_routing_entry *entries, int gsi)
+		    struct kvm_kernel_irq_routing_entry *entries,
+		    u32 gsi)
 {
 	struct kvm_irq_routing_table *irq_rt;
 	struct kvm_kernel_irq_routing_entry *e;
